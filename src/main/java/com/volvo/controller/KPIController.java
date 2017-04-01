package com.volvo.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.volvo.dao.KPICategoryDAO;
import com.volvo.dao.KPISubCategoryDAO;
import com.volvo.dao.KeyPerformanceIndicatorDAO;
import com.volvo.entity.KPICategory;
import com.volvo.entity.KPISubCategory;
import com.volvo.entity.KeyPerformanceIndicator;
import com.volvo.entity.Metric;

@Controller
public class KPIController {

	static final Logger logger = Logger.getLogger(KPIController.class);

	@Autowired
	private KeyPerformanceIndicatorDAO keyPerformanceIndicatorDAO;

	@Autowired
	private KPICategoryDAO kpiCategoryDAO;

	@Autowired
	private KPISubCategoryDAO kpiSubCategoryDAO;

	@RequestMapping(value = "/kpi", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpSession httpSession) {
		logger.info("creating index page");
		model.addAttribute("locale", LocaleContextHolder.getLocale());
		model.addAttribute("kpiObj", new KeyPerformanceIndicator());
		model.addAttribute("allKPI", keyPerformanceIndicatorDAO.findAll());
		model.addAttribute("kpiCategoryData", kpiCategoryDAO.findAll());
		model.addAttribute("kpiSubCategoryData", kpiSubCategoryDAO.findAll());
		KeyPerformanceIndicator kpi = new KeyPerformanceIndicator();
		model.addAttribute("kpiTypeData", kpi.getOrgLevelData());
		return "kpi";
	}

	@RequestMapping(value = "/kpi", method = RequestMethod.POST)
	public String indexSubmit(@ModelAttribute("kpiObj") KeyPerformanceIndicator kpiObj, BindingResult bindingResult,
			Locale locale, Model model, HttpSession httpSession) {
		logger.info("retrieved object " + kpiObj.toString());
		logger.info("saving kpi object to the database");
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.YEAR, 2017);
		kpiObj.setDate(calendar.getTime());
		List<KPICategory> kpiCatList = kpiCategoryDAO.findAll();
		kpiObj.setKpiCategory(kpiCatList.get(0));
		List<KPISubCategory> kpiSubCatList = kpiSubCategoryDAO.findAll();
		kpiObj.setKpiSubCategory(kpiSubCatList.get(0));
		keyPerformanceIndicatorDAO.save(kpiObj);
		return "redirect:/kpi";
	}

	@RequestMapping(value = "/kpi/{id}")
	public String indexSubmit(@PathVariable("id") int id) {
		logger.info("retrieved id " + id);
		KeyPerformanceIndicator data = keyPerformanceIndicatorDAO.findById(id);
		logger.info("deleting the kpi  " + data.toString());
		keyPerformanceIndicatorDAO.delete(data);
		return "redirect:/kpi";
	}

}

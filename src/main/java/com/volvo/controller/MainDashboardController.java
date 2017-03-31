package com.volvo.controller;

import com.volvo.dao.MetricDAO;
import com.volvo.domain.MainDashboardDomain;
import com.volvo.entity.Metric;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

@Controller
public class MainDashboardController {

	static final Logger logger = Logger.getLogger(MainDashboardController.class);
	private static String[] yearData = { "2016", "2017" };
	private static Map<Integer, String> monthData = new TreeMap<Integer, String>();
	private static Map<String, String> valueTypeData = new TreeMap<String, String>();
	private static Map<String, String> plantRegionData = new TreeMap<String, String>();
	private static Map<String, String> orgLevelData = new TreeMap<String, String>();

	// static initializer
	static {
		monthData.put(new Integer(1), "January");
		monthData.put(new Integer(2), "February");
		monthData.put(new Integer(3), "February");
		monthData.put(new Integer(4), "April");
		monthData.put(new Integer(5), "May");
		monthData.put(new Integer(6), "June");
		monthData.put(new Integer(7), "July");
		monthData.put(new Integer(8), "August");
		monthData.put(new Integer(9), "September");
		monthData.put(new Integer(10), "October");
		monthData.put(new Integer(11), "November");
		monthData.put(new Integer(12), "December");

		valueTypeData.put("ISO", "ISO");
		valueTypeData.put("YTD", "YTD");
		valueTypeData.put("AVG", "AVG");
		valueTypeData.put("FULLYEAR", "FULLYEAR");

		plantRegionData.put("VBC", "VBC");
		plantRegionData.put("BRGM", "BRGM");
		plantRegionData.put("GRE", "GRE");
		plantRegionData.put("BRI", "BRI");
		plantRegionData.put("BRA", "BRA");

		orgLevelData.put("WROCLAW", "WROCLAW");
		orgLevelData.put("MEXICO", "MEXICO");
		orgLevelData.put("ST. CLAIRE", "ST. CLAIRE");
	}

	@Autowired
	private MessageSource messageSource;


	@Autowired
	private MetricDAO metricDAO;

	@RequestMapping(value = "/maindashboard", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpSession httpSession) {
		logger.info("creating index page");
		MainDashboardDomain sessionObject = (MainDashboardDomain) httpSession.getAttribute("dashboard");
		MainDashboardDomain dashboard;
		if (sessionObject != null)
			dashboard = sessionObject;
		else
			dashboard = new MainDashboardDomain();
		model.addAttribute("locale", LocaleContextHolder.getLocale());
		model.addAttribute("dashboard", dashboard);
		model.addAttribute("yearData", yearData);
		model.addAttribute("monthData", monthData);
		model.addAttribute("valueTypeData", valueTypeData);
		model.addAttribute("plantRegionData", plantRegionData);
		model.addAttribute("orgLevelData", orgLevelData);
		//Target t = new Target(new KPISubCategory("Lost Time Accident Rate",new KPICategory("Safety"),new Metric("accidents/hours worked x 20 0000")),5.0);
		Metric m = new Metric("aa");

		metricDAO.save(m);
		m.setName("b");
		metricDAO.update(m);
		metricDAO.delete(m);
		Metric m3 = new Metric("vv");
		metricDAO.save(m3);
		Metric m2 = metricDAO.findById(m3.getId());
		System.out.println(m2);
		System.out.println(metricDAO.findAll());
		System.out.println(metricDAO.count());

		httpSession.removeAttribute("dashboard");
		return "maindashboard";
	}

	@RequestMapping(value = "/maindashboard", method = RequestMethod.POST)
	public String indexSubmit(@ModelAttribute("dashboard") MainDashboardDomain dashboard, BindingResult bindingResult,
			Locale locale, Model model, HttpSession httpSession) {
		logger.info("retrieved object " + dashboard.toString());
		httpSession.setAttribute("dashboard", dashboard);
		return "redirect:/maindashboard";
	}

}

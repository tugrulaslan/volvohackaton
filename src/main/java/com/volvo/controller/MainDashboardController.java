package com.volvo.controller;

import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.volvo.domain.MainDashboardDomain;

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

	@RequestMapping(value = "/maindashboard", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("creating index page");
		MainDashboardDomain dashboard = new MainDashboardDomain();
		model.addAttribute("locale", LocaleContextHolder.getLocale());
		model.addAttribute("dashboard", dashboard);
		model.addAttribute("yearData", yearData);
		model.addAttribute("monthData", monthData);
		model.addAttribute("valueTypeData", valueTypeData);
		model.addAttribute("plantRegionData", plantRegionData);
		model.addAttribute("orgLevelData", orgLevelData);
		return "maindashboard";
	}

	@RequestMapping(value = "/maindashboard", method = RequestMethod.POST)
	public String indexSubmit(@RequestParam(value = "selectedValue") String param, @ModelAttribute("dashboard") MainDashboardDomain dashboardDomain, BindingResult result,
			SessionStatus status, Locale locale, Model model) {
		logger.info("retrieved object " + dashboardDomain.toString());
		return "maindashboard";
	}

}

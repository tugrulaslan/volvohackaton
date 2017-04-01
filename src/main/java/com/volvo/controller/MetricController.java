package com.volvo.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.volvo.dao.MetricDAO;
import com.volvo.entity.Metric;

@Controller
public class MetricController {

	static final Logger logger = Logger.getLogger(MetricController.class);

	@Autowired
	private MetricDAO metricDAO;

	@RequestMapping(value = "/metrics", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpSession httpSession) {
		logger.info("creating metric page");
		model.addAttribute("metric", new Metric());
		model.addAttribute("metricData", metricDAO.findAll());
		return "metrics";
	}

	@RequestMapping(value = "/metrics", method = RequestMethod.POST)
	public String indexSubmit(@ModelAttribute("metric") Metric metric, BindingResult bindingResult, Locale locale,
			Model model, HttpSession httpSession) {
		logger.info("retrieved object " + metric.toString());
		logger.info("saving the metric to db");
		metricDAO.save(metric);
		return "redirect:/metrics";
	}

	@RequestMapping(value = "/metrics/{id}")
	public String indexSubmit(@PathVariable("id") int id) {
		logger.info("retrieved id " + id);
		Metric entity = metricDAO.findById(id);
		logger.info("deleting the metric  " + entity.toString());
		metricDAO.delete(entity);
		return "redirect:/metrics";
	}
}

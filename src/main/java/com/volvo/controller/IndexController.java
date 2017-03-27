package com.volvo.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

	@Autowired
	private MessageSource messageSource;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		String welcome = messageSource.getMessage("welcome.message", new Object[] { "Tugrul" }, locale);
		model.addAttribute("message", welcome);

		Locale currentLocale = LocaleContextHolder.getLocale();
		model.addAttribute("locale", currentLocale);
		model.addAttribute("language", locale.getLanguage());

		return "index";
	}
}

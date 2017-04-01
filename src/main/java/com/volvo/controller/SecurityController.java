package com.volvo.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.volvo.entity.Role;
import com.volvo.entity.User;
import com.volvo.security.SecurityRoles;
import com.volvo.service.AppService;
import com.volvo.service.SecurityService;

@Controller
public class SecurityController {

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private AppService appService;

	@Autowired
	private SecurityService securityService;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
		final String encryptedPass = bCryptPasswordEncoder.encode(userForm.getPassword());
		userForm.setPassword(encryptedPass);
		Role role = new Role();
		role.setName(SecurityRoles.ROLE_USER.name());
		Set<User> users = new HashSet<>();
		users.add(userForm);
		role.setUsers(users);
		appService.save(role);
		Set<Role> roles = new HashSet<>();
		roles.add(role);
		userForm.setRoles(roles);
		appService.save(userForm);
		securityService.autologin(userForm.getUsername(), userForm.getPassword());

		return "redirect:/maindashboard";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

}

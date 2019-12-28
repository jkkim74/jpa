package com.jk.ktMembership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class ComController {
	
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}

}

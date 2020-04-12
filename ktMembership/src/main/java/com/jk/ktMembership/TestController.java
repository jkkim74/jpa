package com.jk.ktMembership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/callback")
	public String callbacktest() {
		return "callBackTest";
	}

}

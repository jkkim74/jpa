package com.jk.ktMembership;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class KtMembershipApplication extends SpringBootServletInitializer {
	
	@GetMapping("/test")
	public String test() {
		return "test";
	}

	public static void main(String[] args) {
		SpringApplication.run(KtMembershipApplication.class, args);
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(KtMembershipApplication.class);
	}
}

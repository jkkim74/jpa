package com.jk.ktMembership;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/info")
public class AppController<T> {
	
	
	@GetMapping("/delete")
	public void delete() {
		System.out.println("=============== Delete Process =============");
	}
	
	@GetMapping("/create")
	public void create() {
		System.out.println("=============== Create Process =============");
	}
	
	@GetMapping("/update")
	public void update() {
		System.out.println("=============== update Process =============");
	}
	
	@GetMapping("/list")
	public List<T> list() {
		System.out.println("=============== List Process =============");
		List<T> object = null;
		return object;
	}

}

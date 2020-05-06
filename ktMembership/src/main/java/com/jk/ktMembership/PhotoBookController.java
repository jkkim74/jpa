package com.jk.ktMembership;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/photoBook")
public class PhotoBookController {
	
	@GetMapping("/order/main")
	public String orderView(@RequestParam String projectId,  
			                @RequestParam String imgUrl) {
		
		return "";
	}
	
	
	
	

}

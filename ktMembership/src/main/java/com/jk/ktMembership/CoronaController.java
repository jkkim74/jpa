package com.jk.ktMembership;

import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/corona")
public class CoronaController {
	
	@GetMapping("/mask")
	public String getMaskInfo(ModelMap model) throws Exception {
		//String encAdress = URLEncoder.encode("경기도 성남시 분당구","UTF-8");
		String maskInfo = RestTemplateUtil.getJsonRsponse("경기도 성남시 분당구");
		JSONParser jsonParser = new JSONParser(); 
		JSONObject jsonObject = (JSONObject) jsonParser.parse(maskInfo); 
		model.addAttribute("maskInfo", jsonObject);
		return "corona/maskInfo";
	}

}

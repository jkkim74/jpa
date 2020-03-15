package com.jk.ktMembership;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/corona")
public class CoronaController {
	
	@RequestMapping(value="/popup/jusoPopup",method= {RequestMethod.GET,RequestMethod.POST})
	public String getJuso(ModelMap model) throws Exception {
		return "corona/jusoPopup";
	}
	
	@PostMapping("/mask")
	public String getMaskInfo(@RequestParam String roadAddrPart1,ModelMap model) throws Exception {
		//String encAdress = URLEncoder.encode("경기도 성남시 분당구","UTF-8");
		String maskInfo = RestTemplateUtil.getJsonRsponse(roadAddrPart1);
		JSONParser jsonParser = new JSONParser(); 
		JSONObject jsonObject = (JSONObject) jsonParser.parse(maskInfo); 
		model.addAttribute("maskInfo", jsonObject);
		return "corona/maskInfo";
	}
	
	@GetMapping("/maskMain")
	public String getMaskMain(ModelMap model) throws Exception {
		return "corona/maskInfo";
	}

}

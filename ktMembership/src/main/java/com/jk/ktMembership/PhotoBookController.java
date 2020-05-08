package com.jk.ktMembership;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/webview/photobook")
public class PhotoBookController {
	
	String filePath = "photobook/";
	
	@GetMapping("/order/main")
	public String orderMain(Model model) {
		
		List<Map<String,Object>> dvlInfoList = new ArrayList<>();
		int i = 0;
		
		while(i < 5) {
			Map<String,Object> dvlInfo = new HashMap<>();
			dvlInfo.put("seq", i);
			dvlInfo.put("dvlName", "김재기");
			dvlInfo.put("dvlTel", "01083304136");
			dvlInfo.put("postNo", "345678");
			dvlInfo.put("addr1", "경기도 성남시 분당구 금곡동");
			dvlInfo.put("addr2", "청솔주공9단지 905-603");
			dvlInfoList.add(dvlInfo);
			i++;
		}
		
		
		
		model.addAttribute("photoBookName", "TEST PhotoBook");
		model.addAttribute("dvlInfoList", dvlInfoList);
		
		return filePath+"orderMain";
	}
	
	@PostMapping("/order/view")
    public String orderPreview(@RequestParam Map<String, Object> paramMap, Model model) {
    	//Map<String, Object> resultMap = new HashMap<String, Object>();
    	System.out.println(paramMap);
    	// {name=kim, age=30} 출력
    	String fullAddrList = (String)paramMap.get("fullAddrList");
    	String[] arrAddress = fullAddrList.split(",");
    	List<Map<String,Object>> dvlInfoList = new ArrayList<>();
    	for(String address : arrAddress) {
    		String[] arrAddressInfo = address.split(";");
    		
    		Map<String,Object> dvlInfo = new HashMap<>();
			dvlInfo.put("seq", arrAddressInfo[0]);
			dvlInfo.put("dvlName", arrAddressInfo[1]);
			dvlInfo.put("dvlTel", arrAddressInfo[2]);
			dvlInfo.put("postNo", arrAddressInfo[3]);
			dvlInfo.put("addr1", arrAddressInfo[4]);
			dvlInfo.put("addr2", arrAddressInfo[5]);
			dvlInfoList.add(dvlInfo);
    	}
    	model.addAttribute("photoBookName", paramMap.get("photoBookName"));
    	model.addAttribute("useCnt", paramMap.get("useCnt"));
    	model.addAttribute("addMoney", paramMap.get("addMoney"));
		model.addAttribute("dvlInfoList", dvlInfoList);
		model.addAttribute("fullAddrList", fullAddrList);
    	return filePath+"orderPreview";
    }
	
	
	
	

}

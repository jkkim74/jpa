package com.jk.ktMembership;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk.ktMembership.dao.LoyaltyDao;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/webview/photobook")
public class PhotoBookController {
	
	@Autowired
	LoyaltyDao loyaltyDao;
	
	String filePath = "photobook/";
	
	@GetMapping("/order/main")
	public String orderMain(Model model) {
		
		List<Map<String, Object>> dvlInfoList = loyaltyDao.getDvlInfoList();
		
		model.addAttribute("photoBookName", "TEST PhotoBook");
		model.addAttribute("dvlInfoList", dvlInfoList);
		
		return filePath+"orderMain";
	}
	
	@PostMapping("/order/view")
    public String orderPreview(@RequestParam Map<String, Object> paramMap, Model model) throws Exception {
    	//Map<String, Object> resultMap = new HashMap<String, Object>();
    	System.out.println(paramMap);
    	// {name=kim, age=30} 출력
//    	String fullAddrList = (String)paramMap.get("fullAddrList");
//    	JSONParser jsonParser = new JSONParser();
//    	   System.out.println(fullAddrList);
//    	JSONObject jsonObject = (JSONObject) jsonParser.parse(fullAddrList);
//        List<Map<String,Object>> dvlInfoList = new ArrayList<>();
//        Map<String,Object> addrMap = (Map<String,Object>)jsonObject;
//    
//        List<Object> list = new ArrayList<Object>(addrMap.values());
//       // list.stream().sorted();
//        for(Object object : list) {
//        	List<String> arrAddress = (List<String>)object;
//    		Map<String,Object> dvlInfo = new HashMap<>();
//			dvlInfo.put("seq", arrAddress.get(0));
//			dvlInfo.put("dvlName", arrAddress.get(1));
//			dvlInfo.put("dvlTel", arrAddress.get(2));
//			dvlInfo.put("postNo", arrAddress.get(3));
//			dvlInfo.put("addr1", arrAddress.get(4));
//			dvlInfo.put("addr2", arrAddress.get(5));
//			dvlInfoList.add(dvlInfo);
//        	 
//        }
//      
//    	model.addAttribute("photoBookName", paramMap.get("photoBookName"));
//    	model.addAttribute("useCnt", paramMap.get("useCnt"));
//    	model.addAttribute("addMoney", paramMap.get("addMoney"));
//		model.addAttribute("dvlInfoList", dvlInfoList);
//		model.addAttribute("fullAddrList", fullAddrList);
    	model.addAttribute("paramMap", paramMap);
    	return filePath+"orderPreview2";
    }
	
	@SuppressWarnings("unchecked")
	@PostMapping("/order/process")
    public ModelMap orderProcess(@RequestParam Map<String, Object> paramMap, Model model) throws Exception {
		ModelMap ret = new ModelMap();
		
    	String fullAddrList = (String)paramMap.get("fullAddrList");
    	JSONParser jsonParser = new JSONParser();
    	   System.out.println(fullAddrList);
    	JSONObject jsonObject = (JSONObject) jsonParser.parse(fullAddrList);
        List<Map<String,Object>> dvlInfoList = new ArrayList<>();
        Map<String,Object> addrMap = (Map<String,Object>)jsonObject;
    
        List<Object> list = new ArrayList<Object>(addrMap.values());
       // list.stream().sorted();
        for(Object object : list) {
        	List<String> arrAddress = (List<String>)object;
    		Map<String,Object> dvlInfo = new HashMap<>();
			dvlInfo.put("seq", arrAddress.get(0));
			dvlInfo.put("dvlName", arrAddress.get(1));
			dvlInfo.put("dvlTel", arrAddress.get(2));
			dvlInfo.put("postNo", arrAddress.get(3));
			dvlInfo.put("addr1", arrAddress.get(4));
			dvlInfo.put("addr2", arrAddress.get(5));
			dvlInfoList.add(dvlInfo);
        	 
        }
		
		return ret;
	}
	
	
	@GetMapping("/order/addressPop")
	public String addressPop(@RequestParam String idx,@RequestParam String seq, Model model) {
		
		List<Map<String,Object>> dvlInfoList = new ArrayList<>();
		int i = 0;
		
		while(i < 5) {
			Map<String,Object> dvlInfo = new HashMap<>();
			dvlInfo.put("seq", i);
			dvlInfo.put("dvlName", "윤은혜");
			dvlInfo.put("dvlTel", "01059198201");
			dvlInfo.put("postNo", "123456");
			dvlInfo.put("addr1", "경기도 성남시 분당구 정자동");
			dvlInfo.put("addr2", "파크뷰");
			dvlInfoList.add(dvlInfo);
			i++;
		}
		
		
		model.addAttribute("dvlInfoList", dvlInfoList);
		model.addAttribute("targIdx", idx);
		model.addAttribute("seq", seq);
		return filePath+"addressPop";
	}
	
	
	@GetMapping("/order/inputAddressPop")
	public String inputAddressPop(@RequestParam String idx,@RequestParam String seq, Model model) {
		model.addAttribute("targIdx", idx);
		model.addAttribute("seq", seq);
		return filePath+"inputAddressPop";
	}
	
	
	
	

}

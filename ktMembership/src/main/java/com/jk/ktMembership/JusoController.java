package com.jk.ktMembership;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JusoController {
	
    @RequestMapping(value = "/popup/jusoPopup", method = {RequestMethod.GET, RequestMethod.POST})
    public String getJuso(ModelMap model) throws Exception {
        return "popup/jusoPopup";
    }
    
    @RequestMapping(value = "/popup/sample", method = {RequestMethod.GET, RequestMethod.POST})
    public String getJusoSample(ModelMap model) throws Exception {
        return "popup/Sample";
    }

}

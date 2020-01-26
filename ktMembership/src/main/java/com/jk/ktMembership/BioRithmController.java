package com.jk.ktMembership;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/bio")
public class BioRithmController {

    @GetMapping("/detail/{mbrId}")
    public String getBioDetailInfo(@PathVariable String mbrId, Model model) {
        Date date = new Date();
        BioRithm bio = new BioRithm();
        ArrayList<Map<String,Object>> bioResult_today =  bio.displayPieChart(mbrId,date,"today");
        model.addAttribute("bioResult_today",JSONArray.fromObject(bioResult_today));
        
        ArrayList<Map<String,Object>> bioResult =  bio.displayPieChart(mbrId,date,"month");
        model.addAttribute("bioResult",JSONArray.fromObject(bioResult));
        
        date = getDateInfo(+1);
        ArrayList<Map<String,Object>> bioResult_next =  bio.displayPieChart(mbrId,date,"month");
        model.addAttribute("bioResult_next",JSONArray.fromObject(bioResult_next));
        
        date = getDateInfo(-1);
        ArrayList<Map<String,Object>> bioResult_prev =  bio.displayPieChart(mbrId,date,"month");
        model.addAttribute("bioResult_prev",JSONArray.fromObject(bioResult_prev));
        
        return "bioDetail";
    }
    
   public Date getDateInfo(int dt) {
	   Calendar cal = Calendar.getInstance( );
       cal.add (cal.MONTH, dt); //다음달
       //cal.add ( cal.MONTH, -1 ); 이전달
       return cal.getTime();
   }
}

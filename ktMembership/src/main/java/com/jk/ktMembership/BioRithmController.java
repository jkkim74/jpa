package com.jk.ktMembership;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;

import java.text.SimpleDateFormat;
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
        model.addAttribute("day",getToday());
        model.addAttribute("bioResult_today",JSONArray.fromObject(bioResult_today));
        
        model.addAttribute("seDate",getStartEndDate(date));
        ArrayList<Map<String,Object>> bioResult =  bio.displayPieChart(mbrId,date,"month");
        model.addAttribute("bioResult",JSONArray.fromObject(bioResult));
        
        date = getDateInfo(+1);
        model.addAttribute("seDate_next",getStartEndDate(date));
        ArrayList<Map<String,Object>> bioResult_next =  bio.displayPieChart(mbrId,date,"month");
        model.addAttribute("bioResult_next",JSONArray.fromObject(bioResult_next));
        
        date = getDateInfo(-1);
        model.addAttribute("seDate_prev",getStartEndDate(date));
        ArrayList<Map<String,Object>> bioResult_prev =  bio.displayPieChart(mbrId,date,"month");
        model.addAttribute("bioResult_prev",JSONArray.fromObject(bioResult_prev));
        
        return "bioDetail";
    }
    
   public Date getDateInfo(int dt) {
	   Calendar cal = Calendar.getInstance( );
       cal.add (Calendar.MONTH, dt); //다음달
       return cal.getTime();
   }
   
   public int getToday() {
	   SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	   Calendar cal = Calendar.getInstance( ); 
	   return Integer.parseInt(sf.format(cal.getTime()).substring(6,8));
   }
   
   public String getStartEndDate(Date date) {
	   SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
       int year = Integer.parseInt(sf.format(date).substring(0,4));
       int month = Integer.parseInt(sf.format(date).substring(4,6));
       Calendar cal = Calendar.getInstance();
       cal.set(Calendar.YEAR, year);
       cal.set(Calendar.MONTH, month); //입력받은 월로 세팅
       cal.set(year,month-1,1); //입력받은 월의 1일로 세팅
       int end = cal.getActualMaximum(Calendar.DATE); //해당 월 마지막 날짜
       String strYearMonth = sf.format(date).substring(0,6);
       String startEndDate   = strYearMonth+"01"+";"+strYearMonth+end;
	   return startEndDate;
   }
}

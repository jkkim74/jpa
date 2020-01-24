package com.jk.ktMembership;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/bio")
public class BioRithmController {

    @GetMapping("/detail/{mbrId}")
    public String getBioDetailInfo(@PathVariable String mbrId, Model model) {
        Date date = new Date();
        BioRithm bio = new BioRithm();
        ArrayList<Map<String,Object>> bioResult =  bio.displayPieChart("19740610",date);
        model.addAttribute("bioResult",JSONArray.fromObject(bioResult));
        return "bioDetail";
    }
}

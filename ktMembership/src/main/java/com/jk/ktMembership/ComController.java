package com.jk.ktMembership;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class ComController {

    @Autowired
    private LoginRepository loginRepository;


    @GetMapping("/login")
    public String login() {
        List<Login> loginList = loginRepository.findAll();
        System.out.println(loginList.size());
        System.out.println(loginList.size());
        System.out.println(loginList.size());
        System.out.println(loginList.size());
        System.out.println(loginList.size());
        System.out.println(loginList.size());
        System.out.println(loginList.size());
        return "login";
    }

}

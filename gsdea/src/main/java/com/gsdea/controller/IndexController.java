package com.gsdea.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@RequestMapping(value = "", method = GET)
	public String index(){
//		return "collapse";
		return "login";
	}
	
	@RequestMapping(value = "frame", method = GET)
	public String frame(){
		return "collapse";
	}
	@RequestMapping(value = "login", method = POST)
	public void login(HttpSession session,String username){
		session.setAttribute("user", username);
	}
	
	
}

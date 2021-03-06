package com.tbox.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tbox.dao.impl.UserDaoImpl;
import com.tbox.model.User;

@Controller
@RequestMapping("/")
public class UserController {
//	@Autowired
	UserDaoImpl ud ;
	//= new UserDaoImpl()

	@RequestMapping(value = "", method = GET)
	public String login(HttpSession session, HttpServletResponse response) throws IOException {
		if(session.getAttribute("user") == null){
			return "login";
		} else {
			response.sendRedirect("table");
			return null;
		}
		
	}

	@RequestMapping(value = "login", method = POST)
	public String login(User u, Model model, HttpServletResponse response, HttpSession session) throws IOException {
		session.setAttribute("user", u);
		response.sendRedirect("table");
		return null;

		// User uu = ud.findByUser(u);
		// if (uu == null) {
		// model.addAttribute("loginerr", "-1");
		// return "login";
		// } else {
		// session.setAttribute("user", uu);
		// response.sendRedirect("table/ensus");
		// return null;
		// }
	}

	@RequestMapping(value = "logout", method = GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "login";
	}

}

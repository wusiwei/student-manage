package wusw.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import wusw.entity.RequestResult;
import wusw.entity.User;
import wusw.service.UserService;
import wusw.util.UserUtil;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login.html", method = RequestMethod.GET)
	public String showUser(HttpServletRequest request) {
		return "login";
	}
	
	@RequestMapping(value="/student.html", method = RequestMethod.GET)
	public String showStudent(String userId,Model model) {
		return "student/student";
	}
	
	@RequestMapping(value="/manager.html", method = RequestMethod.GET)
	public String showManager(String userId,Model model) {
		return "manager/manager";
	}
	
	@ResponseBody
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public RequestResult login(User user){
		user.setCompetenceId(UserUtil.getUserCompetenceId(user.getUserCompetence()));
		RequestResult result=userService.checkUser(user);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/registered.do", method = RequestMethod.POST)
	public RequestResult registered(User user){
		RequestResult result=userService.insertUser(user);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyPassword.do", method = RequestMethod.POST)
	public RequestResult modifyPassword(User user){
		RequestResult result=userService.updateUserPassword(user);
		return result;
	}
}

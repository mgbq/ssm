package com.java.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.model.Userm;
import com.java.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/showUser")
	public String toIndex() {
		System.out.println("���뷽��");
		int userId = Integer.parseInt(request.getParameter("id"));
		Userm user = this.userService.selectByPrimaryKey(userId);
		System.out.println(user.getUsername());

		return "Showssm";
	}

	// ע���ж��û����Ƿ����
	@RequestMapping(value = "/registeryz", method = RequestMethod.POST)
	public @ResponseBody
	Userm register() {
		System.out.println("������֤����");
		Userm user = new Userm();
		String name = request.getParameter("username");
		System.out.println(name);
		user = userService.selectByname(name);
		return user;
	}

	// ע���û�
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public @ResponseBody
	Userm Userregister() {
		System.out.println("����ע�᷽��");
		Userm user = new Userm();
		System.out.println(request.getParameter("username"));
		user.setUsername(request.getParameter("username"));
		user.setSex(request.getParameter("sex"));
		user.setUserpassword(request.getParameter("userpassword"));
		int count = userService.insertUserm(user);
		if (count > 0) {
			return user;
		} else {
			return null;
		}
	}

	// �û���½
	@SuppressWarnings("unused")
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUserm(Userm user) {
		Userm user1 = userService.queryUser(user);
		request.getSession().setAttribute("user1", user1);
		System.out.println(user1.getSex());
		if (user1 != null) {
			return "index";
		} else {
			return "login";
		}
	}

	// �޸��û���Ϣ
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(Userm xuser) {

		Userm user = this.userService.selectByPrimaryKey(xuser.getUserid());
		user.setSex(xuser.getSex());
		user.setUserpassword(xuser.getUserpassword());
		user.setUsername(xuser.getUsername());
		int count = userService.updateUser(user);
		if (count > 0) {
			return "Showssm";
		} else {
			return "erro";
		}
	}

	// ɾ���û���
	@RequestMapping(value = "/delUser", method = RequestMethod.POST)
	public String delUser(Userm user) {
		int count = userService.delUser(Integer.parseInt(request.getParameter("userid")));
		if (count > 0) {
			return "login";
		} else {
			return "index";
		}
	}

}
package com.java.service;

import com.java.model.Userm;

public interface UserService {
	// 根据id查询名字的方法
	public Userm selectByPrimaryKey(int id);

	// 根据用户名查询用户的方法
	public Userm selectByname(String name);

	// 添加用户
	public int insertUserm(Userm userm);

	// 用户登陆
	public  Userm queryUser(Userm record);
	//修改用户信息
	public int updateUser(Userm userm);
	//删除用户账号
	public int delUser(int userid);

}

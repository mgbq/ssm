package com.java.service.iml;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.dao.UsermMapper;
import com.java.model.Userm;
import com.java.service.UserService;
@Service("userService")
public class UserServiceiml implements UserService {

	@Resource
	private UsermMapper Userdao;
	
	
	public Userm selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return Userdao.selectByPrimaryKey(id);
	}
	
	public Userm selectByname(String username) {
		// TODO Auto-generated method stub
		return Userdao.selectByname(username);
	}

	@Override
	public int insertUserm(Userm userm) {
		// TODO Auto-generated method stub
		
		return Userdao.insert(userm);
	}

	@Override
	public Userm queryUser(Userm record) {
		// TODO Auto-generated method stub
		return Userdao.queryUser(record);
	}

	@Override
	public int updateUser(Userm userm) {
		// TODO Auto-generated method stub
		return Userdao.updateByPrimaryKey(userm);
	}

	@Override
	public int delUser( int userid) {
		// TODO Auto-generated method stub
		return Userdao.deleteByPrimaryKey(userid);
	}

}

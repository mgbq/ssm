package com.java.dao;

import com.java.model.Userm;

public interface UsermMapper {
	int userid(Integer userid);

	int insert(Userm record);

	int insertSelective(Userm record);

	Userm selectByPrimaryKey(Integer userid);

	Userm queryUser(Userm record);

	int updateByPrimaryKeySelective(Userm record);

	Userm selectByname(String username);
    
	int deleteByPrimaryKey(int userid);

	int updateByPrimaryKey(Userm record);
}
package com.java.service;

import com.java.model.Userm;

public interface UserService {
	// ����id��ѯ���ֵķ���
	public Userm selectByPrimaryKey(int id);

	// �����û�����ѯ�û��ķ���
	public Userm selectByname(String name);

	// ����û�
	public int insertUserm(Userm userm);

	// �û���½
	public  Userm queryUser(Userm record);
	//�޸��û���Ϣ
	public int updateUser(Userm userm);
	//ɾ���û��˺�
	public int delUser(int userid);

}

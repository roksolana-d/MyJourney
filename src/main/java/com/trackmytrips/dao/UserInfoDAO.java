package com.trackmytrips.dao;

import java.util.List;

import com.trackmytrips.model.UserInfo;

public interface UserInfoDAO {
	
	 public UserInfo findUserInfo(String userName);
     
	// [USER,AMIN,..]
	public List<String> getUserRoles(String userName);
	     
}

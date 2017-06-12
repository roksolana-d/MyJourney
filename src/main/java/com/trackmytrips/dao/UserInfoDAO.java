package com.trackmytrips.dao;

import java.util.List;

import com.trackmytrips.model.UserInfo;

public interface UserInfoDAO {
	
	public UserInfo findUserInfo(String userName);
     
	public List<String> getUserRoles(String userName);
	
	public List<String> getVisitedCountries(String userName);
	     
	public List<String> getVisitedCities(String userName);
	
	public List<String> countVisitedCountries(String userName);
    
	public List<String> countVisitedCities(String userName);
}

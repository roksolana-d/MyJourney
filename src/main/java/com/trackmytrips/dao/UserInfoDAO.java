package com.trackmytrips.dao;

import java.util.List;

import com.trackmytrips.model.UserInfo;

public interface UserInfoDAO {
	
	public UserInfo findUserInfo(String userName);
     
	public List<String> getUserRoles(String userName);
	
	public String getDateOfBirth(String userName);
	
	public String getResidence(String userName);
	
	public String getSummary(String userName);
	
	public List<String> getNameSurname(String userName);
	
	public List<String> getVisitedCountries(String userName);
	     
	public List<String> getVisitedCities(String userName);
	
	public List<String> countVisitedCountries(String userName);
    
	public List<String> countVisitedCities(String userName);
}

package com.trackmytrips.dao;

import java.util.Date;
import java.util.List;

import com.trackmytrips.model.CountriesCitiesInfo;
import com.trackmytrips.model.UserInfo;

public interface UserInfoDAO {
	
	public UserInfo findUserInfo(String userName);
     
	public List<String> getUserRoles(String userName);
	
	public String getDateOfBirth(String userName);
	
	public String getSummary(String userName);
	
	public String getFirstName(String userName);
	
	public String getLastName(String userName);
	
	public String getResidence(String userName);
	
	public List<String> selectCountries(String userName);

	public List<String> selectCountriesIDs(String userName, String country);
	
	public List<String> selectCitiesIDs(String userName, String city);
	
	public List<String> selectCities(String userName);
	
	public List<String> getNameSurname(String userName);
	
	public List<String> getVisitedCountries(String userName);
	     
	public List<String> getVisitedCities(String userName);
	
	public List<String> countVisitedCountries(String userName);
    
	public List<String> countVisitedCities(String userName);
	
	public void editPersonalData(String fName, String lName, String res, Date date, String summary, String userName);
    
	public void editMainData(String userName, String password);
	
	public void editCountries(String userName, String country);
	
	public void editCities(String userName, String city);
	
	public void editFirstName(String userName, String fName);
	
	public boolean citiesCheck(String userName);
	
	public boolean countriesCheck(String userName);
	
	public CountriesCitiesInfo editCountriesMapper(String userName, String country);
	
	public CountriesCitiesInfo editCitiesMapper(String userName, String city);
}

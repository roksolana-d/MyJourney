package com.trackmytrips.daoimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import com.trackmytrips.dao.UserInfoDAO;
import com.trackmytrips.mapper.CountriesCitiesInfoMapper;
import com.trackmytrips.mapper.UserInfoMapper;
import com.trackmytrips.model.CountriesCitiesInfo;
import com.trackmytrips.model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserInfoDAOImpl extends JdbcDaoSupport implements UserInfoDAO {

	@Autowired
    public UserInfoDAOImpl(DataSource dataSource) {
        this.setDataSource(dataSource);
    }
  

    @Override
    public UserInfo findUserInfo(String userName) {
        String sql = "Select u.Username,u.Password "//
                + " from Users u where u.Username = ? ";
 
        Object[] params = new Object[] { userName };
        UserInfoMapper mapper = new UserInfoMapper();
        try {
            UserInfo userInfo = this.getJdbcTemplate().queryForObject(sql, params, mapper);
            return userInfo;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    } 

    @Override
    public List<String> getUserRoles(String userName) {
        String sql = "Select r.User_Role "
                + " from User_Roles r where r.Username = ? ";
         
        Object[] params = new Object[] { userName };
         
        List<String> roles = this.getJdbcTemplate().queryForList(sql,params, String.class);
         
        return roles;
    }

    private String getUserFirstName(String userName) {
        String sql = "select FirstName from Users where Username = ? ";
        
        Object[] params = new Object[] { userName };
         
        String firstName = (String)this.getJdbcTemplate().queryForObject(sql, params, String.class);
        return firstName;
    }

    private String getUserLastName(String userName) {
        String sql = "select LastName from Users where Username = ? ";
        
        Object[] params = new Object[] { userName };
         
        String lastName = (String)this.getJdbcTemplate().queryForObject(sql, params, String.class);
        return lastName;
    }

    @Override
    public List<String> getVisitedCountries(String userName){
    	String sql = "Select DISTINCT p.Country from Users_Places up "
    			+ " join Places p on up.PID = p.P_ID "
    			+ " join Users u on up.UID = u.U_ID "
    			+ " where u.Username = ? "
    			+ " order by p.Country;";
    	Object [] params = new Object[] { userName };
    	List<String> countries = this.getJdbcTemplate().queryForList(sql, params, String.class);
    	return countries;
    }

    @Override
    public List<String> getVisitedCities(String userName){
    	String sql = "Select DISTINCT p.City from Users_Places up "
    			+ " join Places p on up.PID = p.P_ID "
    			+ " join Users u on up.UID = u.U_ID "
    			+ " where u.Username = ? "
    			+ " order by p.City;";
    	Object [] params = new Object[] { userName };
    	List<String> cities = this.getJdbcTemplate().queryForList(sql, params, String.class);
    	return cities;
    }
    
    @Override
    public List<String> countVisitedCountries(String userName){
    	String sql = "Select COUNT(DISTINCT p.Country) from Users_Places up "
    			+ " join Places p on up.PID = p.P_ID "
    			+ " join Users u on up.UID = u.U_ID "
    			+ " where u.Username = ? "
    			+ " order by p.Country;";
    	Object [] params = new Object[] { userName };
    	List<String> countries = this.getJdbcTemplate().queryForList(sql, params, String.class);
    	return countries;
    }
    
    @Override
    public List<String> countVisitedCities(String userName){
    	String sql = "Select COUNT(DISTINCT p.City) from Users_Places up "
    			+ " join Places p on up.PID = p.P_ID "
    			+ " join Users u on up.UID = u.U_ID "
    			+ " where u.Username = ? "
    			+ " order by p.Country;";
    	Object [] params = new Object[] { userName };
    	List<String> cities = this.getJdbcTemplate().queryForList(sql, params, String.class);
    	return cities;
    }

	@Override
	public String getDateOfBirth(String userName) {
		String sql = "select 2017-u.Date_Of_Birth from Users u where u.Username = ? "; 
        Object[] params = new Object[] { userName };
         
        String date = (String)this.getJdbcTemplate().queryForObject(sql, params, String.class);
        return date;
	}

	@Override
	public String getResidence(String userName) {
		String sql = "select u.Residence from Users u where u.Username = ? "; 
        Object[] params = new Object[] { userName };
         
        String residence = (String)this.getJdbcTemplate().queryForObject(sql, params, String.class);
        return residence;
	}

	@Override
	public List<String> getNameSurname(String userName) {
		List<String> sum = new ArrayList<String>();
		sum.add(getUserFirstName(userName));
		sum.add(getUserLastName(userName));
		return sum;
	}

	@Override
	public String getSummary(String userName) {
		String sql = "select u.Summary from Users u where u.Username = ? "; 
        Object[] params = new Object[] { userName };         
        String summary = (String)this.getJdbcTemplate().queryForObject(sql, params, String.class);
        return summary;
	}


	@Override
	public List<String> selectCountries(String userName) {
		String sql = "select DISTINCT Country from Places "; 
        //Object[] params = new Object[] { userName };         
        List<String> allCountries = this.getJdbcTemplate().queryForList(sql, String.class);
		return allCountries;
	}


	@Override
	public List<String> selectCities(String userName) {
		String sql = "select DISTINCT City from Places "; 
        //Object[] params = new Object[] { userName };
         
        List<String> allCities = this.getJdbcTemplate().queryForList(sql, String.class);
		return allCities;
	}


	@Override
	public void editPersonalData(String fName, String lName, String res, Date date, String summary, String userName) {
		String sql = "update Users "
					+ " set FirstName = ?, LastName = ?, Residence = ?, Date_Of_Birth = ?, Summary = ?"
					+ " where Username = ?";
		Object[] params = new Object[] {fName, lName, res, date, summary, userName };
		this.getJdbcTemplate().update(sql, params);
	}


	@Override
	public void editMainData(String userName, String password) {
		String sql = "update Users "
				+ " set Username = ?, Password = ?"
				+ " where Username = ?";
		Object[] params = new Object[] {userName, password};
		this.getJdbcTemplate().update(sql, params);
	}


	@Override
	public void editCountries(String userName, String country) {
		String sql = "insert into Users_Places (Uid, Pid)"
					+ " values ((select U_ID from Users where Username = ? ),"
					+ "(select P_ID from Places where Country = ? ));";
		Object[] params = new Object[] {userName, country};
		this.getJdbcTemplate().update(sql, params);
	}


	@Override
	public void editCities(String userName, String city) {
		String sql = "insert into Users_Places (Uid, Pid)"
				+ " values ((select U_ID from Users where Username = ?),"
				+ "(select P_ID from Places where City = ? ));";
		Object[] params = new Object[] {userName, city};
		this.getJdbcTemplate().update(sql, params);
	}
	
	@Override
	public CountriesCitiesInfo editCountriesMapper(String userName, String country) {
		String sql = "insert into Users_Places (Uid, Pid)"
					+ " values ((select U_ID from Users where Username = ? ),"
					+ "(select P_ID from Places where Country = ? ));";
		Object[] params = new Object[] {userName, country};
		this.getJdbcTemplate().update(sql, params);
		
		CountriesCitiesInfoMapper mapper = new CountriesCitiesInfoMapper();
        try {
        	CountriesCitiesInfo ccInfo = this.getJdbcTemplate().queryForObject(sql, params, mapper);
            return ccInfo;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
	}


	@Override
	public CountriesCitiesInfo editCitiesMapper(String userName, String city) {
		String sql = "insert into Users_Places (Uid, Pid)"
				+ " values ((select U_ID from Users where Username = ?),"
				+ "(select P_ID from Places where City = ? ));";
		Object[] params = new Object[] {userName, city};
		this.getJdbcTemplate().update(sql, params);
		
		CountriesCitiesInfoMapper mapper = new CountriesCitiesInfoMapper();
        try {
        	CountriesCitiesInfo ccInfo = this.getJdbcTemplate().queryForObject(sql, params, mapper);
            return ccInfo;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
	}


	@Override
	public String getFirstName(String userName) {
		// TODO Auto-generated method stub		
		String sql = "select u.FirstName from Users u where u.Username = ? "; 
        Object[] params = new Object[] { userName };         
        String firstName = (String)getJdbcTemplate().queryForObject(sql, params, String.class);
        return firstName;
	}


	@Override
	public String getLastName(String userName) {
		// TODO Auto-generated method stub
		String sql = "select u.LastName from Users u where u.Username = ? "; 
        Object[] params = new Object[] { userName };         
        String lastName = (String)getJdbcTemplate().queryForObject(sql, params, String.class);
        return lastName;
	}

	@Override
	public void editFirstName(String userName, String fName){
		String sql = "update Users set FirstName = ? where Username = ?";
		Object[] params = new Object[] {fName, userName};
		this.getJdbcTemplate().update(sql, params);
	}
	
	@Override
	public List<String> selectCountriesIDs(String userName, String country) {
		String sql = " select PID from Users_Places up"
						 + " join Places p on up.PID = p.P_ID"
						 + " join Users u on up.UID = u.U_ID"
						 + "  where u.Username = ? AND Country = ? "; 
        Object[] params = new Object[] { userName ,country};
         
        List<String> countriesIDs = this.getJdbcTemplate().queryForList(sql, params, String.class);
		return countriesIDs;
	}


	@Override
	public List<String> selectCitiesIDs(String userName, String city) {
		String sql = " select PID from Users_Places up"
						 + " join Places p on up.PID = p.P_ID"
						 + " join Users u on up.UID = u.U_ID"
						 + "  where u.Username = ? AND City = ? "; 
        Object[] params = new Object[] { userName, city};
         
        List<String> citiesIDs = this.getJdbcTemplate().queryForList(sql, params, String.class);
		return citiesIDs;
	}
	
	@Override
	public boolean citiesCheck(List<String> cities, String userName){
		List<String> citiesIDs = new ArrayList<String>();
		boolean cityCh = false;

		for(String city : cities){
	    	citiesIDs = selectCitiesIDs(userName, city);
	    }
		
		if(citiesIDs != null){
	    	cityCh = true;
	    }else{
	    	cityCh = false;
	    }
		return cityCh;
	}
	
	@Override
	public boolean countriesCheck(List<String> countries, String userName){
		List<String> countriesIDs = new ArrayList<String>();
		boolean countryCh = false;

		for(String city : countries){
	    	countriesIDs = selectCountriesIDs(userName, city);
	    }
		
		if(countriesIDs != null){
	    	countryCh = true;
	    }else{
	    	countryCh = false;
	    }
		return countryCh;
	}
}

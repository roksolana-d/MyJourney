package com.trackmytrips.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.trackmytrips.dao.UserInfoDAO;
import com.trackmytrips.mapper.UserInfoMapper;
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
 
    public List<String> getUserRoles(String userName) {
        String sql = "Select r.User_Role "
                + " from User_Roles r where r.Username = ? ";
         
        Object[] params = new Object[] { userName };
         
        List<String> roles = this.getJdbcTemplate().queryForList(sql,params, String.class);
         
        return roles;
    }
    
    public List<String> getVisitedCountries(String userName){
    	String sql = "Select DISTINCT p.Country from Users_Places up "
    			+ " join Places p on up.PID = p.P_ID "
    			+ " join Users u on up.UID = u.U_ID "
    			+ " where u.Username = ? ";
    	Object [] params = new Object[] { userName };
    	List<String> countries = this.getJdbcTemplate().queryForList(sql, params, String.class);
    	return countries;
    }
    
    public List<String> getVisitedCities(String userName){
    	String sql = "Select DISTINCT p.City from Users_Places up "
    			+ " join Places p on up.PID = p.P_ID "
    			+ " join Users u on up.UID = u.U_ID "
    			+ " where u.Username = ? ";
    	Object [] params = new Object[] { userName };
    	List<String> cities = this.getJdbcTemplate().queryForList(sql, params, String.class);
    	return cities;
    }
    
    public List<String> countVisitedCountries(String userName){
    	String sql = "Select COUNT(DISTINCT p.Country) from Users_Places up "
    			+ " join Places p on up.PID = p.P_ID "
    			+ " join Users u on up.UID = u.U_ID "
    			+ " where u.Username = ? ";
    	Object [] params = new Object[] { userName };
    	List<String> countries = this.getJdbcTemplate().queryForList(sql, params, String.class);
    	return countries;
    }
    
    public List<String> countVisitedCities(String userName){
    	String sql = "Select COUNT(DISTINCT p.City) from Users_Places up "
    			+ " join Places p on up.PID = p.P_ID "
    			+ " join Users u on up.UID = u.U_ID "
    			+ " where u.Username = ? ";
    	Object [] params = new Object[] { userName };
    	List<String> cities = this.getJdbcTemplate().queryForList(sql, params, String.class);
    	return cities;
    }
}

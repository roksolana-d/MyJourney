package com.trackmytrips.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trackmytrips.dao.UserInfoDAO;
import com.trackmytrips.model.CountriesCitiesInfo;

 
@Controller
public class MainController {

    @Autowired
    private UserInfoDAO userInfoDAO;

	   @RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	   public String welcomePage(Model model) {
	       model.addAttribute("title", "Welcome");
	       model.addAttribute("message", "This is welcome page!");
	       return "welcomePage";
	   }
	 
	   @RequestMapping(value = "/admin", method = RequestMethod.GET)
	   public String adminPage(Model model) {
	       return "adminPage";
	   }
	   
	   @RequestMapping(value = "/register", method = RequestMethod.GET)
	   public String registerPage(Model model) {
	       return "registerPage";
	   }
	 
	   @RequestMapping(value = "/login", method = RequestMethod.GET)
	   public String loginPage(Model model ) {
	      
	       return "loginPage";
	   }
	 
	   @RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
	   public String logoutSuccessfulPage(Model model) {
	       model.addAttribute("title", "Logout");
	       return "logoutSuccessfulPage";
	   }
	 
	   @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	   public String userInfo(Model model, Principal principal) {
	 
	       // After user login successfully.
	       String userName = principal.getName();
	       List<String> countriesList = userInfoDAO.getVisitedCountries(userName);
	       List<String> citiesList = userInfoDAO.getVisitedCities(userName);
	       List<String> countriesCount = userInfoDAO.countVisitedCountries(userName);
	       List<String> citiesCount = userInfoDAO.countVisitedCities(userName);
	       List<String> nsur = userInfoDAO.getNameSurname(userName);
	       String date = userInfoDAO.getDateOfBirth(userName);
	       String summary = userInfoDAO.getSummary(userName);
	       String residence = userInfoDAO.getResidence(userName);
	       model.addAttribute("username", userName);
	       model.addAttribute("nsur", nsur);
	       model.addAttribute("date", date);
	       model.addAttribute("summary", summary);
	       model.addAttribute("residence", residence);
	       model.addAttribute("countries", countriesList);
	       model.addAttribute("cities", citiesList);
	       model.addAttribute("countriesCount", countriesCount);
	       model.addAttribute("citiesCount", citiesCount);
	       return "userInfoPage";
	   }
	   
	   @RequestMapping(value = "/editUser", method = RequestMethod.GET)
	   public String editUser(Model model, Principal principal) {
	       // After user login successfully.
		   CountriesCitiesInfo csInfo = new CountriesCitiesInfo();
	       String userName = principal.getName();
	       List<String> countriesList = userInfoDAO.getVisitedCountries(userName);
	       List<String> citiesList = userInfoDAO.getVisitedCities(userName);
	       List<String> countriesCount = userInfoDAO.countVisitedCountries(userName);
	       List<String> citiesCount = userInfoDAO.countVisitedCities(userName);
	       List<String> allCities = userInfoDAO.selectCities(userName);
	       List<String> allCountries = userInfoDAO.selectCountries(userName);
	       List<String> nsur = userInfoDAO.getNameSurname(userName);
	       String date = userInfoDAO.getDateOfBirth(userName);
	       String summary = userInfoDAO.getSummary(userName);
	       String residence = userInfoDAO.getResidence(userName);
	       String lastName = userInfoDAO.getFirstName(userName);
	       String firstName = userInfoDAO.getLastName(userName);
	       model.addAttribute("username", userName);
	       model.addAttribute("nsur", nsur);
	       model.addAttribute("firstname", firstName);
	       model.addAttribute("lastname", lastName);
	       model.addAttribute("date", date);
	       model.addAttribute("summary", summary);
	       model.addAttribute("residence", residence);
	       model.addAttribute("allCountries", allCountries);
	       model.addAttribute("allCities", allCities);
	       model.addAttribute("countries", countriesList);
	       model.addAttribute("cities", citiesList);
	       model.addAttribute("countriesCount", countriesCount);
	       model.addAttribute("citiesCount", citiesCount);
	       return "editUserPage";
	   }
	   
	   @RequestMapping(value = "/editPlaces", method = RequestMethod.GET)
	   public String editPlaces(Model model, Principal principal) {
	       // After user login successfully.
		   CountriesCitiesInfo csInfo = new CountriesCitiesInfo();
	       String userName = principal.getName();
	       List<String> countriesList = userInfoDAO.getVisitedCountries(userName);
	       List<String> citiesList = userInfoDAO.getVisitedCities(userName);
	       List<String> countriesCount = userInfoDAO.countVisitedCountries(userName);
	       List<String> citiesCount = userInfoDAO.countVisitedCities(userName);
	       List<String> allCities = userInfoDAO.selectCities(userName);
	       List<String> allCountries = userInfoDAO.selectCountries(userName);
	       List<String> nsur = userInfoDAO.getNameSurname(userName);
	       String date = userInfoDAO.getDateOfBirth(userName);
	       String summary = userInfoDAO.getSummary(userName);
	       String residence = userInfoDAO.getResidence(userName);
	       String lastName = userInfoDAO.getFirstName(userName);
	       String firstName = userInfoDAO.getLastName(userName);
	       model.addAttribute("username", userName);
	       model.addAttribute("nsur", nsur);
	       model.addAttribute("firstname", firstName);
	       model.addAttribute("lastname", lastName);
	       model.addAttribute("date", date);
	       model.addAttribute("summary", summary);
	       model.addAttribute("residence", residence);
	       model.addAttribute("allCountries", allCountries);
	       model.addAttribute("allCities", allCities);
	       model.addAttribute("countries", countriesList);
	       model.addAttribute("cities", citiesList);
	       model.addAttribute("countriesCount", countriesCount);
	       model.addAttribute("citiesCount", citiesCount);
	       return "editPlaces";
	   }
	 
	   @RequestMapping(value = "/403", method = RequestMethod.GET)
	   public String accessDenied(Model model, Principal principal) {
	        
	       if (principal != null) {
	           model.addAttribute("message", "Hi " + principal.getName()
	                   + "<br> You do not have permission to access this page!");
	       } else {
	           model.addAttribute("msg",
	                   "You do not have permission to access this page!");
	       }
	       return "403Page";
	   }
}

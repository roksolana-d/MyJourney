package com.trackmytrips.model;

import java.util.List;

public class CountriesCitiesInfo {
	private List<String> countries;
	private List<String> cities;

	public CountriesCitiesInfo() {

	}
	
	public CountriesCitiesInfo(List<String> countries, List<String> cities) {
		this.countries = countries;
		this.cities = cities;
	}

	public List<String> getCountries() {
		return countries;
	}
	
	public void setCountries(List<String> countries) {
		this.countries = countries;
	}
	
	public List<String> getCities() {
		return cities;
	}
	
	public void setCities(List<String> cities) {
		this.cities = cities;
	}
}

package com.trackmytrips.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import com.trackmytrips.model.CountriesCitiesInfo;

public class CountriesCitiesInfoMapper implements RowMapper<CountriesCitiesInfo> {

	@Override
	public CountriesCitiesInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
		List<String> countries = (List<String>) rs.getObject("Country");
		List<String> cities = (List<String>) rs.getObject("City");
		return new CountriesCitiesInfo(countries, cities);
	}

}

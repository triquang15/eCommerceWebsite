package com.triquang.setting;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.triquang.common.entity.Country;
import com.triquang.common.entity.State;

public interface StateRepository extends CrudRepository<State, Integer> {
	
	public List<State> findByCountryOrderByNameAsc(Country country);
}

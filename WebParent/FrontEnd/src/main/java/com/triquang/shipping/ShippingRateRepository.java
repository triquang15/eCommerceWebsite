package com.triquang.shipping;

import org.springframework.data.repository.CrudRepository;

import com.triquang.common.entity.Country;
import com.triquang.common.entity.ShippingRate;

public interface ShippingRateRepository extends CrudRepository<ShippingRate, Integer> {
	
	public ShippingRate findByCountryAndState(Country country, String state);
}

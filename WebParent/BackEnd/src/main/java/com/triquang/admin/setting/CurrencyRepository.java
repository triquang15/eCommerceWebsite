package com.triquang.admin.setting;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.triquang.common.entity.Currency;

public interface CurrencyRepository extends CrudRepository<Currency, Integer> {
	
	public List<Currency> findAllByOrderByNameAsc();
}

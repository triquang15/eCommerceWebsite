package com.triquang.setting;

import org.springframework.data.repository.CrudRepository;

import com.triquang.common.entity.Currency;

public interface CurrencyRepository extends CrudRepository<Currency, Integer> {

}

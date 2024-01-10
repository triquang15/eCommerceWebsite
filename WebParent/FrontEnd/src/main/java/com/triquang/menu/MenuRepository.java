package com.triquang.menu;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.triquang.common.entity.Menu;
import com.triquang.common.entity.MenuType;

public interface MenuRepository extends JpaRepository<Menu, Integer> {
	
	public List<Menu> findByTypeAndEnabledOrderByPositionAsc(MenuType type, boolean enabled);
	
	@Query("Select m FROM Menu m WHERE m.alias = ?1 AND m.enabled = true")
	public Menu findByAlias(String alias);
}

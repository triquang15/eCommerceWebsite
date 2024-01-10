package com.triquang.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.triquang.common.entity.Article;
import com.triquang.common.entity.Menu;
import com.triquang.common.entity.MenuType;
import com.triquang.common.exception.MenuItemNotFoundException;

@Service
public class MenuService {
	@Autowired private MenuRepository repo;
	
	public List<Menu> getHeaderMenuItems() {
		return repo.findByTypeAndEnabledOrderByPositionAsc(MenuType.HEADER, true);
	}
	
	public List<Menu> getFooterMenuItems() {
		return repo.findByTypeAndEnabledOrderByPositionAsc(MenuType.FOOTER, true);
	}
	
	public Article getArticleBoundToMenu(String menuAlias) throws MenuItemNotFoundException {
		Menu menu = repo.findByAlias(menuAlias);
		if (menu == null) {
			throw new MenuItemNotFoundException("No menu found with alias " + menuAlias);
		}
		
		return menu.getArticle();
	}	
}

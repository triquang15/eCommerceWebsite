package com.triquang.admin.author;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.triquang.common.entity.Author;
import com.triquang.common.entity.Category;
import com.triquang.common.exception.AuthorNotFoundException;

@RestController
public class AuthorRestController {
	@Autowired
	private AuthorService service;
	
	@PostMapping("/authors/check_unique")
	public String checkUnique(Integer id, String name) {
		return service.checkUnique(id, name);
	}
	
	@GetMapping("/authors/{id}/categories")
	public List<CategoryDTO> listCategoriesByAuthor(@PathVariable(name = "id") Integer authorId) throws AuthorNotFoundRestException {
		List<CategoryDTO> listCategories = new ArrayList<>(); 
		
		try {
			Author author = service.get(authorId);
			Set<Category> categories = author.getCategories();
			
			for (Category category : categories) {
				CategoryDTO dto = new CategoryDTO(category.getId(), category.getName());
				listCategories.add(dto);
			}
			
			return listCategories;
		} catch (AuthorNotFoundException e) {
			throw new AuthorNotFoundRestException();
		}
	}
}

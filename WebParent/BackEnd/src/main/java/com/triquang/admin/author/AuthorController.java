package com.triquang.admin.author;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.triquang.admin.AmazonS3Util;
import com.triquang.admin.category.CategoryService;
import com.triquang.admin.paging.PagingAndSortingHelper;
import com.triquang.admin.paging.PagingAndSortingParam;
import com.triquang.common.entity.Author;
import com.triquang.common.entity.Category;
import com.triquang.common.exception.AuthorNotFoundException;

@Controller
public class AuthorController {
	private String defaultRedirectURL = "redirect:/authors/page/1?sortField=name&sortDir=asc";
	@Autowired private AuthorService authorService;	
	@Autowired private CategoryService categoryService;
	
	@GetMapping("/authors")
	public String listFirstPage() {
		return defaultRedirectURL;
	}
	
	@GetMapping("/authors/page/{pageNum}")
	public String listByPage(
			@PagingAndSortingParam(listName = "listAuthors", moduleURL = "/authors") PagingAndSortingHelper helper,
			@PathVariable(name = "pageNum") int pageNum
			) {
		authorService.listByPage(pageNum, helper);
		return "authors/authors";		
	}
	
	@GetMapping("/authors/new")
	public String newAuthor(Model model) {
		List<Category> listCategories = categoryService.listCategoriesUsedInForm();
		
		model.addAttribute("listCategories", listCategories);
		model.addAttribute("author", new Author());
		model.addAttribute("pageTitle", "Create New Author");
		
		return "authors/author_form";		
	}
	
	@PostMapping("/authors/save")
	public String saveAuthor(Author author, @RequestParam("fileImage") MultipartFile multipartFile,
			RedirectAttributes ra) throws IOException {
		if (!multipartFile.isEmpty()) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			author.setLogo(fileName);
			
			Author savedAuthor = authorService.save(author);
			String uploadDir = "author-logos/" + savedAuthor.getId();
			
			AmazonS3Util.removeFolder(uploadDir);
			AmazonS3Util.uploadFile(uploadDir, fileName, multipartFile.getInputStream());
		} else {
			authorService.save(author);
		}
		
		ra.addFlashAttribute("message", "The author has been saved successfully.");
		return defaultRedirectURL;		
	}
	
	@GetMapping("/authors/edit/{id}")
	public String editAuthor(@PathVariable(name = "id") Integer id, Model model,
			RedirectAttributes ra) {
		try {
			Author author = authorService.get(id);
			List<Category> listCategories = categoryService.listCategoriesUsedInForm();
			
			model.addAttribute("author", author);
			model.addAttribute("listCategories", listCategories);
			model.addAttribute("pageTitle", "Edit Author (ID: " + id + ")");
			
			return "authors/author_form";			
		} catch (AuthorNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
			return defaultRedirectURL;
		}
	}
	
	@GetMapping("/authors/delete/{id}")
	public String deleteAuthor(@PathVariable(name = "id") Integer id, 
			Model model,
			RedirectAttributes redirectAttributes) {
		try {
			authorService.delete(id);
			String authorDir = "author-logos/" + id;
			AmazonS3Util.removeFolder(authorDir);
			
			redirectAttributes.addFlashAttribute("message", 
					"The author ID " + id + " has been deleted successfully");
		} catch (AuthorNotFoundException ex) {
			redirectAttributes.addFlashAttribute("message", ex.getMessage());
		}
		
		return defaultRedirectURL;
	}	
}

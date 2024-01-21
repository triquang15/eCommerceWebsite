package com.triquang.admin.section;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.triquang.admin.author.AuthorService;
import com.triquang.common.entity.Author;
import com.triquang.common.entity.section.AuthorSection;
import com.triquang.common.entity.section.Section;
import com.triquang.common.entity.section.SectionType;
import com.triquang.common.exception.SectionNotFoundException;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AuthorSectionController {

	@Autowired
	private SectionService sectionService;
	
	@Autowired
	private AuthorService authorService;
	
	@GetMapping("/sections/new/author")
	public String showForm(Model model) {
		Section section = new Section(true, SectionType.BRAND);
		List<Author> listAuthors = authorService.listAll();
		
		model.addAttribute("listAuthors", listAuthors);
		model.addAttribute("section", section);
		model.addAttribute("pageTitle", "Add Author Section");
		
		return "sections/author_section_form";
	}		
	
	@PostMapping("/sections/save/author")
	public String saveSection(Section section, HttpServletRequest request, RedirectAttributes ra) {
		addAuthorsToSection(section, request);
		sectionService.saveSection(section);
		
		ra.addFlashAttribute("message", "The section of type Author has been saved successfully.");
		return "redirect:/sections";
	}	
	
	private void addAuthorsToSection(Section section, HttpServletRequest request) {
		String[] IDs = request.getParameterValues("chosenAuthors");
		
		if (IDs != null && IDs.length > 0) {
			for (int i = 0; i < IDs.length; i++) {
				String[] arrayIds = IDs[i].split("-");
				
				AuthorSection authorSection = new AuthorSection();
				
				Integer authorSectionId = Integer.valueOf(arrayIds[1]);
				if (authorSectionId > 0) {
					authorSection.setId(authorSectionId);
				}
					
				authorSection.setAuthorOrder(i);
				Integer authorId = Integer.valueOf(arrayIds[0]);
				
				authorSection.setAuthor(new Author(authorId));
				section.addAuthorSection(authorSection);
				
			}
		}		
	}	
	
	@GetMapping("/sections/edit/author/{id}")
	public String editSection(@PathVariable(name = "id") Integer id, RedirectAttributes ra,
			Model model) {
		try {
			Section section = sectionService.getSection(id);
			List<Author> listAuthors = authorService.listAll();
			
			model.addAttribute("listAuthors", listAuthors);
			model.addAttribute("section", section);
			model.addAttribute("pageTitle", "Edit Author Section (ID: " + id + ")");
			
			return "sections/author_section_form";
			
		} catch (SectionNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
			return "redirect:/sections";		
		}
		
	}	
}

package com.triquang.question;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.triquang.ControllerHelper;
import com.triquang.common.entity.Customer;
import com.triquang.common.entity.Question;
import com.triquang.common.exception.ProductNotFoundException;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class QuestionRestController {

	@Autowired private ControllerHelper controllerHelper;
	
	@Autowired private QuestionService questionService;
	
	@PostMapping("/post_question/{productId}")
	public ResponseEntity<?> postQuestion(@RequestBody Question question,
			@PathVariable(name = "productId") Integer productId,
			HttpServletRequest request) throws ProductNotFoundException, IOException {
	
		Customer customerUser = controllerHelper.getAuthenticatedCustomer(request);
		if (customerUser == null) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		questionService.saveNewQuestion(question, customerUser, productId);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}

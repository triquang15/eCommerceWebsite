package com.triquang.question.vote;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.triquang.ControllerHelper;
import com.triquang.common.entity.Customer;
import com.triquang.vote.VoteResult;
import com.triquang.vote.VoteType;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class QuestionVoteRestController {

	@Autowired private ControllerHelper controllerHelper;
	
	@Autowired private QuestionVoteService service;
	
	@PostMapping("/vote_question/{id}/{type}")
	public VoteResult voteQuestion(@PathVariable(name = "id") Integer questionId,
			@PathVariable(name = "type") String type, HttpServletRequest request) {
		
		Customer customer = controllerHelper.getAuthenticatedCustomer(request);
		if (customer == null) {
			return VoteResult.fail("You must login to vote the question.");
		}
		
		VoteType voteType = VoteType.valueOf(type.toUpperCase());
		
		return service.doVote(questionId, customer, voteType);		
	}
	
}

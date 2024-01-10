package com.triquang.admin.question;

import java.util.Date;
import java.util.NoSuchElementException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.triquang.admin.paging.PagingAndSortingHelper;
import com.triquang.common.entity.Question;
import com.triquang.common.entity.User;
import com.triquang.common.exception.QuestionNotFoundException;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class QuestionService {
	
	public static final int QUESTIONS_PER_PAGE = 10;
	
	@Autowired
	private QuestionRepository repo;
	
	public void listByPage(int pageNum, PagingAndSortingHelper helper) {
		helper.listEntities(pageNum, QUESTIONS_PER_PAGE, repo);
	}	
	
	public Question get(Integer id) throws QuestionNotFoundException {
		try {
			return repo.findById(id).get();
		} catch (NoSuchElementException ex) {
			throw new QuestionNotFoundException("Could not find question with ID " + id);
		}
	}
	
	public void save(Question questionInForm, User user) throws QuestionNotFoundException {
		try {
			Question questionInDB = repo.findById(questionInForm.getId()).get();
			questionInDB.setQuestionContent(questionInForm.getQuestionContent());
			questionInDB.setAnswer(questionInForm.getAnswer());
			questionInDB.setApproved(questionInForm.isApproved());
			
			if (questionInDB.isAnswered()) {
				questionInDB.setAnswerTime(new Date());
				questionInDB.setAnswerer(user);
			}
			
			repo.save(questionInDB);
			
		} catch (NoSuchElementException ex) {
			throw new QuestionNotFoundException("Could not find any question with ID " + questionInForm.getId());
		}		
	}
	
	public void approve(Integer id) {
		repo.updateApprovalStatus(id, true);
	}
	
	public void disapprove(Integer id) {
		repo.updateApprovalStatus(id, false);
	}
	
	public void delete(Integer id) throws QuestionNotFoundException {
		if (!repo.existsById(id)) {
			throw new QuestionNotFoundException("Could not find any question with ID " + id);
		}
		repo.deleteById(id);
	}	
}

package com.triquang.common.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "questions_votes")
@NoArgsConstructor
@Getter
@Setter
public class QuestionVote extends IdBasedEntity {
	public static final int VOTE_UP_POINT = 1;
	public static final int VOTE_DOWN_POINT = -1;

	@ManyToOne
	@JoinColumn(name = "question_id")
	private Question question;

	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;

	private int votes;

	public void voteUp() {
		this.votes = VOTE_UP_POINT;
	}

	public void voteDown() {
		this.votes = VOTE_DOWN_POINT;
	}

	@Transient
	public boolean isUpvoted() {
		return this.votes == VOTE_UP_POINT;
	}

	@Transient
	public boolean isDownvoted() {
		return this.votes == VOTE_DOWN_POINT;
	}

}

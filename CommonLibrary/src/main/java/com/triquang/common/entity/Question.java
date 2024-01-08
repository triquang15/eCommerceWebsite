package com.triquang.common.entity;

import java.util.Date;

import com.triquang.common.entity.product.Product;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "questions")
@NoArgsConstructor
@Getter
@Setter
public class Question extends IdBasedEntity {

	@Column(name = "question")
	private String questionContent;

	private String answer;
	private int votes;
	private boolean approved;

	@Column(name = "ask_time")
	private Date askTime;

	@Column(name = "answer_time")
	private Date answerTime;

	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	@ManyToOne
	@JoinColumn(name = "answerer_id")
	private User answerer;

	@ManyToOne
	@JoinColumn(name = "asker_id")
	private Customer asker;

	@Transient
	public boolean isAnswered() {
		return this.answer != null && !answer.isEmpty();
	}

	@Transient
	public String getProductName() {
		return this.product.getName();
	}

	@Transient
	public String getAskerFullName() {
		return asker.getFirstName() + " " + asker.getLastName();
	}

	@Transient
	public String getAnswererFullName() {
		if (answerer != null) {
			return answerer.getFirstName() + " " + answerer.getLastName();
		}
		return "";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Question other = (Question) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Transient
	private boolean upvotedByCurrentCustomer;

	@Transient
	private boolean downvotedByCurrentCustomer;
}

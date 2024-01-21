package com.triquang.common.entity.section;

import com.triquang.common.entity.Author;
import com.triquang.common.entity.IdBasedEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "sections_authors")
@Getter
@Setter
public class AuthorSection extends IdBasedEntity {

	@Column(name = "author_order")
	private int authorOrder;

	@ManyToOne
	@JoinColumn(name = "author_id")
	private Author author;

}

package com.triquang.common.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "articles")
@NoArgsConstructor
@Getter
@Setter
public class Article extends IdBasedEntity {

	@Column(nullable = false, length = 256)
	private String title;

	@Column(nullable = false)
	@Lob
	private String content;

	@Column(nullable = false, length = 500)
	private String alias;

	@Enumerated(EnumType.ORDINAL)
	private ArticleType type;

	@Column(name = "updated_time")
	private Date updatedTime;

	private boolean published;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public Article(Integer id, String title, ArticleType type, Date updatedTime, boolean published, User user) {
		this.id = id;
		this.title = title;
		this.type = type;
		this.updatedTime = updatedTime;
		this.published = published;
		this.user = user;
	}

	public Article(Integer id, String title) {
		this.id = id;
		this.title = title;
	}

	public Article(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Article [title=" + title + ", type=" + type + "]";
	}

}
package com.triquang.article;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.triquang.common.entity.Article;

public interface ArticleRepository extends JpaRepository<Article, Integer> {
	
	@Query("SELECT a FROM Article a WHERE a.alias = ?1")
	public Article findByAlias(String alias);
}

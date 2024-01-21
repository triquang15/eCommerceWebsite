package com.triquang.author;

import org.springframework.data.jpa.repository.JpaRepository;

import com.triquang.common.entity.Author;

public interface AuthorRepository extends JpaRepository<Author, Integer> {

}

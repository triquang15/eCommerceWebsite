package com.triquang.common.entity.section;

import com.triquang.common.entity.Category;
import com.triquang.common.entity.IdBasedEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "sections_categories")
@Getter
@Setter
public class CategorySection extends IdBasedEntity {
	
	@Column(name = "category_order")
	private int categoryOrder;
	
	@ManyToOne
	@JoinColumn(name = "category_id")	
	private Category category;

}

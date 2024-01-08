package com.triquang.common.entity.section;

import com.triquang.common.entity.IdBasedEntity;
import com.triquang.common.entity.product.Product;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "sections_products")
@Getter
@Setter
public class ProductSection extends IdBasedEntity {

	@Column(name = "product_order")
	private int productOrder;

	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

}

package com.triquang.common.entity.product;

import com.triquang.common.entity.IdBasedEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "product_details")
@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
public class ProductDetail extends IdBasedEntity {
	
	@Column(nullable = false, length = 255)
	private String name;
	
	@Column(nullable = false, length = 255)
	private String value;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	public ProductDetail(Integer id, String name, String value, Product product) {
		super();
		this.id = id;
		this.name = name;
		this.value = value;
		this.product = product;
	}
}


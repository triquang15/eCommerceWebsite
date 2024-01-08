package com.triquang.common.entity.product;

import com.triquang.common.Constants;
import com.triquang.common.entity.IdBasedEntity;

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
@Table(name = "product_images")
@NoArgsConstructor
@Getter
@Setter
public class ProductImage extends IdBasedEntity {

	@Column(nullable = false)
	private String name;

	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	public ProductImage(Integer id, String name, Product product) {
		this.id = id;
		this.name = name;
		this.product = product;
	}

	public ProductImage(String name, Product product) {
		this.name = name;
		this.product = product;
	}

	@Transient
	public String getImagePath() {
		return Constants.S3_BASE_URI + "/product-images/" + product.getId() + "/extras/" + this.name;
	}

}

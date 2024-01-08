package com.triquang.common.entity.section;

import com.triquang.common.entity.Brand;
import com.triquang.common.entity.IdBasedEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "sections_brands")
@Getter
@Setter
public class BrandSection extends IdBasedEntity {

	@Column(name = "brand_order")
	private int brandOrder;

	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;

}

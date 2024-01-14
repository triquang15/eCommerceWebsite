package com.triquang.common.entity;

import java.util.HashSet;
import java.util.Set;

import com.triquang.common.Constants;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "brands")
@NoArgsConstructor
@Getter
@Setter
public class Brand extends IdBasedEntity {

	@Column(nullable = false, length = 45, unique = true)
	private String name;

	@Column(nullable = false, length = 128)
	private String logo;

	@ManyToMany
	@JoinTable(name = "brands_categories", joinColumns = @JoinColumn(name = "brand_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	private Set<Category> categories = new HashSet<>();

	public Brand(String name) {
		this.name = name;
		this.logo = "brand-logo.png";
	}

	public Brand(Integer id) {
		this.id = id;
	}

	public Brand(Integer id, String name) {
		this.id = id;
		this.name = name;
	}

	@Override
	public String toString() {
		return "Brand [id=" + id + ", name=" + name + ", categories=" + categories + "]";
	}

	@Transient
	public String getLogoPath() {
		if (this.id == null)
			return "/images/image-thumbnail.png";

	//	return "/brand-logos/" + this.id + "/" + this.logo;
		return Constants.S3_BASE_URI + "/brand-logos/" + this.id + "/" + this.logo;
	}
}

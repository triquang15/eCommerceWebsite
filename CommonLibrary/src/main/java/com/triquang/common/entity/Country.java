package com.triquang.common.entity;

import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "countries")
@NoArgsConstructor
@Getter
@Setter
public class Country extends IdBasedEntity {

	@Column(nullable = false, length = 45)
	private String name;

	@Column(nullable = false, length = 5)
	private String code;

	@OneToMany(mappedBy = "country")
	private Set<State> states;

	public Country(Integer id) {
		this.id = id;
	}

	public Country(Integer id, String name, String code) {
		this.id = id;
		this.name = name;
		this.code = code;
	}

	public Country(String name, String code) {
		this.name = name;
		this.code = code;
	}

	public Country(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Country [id=" + id + ", name=" + name + ", code=" + code + "]";
	}

}

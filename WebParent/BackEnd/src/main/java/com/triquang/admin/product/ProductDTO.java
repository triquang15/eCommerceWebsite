package com.triquang.admin.product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class ProductDTO {
	private String name;
	private String imagePath;
	private float price;
	private float cost;
}

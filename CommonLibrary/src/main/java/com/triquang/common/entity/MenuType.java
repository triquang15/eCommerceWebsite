package com.triquang.common.entity;

public enum MenuType {
	HEADER {
		public String toString() { return "Header Menu"; }
		
	}, FOOTER {
		public String toString() { return "Footer Menu"; }
	}
}

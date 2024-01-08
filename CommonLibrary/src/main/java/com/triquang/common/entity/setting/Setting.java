package com.triquang.common.entity.setting;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Data
@Table(name = "settings")
public class Setting {
	@Id
	@Column(name = "`key`", nullable = false, length = 128)
	private String key;
	
	@Column(nullable = false, length = 1024)
	private String value;
	
	@Enumerated(EnumType.STRING)
	@Column(length = 45, nullable = false)
	private SettingCategory category;

	public Setting(String key) {
		this.key = key;
	}

}

package com.triquang.order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderReturnRequest {
	private Integer orderId;
	private String reason;
	private String note;
}

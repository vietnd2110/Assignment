package com.asm.bean;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class OrderDetailModel {
	private int orderId;
	
	private int productId;
	
	@Min(value = 0, message = "Không được nhỏ hơn 0")
	private float price;
	
	@Min(value = 0, message = "Không được nhỏ hơn 0")
	private int quantity;

}

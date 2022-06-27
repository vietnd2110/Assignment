package com.asm.bean;

import java.time.LocalDate;

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
public class OrderModel {
	
	private int userId;
	
	@NotNull
	private LocalDate createDate;
	
	@NotBlank(message = "Không được để trống địa chỉ")
	private String address;
	
}

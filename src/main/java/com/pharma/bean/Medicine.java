package com.pharma.bean;

public record Medicine(
		String batchCode,
		String medicineCode,
		String weight,
		String price,
		String medicineType,
		String refrigeration
		) {}

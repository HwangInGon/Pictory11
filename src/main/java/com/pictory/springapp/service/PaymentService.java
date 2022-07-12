package com.pictory.springapp.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service("paymentService")
public class PaymentService {
	
	public void purchase(String[] noArray) {
		for(String no : noArray) {
			System.out.println(no + "를 구매했습니다.");
		}
		return;
	}
	
	public void cart(String[] noArray) {
		for(String no : noArray) {
			System.out.println(no + "를 담았습니다.");
		}
		return;
	}
	
}

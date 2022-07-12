package com.pictory.springapp.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pictory.springapp.service.PaymentService;

@Controller
public class PaymentContoller {

	@Autowired
	PaymentService paymentService;
	
	@RequestMapping(value="/Purchase.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String purchase(@RequestParam String[] no) {
		paymentService.purchase(no);
		return String.format("{\"noList\":\"%s\"}", no);
	}
	
	@RequestMapping(value="/Cart.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String cart(@RequestParam String[] no) {
		paymentService.cart(no);
		return String.format("{\"noList\":\"%s\"}", Arrays.asList(no));
	}
}
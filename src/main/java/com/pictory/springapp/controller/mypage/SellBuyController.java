package com.pictory.springapp.controller.mypage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pictory.springapp.service.ArticleService;

@Controller
@RequestMapping("/mypage/sellbuy/")
public class SellBuyController {
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("Buy.do")
	public String buy(Model model , int[] no) {
		model.addAttribute("noList", no);
		return "mypage/sellbuy/Buy";
	}
	
	@RequestMapping("Sell.do")
	public String sell() {
		return "mypage/sellbuy/Sell";
	}
	
	@RequestMapping(value="Modify.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String modify(@RequestParam List<String> no) {
		articleService.modify(no);
		return String.format("{\"noList\":\"%s\"}", no);
	}
	
	@RequestMapping(value="Stop.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String stop(@RequestParam List<String> no) {
		articleService.stop(no);
		return String.format("{\"noList\":\"%s\"}", no);
	}
	
	@RequestMapping(value="Delete.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String delete(@RequestParam List<String> no) {
		articleService.delete(no);
		return String.format("{\"noList\":\"%s\"}", no);
	}
	
}

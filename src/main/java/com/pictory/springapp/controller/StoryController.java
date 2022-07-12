package com.pictory.springapp.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/story/")
public class StoryController {
	
	@RequestMapping("Index.do")
	public String index() {
		return "story/Index";
	}
	
	@RequestMapping("Category.do")
	public String category(Model model, @RequestParam Map map) {
		model.addAttribute("category", map.get("category"));
		return "forward:/story/Index.do";
	}
	
}

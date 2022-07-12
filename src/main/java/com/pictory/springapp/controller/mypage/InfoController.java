package com.pictory.springapp.controller.mypage;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mypage/")
public class InfoController {

	@GetMapping("Index.do")
	public String index() {		
		return "mypage/Index";
	}
	
	@GetMapping("Edit.do")
	public String edit() {		
		return "mypage/Edit";
	}

	@PostMapping("Edit.do")
	public String editProcess() {		
		return "forward:/member/Edit.do";
	}
	
}

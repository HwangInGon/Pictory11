package com.pictory.springapp.controller.member;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@GetMapping("JoinAgree.do")
	public String joinAgree() {
		return "member/JoinAgree";
	}
	
	@GetMapping("Join.do")
	public String join() {		
		return "member/Join";
	}
	
	@PostMapping("Write.do")
	public String joinProcess() {		
		return "index";
	}
	
	@PostMapping("Edit.do")
	public String editProcess() {
		return "mypage/Index";
	}
	
	@GetMapping(value="IdCheck.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String idCheck2(@RequestParam Map map) {
		return String.format("{\"isDuplicated\":\"%s\"}", false);
	}

}

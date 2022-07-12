package com.pictory.springapp.controller.mypage;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pictory.springapp.service.MemberService;
import com.pictory.springapp.service.PaymentService;

@Controller
@RequestMapping("/mypage/bookmark/")
public class BookmarkController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("Index.do")
	public String index() {		
		return "mypage/Bookmark";
	}
	
	@RequestMapping("View.do")
	public String view() {		
		return "forward:/gallery/View.do";
	}

	@RequestMapping(value="/Revoke.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String vacate(@RequestParam String[] no) {
		memberService.revokeBookmark(no);
		return String.format("{\"noList\":\"%s\"}", Arrays.asList(no));
	}
	
}
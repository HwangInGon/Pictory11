package com.pictory.springapp.controller.member;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pictory.springapp.service.MemberDTO;
import com.pictory.springapp.service.impl.MemberServiceImpl;

@Controller
@RequestMapping("/auth")
public class AuthController {
	//서비스 주입]
	@Resource(name = "memberService")
	private MemberServiceImpl memberService;
	
	@RequestMapping("Login.do")
	public String login() {		
		System.out.println("Asdfasfasdf");
		//LoginDTO dto = LoginDTO.builder().id("LEE").name("리길동").pwd("1234").pwd2("1234").build();
		//LoginDTO dto = new LoginDTO("LEE", "리길동", "1234", "1234", "test@test.com");
		return "auth/Login";
	}
	
	@RequestMapping("LoginProcess.do")
	public String process(@RequestParam Map map, Model model) {
		//서비스 호출
		System.out.println("2222222222222");
		boolean flag = memberService.isLogin(map);
		System.out.println(flag? "회원":"아이디와 비번 불일치");
		//뷰정보 반환
		return "auth/Login";
	}
	
	
}
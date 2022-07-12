package com.pictory.springapp.service;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberService {

	public void bookmark(String[] noArray) {
		for(String no : noArray) {
			System.out.println(no + "를 북마크했습니다.");
		}
		return;
	}
	
	public void revokeBookmark(String[] noArray) {
		for(String no : noArray) {
			System.out.println(no + "를 북마크 취소했습니다.");
		}
		return;
	}
	
}

package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.service.MemberDTO;
import com.pictory.springapp.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService<MemberDTO> {
	
	@Autowired
	private memberDAO dao;
	@Override
	public boolean isLogin(Map map) {
		
		return dao.isLogin(map);
	}

	@Override
	public List<MemberDTO> selectList(Map map) {
	
		return null;
	}

	@Override
	public MemberDTO selectOne(Map map) {
		
		return null;
	}

	@Override
	public int insert(Map map) {
	
		return 0;
	}

	@Override
	public int delete(Map map) {
		
		return 0;
	}

	@Override
	public int update(Map map) {
	
		return 0;
	}

}

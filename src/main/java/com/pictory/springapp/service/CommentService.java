package com.pictory.springapp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.CommentDTO;

@Service("commentService")
public class CommentService {

	public void delete(String[] noArray) {
		for(String no : noArray) {
			System.out.println("댓글" + no + "를 삭제했습니다.");
		}
		return;
	}

	public List<CommentDTO> myComments(String id) {
		List<CommentDTO> list = new ArrayList();
		
		CommentDTO comment1 = new CommentDTO();
		CommentDTO comment2 = new CommentDTO();
		CommentDTO comment3 = new CommentDTO();
		
		comment1.setLno("1");
		comment2.setLno("2");
		comment3.setLno("3");
		
		System.out.println("댓글1,2,3을 찾았습니다.");
		
		list.add(comment1);
		list.add(comment2);
		list.add(comment3);
		
		return list;
	}

	public void write(CommentDTO comment) {		
		System.out.println("댓글을 작성하였습니다.");		
		return;
	}
	
}

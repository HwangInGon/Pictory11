package com.pictory.springapp.controller.gallery;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pictory.springapp.dto.CommentDTO;
import com.pictory.springapp.service.CommentService;

@Controller
@RequestMapping("/gallery/comment/")
public class CommentContoller {

	@Autowired
	private CommentService commentService;
	
	@PostMapping(value="Delete.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String delete(@RequestParam(value="cno[]") String[] cno) {
		commentService.delete(cno);
		return String.format("{\"cnoList\" : %s}", Arrays.asList(cno));
	}
	
	@PostMapping(value="Write.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String write(
			Authentication auth, 
			@RequestParam String no,
			@RequestParam String content,
			@RequestParam(required = false, defaultValue ="-1") String parentLno,
			@RequestParam int level) {
		
		CommentDTO comment = new CommentDTO();
		
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String id = userDetails.getUsername();
		comment.setId(id);
		comment.setNo(no);
		comment.setContent(content);
		comment.setLevel(level);
		
		commentService.write(comment);
		
		double randomValue = Math.random();
		int randomInteger = (int)(randomValue * 10000) + 1;
		
		comment.setLno(   "" + (      randomInteger + Integer.parseInt(parentLno)   )   );
		
		return String.format(
				"{\"id\" : \"%s\","
				+ " \"date\" : \"%s\","
				+ " \"lno\" : \"%s\","
				+ " \"content\" : \"%s\","
				+ " \"childLevel\" : \"%s\","
				+ " \"parentLno\" : \"%s\""
				+ "}",
				comment.getId(), "2022-12-31",
				comment.getLno(), comment.getContent(),
				comment.getLevel() + 1, comment.getParentLno());
	}
	/*
	public @ResponseBody String write(Authentication auth, @RequestParam CommentDTO comment) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String id = userDetails.getUsername();
		comment.setId(id);
		
		commentService.write(comment);
		return String.format(
				"{\"id\" : %s,"
				+ " \"date\" : %s"
				+ " \"lno\" : %s"
				+ " \"content\" : %s"
				+ "}",
				comment.getId(), "2022-12-31",
				comment.getLno(), comment.getContent());
	}
	*/
}
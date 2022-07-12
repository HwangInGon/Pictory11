package com.pictory.springapp.controller.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pictory.springapp.dto.ArticleDTO;
import com.pictory.springapp.dto.CommentDTO;
import com.pictory.springapp.service.ArticleService;
import com.pictory.springapp.service.CommentService;

@Controller
@RequestMapping("/mypage/myactivity/")
public class MyActivityController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private CommentService commentService;
	
	
	@RequestMapping("Index.do")
	public String index() {		
		return "mypage/myactivity/Index";
	}
	
	@RequestMapping("ListArticle.do")
	public String listArticle(Model model, Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String id = userDetails.getUsername();
		model.addAttribute("id", id);

		List<ArticleDTO> listArticles =  articleService.myArticles(id);
		model.addAttribute("listArticles", listArticles);

		return "mypage/myactivity/ListArticle";
	}
	
	@RequestMapping("ListComment.do")
	public String listComment(Model model, Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String id = userDetails.getUsername();
		model.addAttribute("id", id);

		List<CommentDTO> listComments =  commentService.myComments(id);		
		model.addAttribute("listComments", listComments);
		
		return "mypage/myactivity/ListComment";
	}	
}

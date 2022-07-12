package com.pictory.springapp.controller.gallery;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pictory.springapp.dto.ArticleDTO;
import com.pictory.springapp.service.ArticleService;
import com.pictory.springapp.service.PaymentService;

@Controller
@RequestMapping("/gallery/")
public class ArticleContoller {
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("Category.do")
	public String category(Model model, @RequestParam Map map) {
		model.addAttribute("category", map.get("category"));
		model.addAttribute("catValue", map.get("catValue"));
		return "forward:/gallery/Index.do";
	}
	
	@RequestMapping(value="Category.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String delete(
			@RequestParam String category, 
			@RequestParam String catValue)
	{
		return String.format("{\"category\":\"%s\", \"catValue\":\"%s\"}", category, catValue);
	}
	
	@RequestMapping("Index.do")
	public String index(Model model, @RequestParam Map map) {
		List<ArticleDTO> articleList = articleService.indexArticle(map);
		model.addAttribute("articleList", articleList);
		return "gallery/Index";
	}

	@RequestMapping("View.do")
	public String view(@RequestParam Map map) {
		return "gallery/View";
	}
	
	@RequestMapping(value="Bookmark.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String bookmarkFromGallery(@RequestParam String no) {
		return String.format("{\"no\":\"%s\"}", no);
	}
	
	@RequestMapping("Search.do")
	public String searchFromGallery(Model model, @RequestParam Map map) {
		List<ArticleDTO> articleList =  articleService.search(map);
		model.addAttribute("articleList", articleList);
		return "gallery/Index";
	}
	
	@GetMapping("Write.do")
	public String wrtie() {
		return "gallery/Write";
	}
	
	@PostMapping("Write.do")
	public String writeProcess(@RequestParam Map map) {
		articleService.write(map);
		return "gallery/Index";
	}
	
	@PostMapping("article/Delete.do")
	public @ResponseBody String deleteAjax(@RequestParam(value="no[]") List<String> no) {
		articleService.delete(no);
		return String.format("{\"noList\" : %s}", Arrays.asList(no));
	}
	
	@RequestMapping("Download.do")
	public void download(
			HttpServletRequest req,
			HttpServletResponse resp,
			@RequestParam String filename) {
		String saveDirectory = req.getSession().getServletContext().getRealPath("/upload");
		boolean isIe = req.getHeader("user-agent").toUpperCase().indexOf("MSIE") !=-1 ||
				       req.getHeader("user-agent").indexOf("11.0") != -1 ||
				       req.getHeader("user-agent").toUpperCase().indexOf("EDGE") !=-1;
		
		filename = "00_SpringSetting.pdf";
		articleService.download(resp, filename, saveDirectory, isIe);
		return;
	}
	
	@RequestMapping("Sort.do")
	public @ResponseBody String sort(@RequestParam Map map) {
		List<ArticleDTO> articleList = articleService.sort(map);
		return String.format("{\"articleList\" : %s}", articleList);
	}
}

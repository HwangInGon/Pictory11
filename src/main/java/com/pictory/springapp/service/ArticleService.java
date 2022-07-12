package com.pictory.springapp.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.ArticleDTO;

@Service("articleService")
public class ArticleService {

	public List<ArticleDTO> search(Map map) {
		String searchColumn = map.get("searchColumn").toString();
		String searchWord = map.get("searchWord").toString();
		List<ArticleDTO> list = new ArrayList();
		
		ArticleDTO article1 = new ArticleDTO();
		ArticleDTO article2 = new ArticleDTO();
		ArticleDTO article3 = new ArticleDTO();
		
		article1.setTitle("글1");
		article2.setTitle("글2");
		article3.setTitle("글3");
		
		System.out.println("글1,2,3을 찾았습니다.");
		
		list.add(article1);
		list.add(article2);
		list.add(article3);
		
		return list;
	}

	
	public void delete(List<String> noList) {
		for(String no : noList) {
			System.out.println("글" + no + "를 삭제했습니다.");
		}
		return;
	}
	
	public static void download(HttpServletResponse response, String filename, String saveDirectory, boolean isIe) {
		try {
			File file = new File(saveDirectory + File.separator + filename);
			long length = file.length();
			
			/* 다운로드를 위한 응답 헤더 설정 */
			response.setContentType("application/octet-stream");
			response.setContentLength((int)length);
			if(isIe){
				filename = URLEncoder.encode(filename,"UTF-8");
			}
			else{
		 		filename = new String(filename.getBytes("UTF-8"),"8859_1");
			}
			response.setHeader("Content-Disposition","attachment;filename="+filename);
			
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			int data;
			while((data=bis.read()) !=-1){
				bos.write(data);
				bos.flush();
			}
			bis.close();
			bos.close();
			
			System.out.println(filename + "을 다운로드했습니다.");
		}
		catch(Exception e) {e.printStackTrace();}
	}


	public void modify(List<String> noList) {
		for(String no : noList) {
			System.out.println("글" + no + "를 수정했습니다.");
		}
		return;
	}


	public void stop(List<String> noList) {
		for(String no : noList) {
			System.out.println("글" + no + "를 판매중단했습니다.");
		}
		return;
	}


	public List<ArticleDTO> indexArticle(Map map) {
		List<ArticleDTO> list = new ArrayList();
		
		ArticleDTO article1 = new ArticleDTO();
		ArticleDTO article2 = new ArticleDTO();
		ArticleDTO article3 = new ArticleDTO();
		
		article1.setTitle("글1");
		article2.setTitle("글2");
		article3.setTitle("글3");
		
		System.out.println("글1,2,3을 찾았습니다.");
		
		list.add(article1);
		list.add(article2);
		list.add(article3);
		
		return list;
	}
	
	public List<ArticleDTO> myArticles(String id) {
		List<ArticleDTO> list = new ArrayList();
		
		ArticleDTO article1 = new ArticleDTO();
		ArticleDTO article2 = new ArticleDTO();
		ArticleDTO article3 = new ArticleDTO();
		
		article1.setTitle("글1");
		article2.setTitle("글2");
		article3.setTitle("글3");
		
		System.out.println("글1,2,3을 찾았습니다.");
		
		list.add(article1);
		list.add(article2);
		list.add(article3);
		
		return list;
	}


	public void write(Map map) {
		System.out.println("글을 등록했습니다.");
		
	}


	public List<ArticleDTO> sort(Map map) {
		List<ArticleDTO> list = new ArrayList();
		
		ArticleDTO article1 = new ArticleDTO();
		ArticleDTO article2 = new ArticleDTO();
		ArticleDTO article3 = new ArticleDTO();
		
		article1.setTitle("글1");
		article2.setTitle("글2");
		article3.setTitle("글3");
		
		System.out.println(map + "에 기반해 " + "글1,2,3을 정렬했습니다.");
		
		list.add(article1);
		list.add(article2);
		list.add(article3);
		
		return list;
	}
}

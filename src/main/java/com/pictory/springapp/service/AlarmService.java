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

import com.pictory.springapp.dto.AlarmDTO;
import com.pictory.springapp.dto.ArticleDTO;

@Service("alarmService")
public class AlarmService {

	public List<AlarmDTO> myCommentAlarms(String id) {
		List<AlarmDTO> list = new ArrayList();
		
		AlarmDTO alarm1 = new AlarmDTO();
		AlarmDTO alarm2 = new AlarmDTO();
		AlarmDTO alarm3 = new AlarmDTO();
		
		alarm1.setId("LEE");
		alarm1.setType("댓글");
		alarm1.setNo("10001");
		alarm1.setId("LEE");
		alarm2.setType("댓글");
		alarm2.setNo("10001");
		alarm1.setId("KIM");
		alarm3.setType("댓글");
		alarm3.setNo("10002");
				
		list.add(alarm1);
		list.add(alarm2);
		list.add(alarm3);
		
		return list;
	}

	public List<AlarmDTO> mySalesAlarms(String id) {
		List<AlarmDTO> list = new ArrayList();
		
		AlarmDTO alarm1 = new AlarmDTO();
		AlarmDTO alarm2 = new AlarmDTO();
		AlarmDTO alarm3 = new AlarmDTO();
		
		alarm1.setId("LEE");
		alarm1.setType("구매");
		alarm1.setNo("10001");
		alarm1.setId("LEE");
		alarm2.setType("구매");
		alarm2.setNo("10001");
		alarm1.setId("KIM");
		alarm3.setType("구매");
		alarm3.setNo("10002");
				
		list.add(alarm1);
		list.add(alarm2);
		list.add(alarm3);
		
		return list;
	}

	public List<AlarmDTO> myBookmarkAlarms(String id) {
		List<AlarmDTO> list = new ArrayList();
		
		AlarmDTO alarm1 = new AlarmDTO();
		AlarmDTO alarm2 = new AlarmDTO();
		AlarmDTO alarm3 = new AlarmDTO();
		
		alarm1.setId("LEE");
		alarm1.setType("북마크");
		alarm1.setNo("10001");
		alarm1.setId("LEE");
		alarm2.setType("북마크");
		alarm2.setNo("10001");
		alarm1.setId("KIM");
		alarm3.setType("북마크");
		alarm3.setNo("10002");
				
		list.add(alarm1);
		list.add(alarm2);
		list.add(alarm3);
		
		return list;
	}
}

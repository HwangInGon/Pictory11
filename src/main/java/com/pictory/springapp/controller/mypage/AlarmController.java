package com.pictory.springapp.controller.mypage;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pictory.springapp.dto.AlarmDTO;
import com.pictory.springapp.service.AlarmService;

@Controller
@RequestMapping("/mypage/alarm/")
public class AlarmController {

	@Autowired
	private AlarmService alarmService;
	
	
	@RequestMapping("Index.do")
	public String index() {		
		return "mypage/Alarm";
	}

	@RequestMapping(value="Comment.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String commentAlarm(Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String id = userDetails.getUsername();
		List<AlarmDTO> alarmList = alarmService.myCommentAlarms(id);
		return String.format("{"
				+ "\"alarmList\" : \"%s\", "
				+ "\"id\" : \"%s\", "
				+ "\"type\" : \"%s\" "
				+ "}", alarmList, id, "댓글");
	}
	
	@RequestMapping(value="Sale.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String saleAlarm(Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String id = userDetails.getUsername();
		List<AlarmDTO> alarmList = alarmService.mySalesAlarms(id);
		return String.format("{"
				+ "\"alarmList\" : \"%s\", "
				+ "\"id\" : \"%s\", "
				+ "\"type\" : \"%s\" "
				+ "}", alarmList, id, "판매");
	}
	
	@RequestMapping(value="Bookmark.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String bookmarkAlarm(Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String id = userDetails.getUsername();
		List<AlarmDTO> alarmList = alarmService.myBookmarkAlarms(id);
		return String.format("{"
				+ "\"alarmList\" : \"%s\", "
				+ "\"id\" : \"%s\", "
				+ "\"type\" : \"%s\" "
				+ "}", alarmList, id, "북마크");
	}
	
	@RequestMapping(value="Etc.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String etcAlarm(Authentication auth) {
		return String.format("{\"alarmList\" : [\"미구현\", \"미구현\"]}");
	}	
}

package com.pictory.springapp.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AlarmDTO {
/*
 *
	id가 type을 글 no에 ~~하다
	type : 댓글, 글, 북마크
	~~ : 쓰다, 구매하다, 추가하다
 * 
 */
	private String id;
	private String type;
	private String no;
}
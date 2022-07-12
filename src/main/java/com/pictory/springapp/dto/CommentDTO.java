package com.pictory.springapp.dto;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CommentDTO {
	private String no;
	private String lno;
	private String id;
	private String parentLno;
	private String content;
	private Date date;
	private int level;
	private List<CommentDTO> comments;
}

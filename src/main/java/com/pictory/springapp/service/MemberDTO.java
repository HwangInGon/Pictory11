package com.pictory.springapp.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class MemberDTO {
	
	private String id;
	private String name;
	private String pwd;
	private String pwd2;
	private String email;
}

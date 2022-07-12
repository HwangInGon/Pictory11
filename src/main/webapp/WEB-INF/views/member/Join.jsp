<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="/WEB-INF/views/Top.jsp"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>RegistrationForm_v6 by Colorlib</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/member/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
		
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/member/css/style.css">
	</head>
<body>
	<div class="wrapper">
		<div class="inner">
	 		<div class="image-holder">
	 	
	 		</div>
	 		 <form action="javascript:" method="post" id="joinForm">
	 		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	 		<h3>Sign Up</h3>
			<div class="form-row">
				<div style="margin-right: 40px; width:400px;">
				<h5>ID</h5>
				<input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요">
				<a onclick=checkId(true) class="btn btn-secondary" style="height:35px;">중복확인</a>
				</div>
				<div style="width: 400px">
				<h5>EMAIL</h5>
				<input type="text" class="form-control" name="email" placeholder="이메일을 입력하세요">
				</div>
			</div>
			<div class="form-row">
				<div style="margin-right: 40px; width:400px;">
				<h5>비밀번호</h5>
				<input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요">
				</div>
				<div class="form-holder" style="width: 400px;">
					<div>
					<h5>CONFIRM</h5>
					<input type="password" class="form-control" name="pwd2" placeholder="비밀번호를 다시 입력하세요">
					</div>
				</div>
			</div>
			<div class="form-row">
				<div style="margin-right: 40px; width: 400px;">
				<h5>NAME</h5>
				<input type="text" class="form-control" name="name" placeholder="NAME">
				</div>
				<div style="width: 400px;">
				<h5>NICKNAME</h5>
				<input type="text" class="form-control" placeholder="NICKNAME">
				</div>
			</div>
			<div class="form-row">
					<div style="margin-right: 40px; width: 400px;">
					<h5>PHONENUMBER</h5>
					<input type="text" class="form-control" placeholder="PHONENUMBER">
					</div>
			</div>
			<div>
			<h5>INTRODUCE</h5>
			<textarea name="self" id="" placeholder="INTRODUCE" class="form-control" style="height: 100px;"></textarea>
			</div>			
			<button>회원가입
			<i class="zmdi zmdi-long-arrow-right"></i>
			</button>
		</form>
		</div>
	</div>
	<!-- container -->
		<!-- <script src="${pageContext.request.contextPath}/resources/jquery-3.3.1.min.js"></script> -->
		<script src="${pageContext.request.contextPath}/resources/member/js/main.js"></script>
	</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
<script>

	/*
	function submitForm() {
		const form = document.querySelector("form");
		return Promise.resolve(() => form.submit());
	}
	
	
	async function asyncSubmit() {
		const doSubmit = await checkId(false);
		if (doSubmit) {
			submitForm();
		}
	}
	*/
	
	async function checkId(doAlarm) {
		const inputId = document.querySelector("input[name='id']").value;
	    let isValid = 0;
	    // 유효한 경우
		if (validityChecker("id", inputId)) {
			await $.ajax({
				type: "GET",
				url: "<c:url value='/member/IdCheck.do'/>" + "?id=" + inputId,
				dataType: "json",
		        // 중복체크
		        success : (data) => {
					if(JSON.parse(data.isDuplicated)) {
						isValid = false;
						Swal.fire('중복', '다른 아이디를 입력하세요', 'error');
					}
					else {
						isValid = true;
						if (doAlarm) {
			        		Swal.fire('가능', '해당 아이디는 사용 가능합니다', 'success');							
						}
					}
				}
			});
			// 유효 + 비중복
			if(isValid) {
				return true;
			}
			// 유효 but 중복
			else {
				return false;
			}
		}
		// 비유효
		else {
			createInvalidAlarm("id");
			return false;
	    }
	}
	
	function validityChecker(type, data) {
		switch (type) {
			case 'id':
				const idValid1 = data.length >= 4;
				const idValid2 = data.match(/[0-9]/) !== null ? true : false; // Number
				const idValid3 = data.match(/[a-zA-Z]/) !== null ? true : false; // English
		    	return idValid1 && idValid2 && idValid3;
		  	case 'interest':
				var ctInterest = 0;
				data.forEach(function(item){
					if (item.checked) {
						ctInterest = ctInterest + 1;
					}
				});
				return ctInterest >=1;
		  	default:
		  		return false;
		}
	}
 
	const checkees = {
			id : "아이디는 영문자와 숫자가 포함되어야 하고 4자 이상이어야한다.",
			pwd : "비밀번호가 일치하지 않습니다.",
			pwd2 : "비밀번호가 일치하지 않습니다.",
			name : "이름이 작성되지 않았습니다.",	
			self : "자기소개가 작성되지 않았습니다."
	}
	
	function createInvalidAlarm(type) {
		Swal.fire(
				  '유효성 확인',
				  checkees[type],
				  'error'
				);
	}

	function isValid(type) {
		const form = document.querySelector("#joinForm");
		console.log(type);
		switch (type) {
			case 'id':
				const id = form.id.value;
		    	return validityChecker(type, id);
			case 'pwd':
			case 'pwd2':
				const pwd = form.pwd.value;
				const pwd2 = form.pwd2.value;
				return pwd == pwd2 && pwd.length > 0;
			case 'name':
				const name = form.name.value;
		  		return name.length > 0;
		  		<!--
		  	case 'gender':
		  		const genderMan = document.querySelector("#male");
				var genderWoman = document.querySelector("#female");
				return genderMan.checked || genderWoman.checked;
		  	case 'interest':
				var interests = form.querySelectorAll("[name=inter]");
				return validityChecker(type, interests);
		  	case 'grade':
				var grade = form.grade.value;
				return grade.length > 0;
				-->
		  	default: // self
		  		var self = form.self.value;
		  		return self.length > 0;
		}
	}
	
	window.addEventListener("submit", function(e) {
		const form = e.target;
		// 유효성 체크
		for(key in checkees) {
			if (!isValid(key)) {
				createInvalidAlarm(key);
				e.preventDefault();
				return false;
			}
		}

		// 중복 체크
		fetch("<c:url value='/member/IdCheck.do'/>" + "?id=" + form.id.value, {
    		method: 'GET',
			})
				.then((response) => {
	    			return response.json();
	    		})
	    		.then((result) => {
	    			if(JSON.parse(result.isDuplicated)) {
	    				throw new Error("다른 아이디를 입력하세요");
	    			} else {
	    				return "<c:url value='/member/Write.do'/>";
	    			}
	    		})
	    		.then((actionURL) => {	   
	    			var inter = document.querySelectorAll("input[name='inter']:checked");
	    			const interList = [];
	    			inter.forEach((inter) => {
	    				interList.push(inter.value);
	    			})	    	
	    			console.log(form);
	    			fetch(actionURL, {
	    		        method: 'POST',
	    		        body: JSON.stringify({
	    		        	_csrf: form._csrf.value,
	    		            id: form.id.value,
	    		            pwd: form.pwd.value,
	    		            name: form.name.value,
	    		            self: form.self.value
	    		        })
	    			});  			
	    		})
	    		.then(() => {
	    			location.href = "<c:url value='/index.do'/>";
	    		})
	    		.catch((err) => {
	    			console.log(err.message);
	    			Swal.fire('중복', err.message, 'error');
	    		})
	});

	
	
</script>
   
<jsp:include page="/WEB-INF/views/Footer.jsp"/>
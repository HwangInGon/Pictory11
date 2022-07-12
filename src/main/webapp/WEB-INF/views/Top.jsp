<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>한소인</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}" />
	<meta name="_csrf" content="${_csrf.token}"/>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	
	<!-- 알람창 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
	
	
	<script>
		function logout(){
			$('#logoutForm').submit();
		}	
	</script>
	
	<style>
		.jumbotron {
			padding-top: 1rem;
			padding-bottom: 1rem;
		}
		
		body {
			padding-top: 65px;
		}
	</style>
</head>
<body>
	<form id="logoutForm" method="post" action="<c:url value="/auth/Logout.do"/>">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	

	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark fixed-top">
		<a class="navbar-brand"
			href="<c:url value="/"/>"> 
			<i class="material-icons" style="font-size: 2rem">home</i>
		</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar-link">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end"
			id="navbar-link">
			<ul class="navbar-nav">
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link active" href="<c:url value="/auth/Login.do"/>">로그인</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link" href="javascript:logout()">로그아웃</a></li>
				</sec:authorize>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/mypage/Index.do"/>">마이페이지</a></li>				
				<li class="nav-item"><a class="nav-link" href="<c:url value="/gallery/Index.do"/>">갤러리</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/story/Index.do"/>">스토리</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/member/Join.do"/>">회원가입</a></li>
				<li class="nav-item"><a href="<c:url value="/gallery/Write.do"/>" class="btn btn-success">글등록</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
						인재채용 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">인재상</a> <a class="dropdown-item"
							href="#">채용정보</a> <a class="dropdown-item" href="#">입사지원</a>
					</div></li>
				<li class="nav-item">
					<form class="form-inline justify-content-center" action="<c:url value="/gallery/Search.do"/>" method="get">
						<select class="form-control" name="searchColumn">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="name">작성자</option>	    
						</select>
						<input type="text" class="form-control mx-2 my-2" placeholder="검색어를 입력하세요" name="searchWord"/>      
						<button type="submit" class="btn btn-primary">검색</button>
					</form>
				</li>
			</ul>
		</div>
	</nav>
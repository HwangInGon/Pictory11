<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="/WEB-INF/views/Top.jsp"/>
<!doctype html>
<html lang="en">
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/login/fonts/icomoon/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/login/css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/login/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/login/css/style.css">

<title>Login #6</title>
</head>
<script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
<body>

<div class="d-lg-flex half">
	<div class="bg order-1 order-md-2"
			style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_1.jpg');"></div>
		<div class="contents order-2 order-md-1">
			<div class="container">    
			 	<div class="row align-items-center justify-content-center">
				  <div class="col-md-7">
					<div class="mb-4">
				 		<h3>Sign In</h3>	  
					</div>
	<c:if test="${not empty param.NotMember }">
		<div class="alert alert-success alert-dismissible fade show">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong>Failure!</strong> ${NotMember}
		</div>
	</c:if>
	
	<sec:authorize access="isAnonymous()">
		<form
				action="<c:url value="/auth/LoginProcess.do"/>"
				method="POST">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

			
			<div class="form-group first">
			<label for="username">Id</label> 
			<input type="text" class="form-control" name="id">
			</div>
			
			<div class="form-group last mb-3">
			<label for="password">Password</label> 
			<input type="password" class="form-control" name="pwd" id="password">
			</div>
			

			<div class="d-flex mb-5 align-items-center">
			<label class="control control--checkbox mb-0">
			<span class="caption">Remember me</span> 
			<input type="checkbox" checked="checked" />
			<div class="control__indicator"></div> </label> 
			<span class="ml-auto">
			<a href="#" class="forgot-pass">Forgot Password</a></span>
			</div>
			
			<input type="submit" value="Log In" id="login"
								class="btn btn-block"> 
			<br> 
		
		</form>
		<form action="<c:url value="/member/JoinAgree.do"/>">
		<input type="submit" value="Sign Up" id="signup" class="btn btn-block btn-primary">
		</form>
			<span class="d-block text-center my-4 text-muted">
			&mdash;	or &mdash;</span>
			
			<div class="social-login">
			<!-- kakao/naver Login -->
			<jsp:include page="/WEB-INF/views/kakaoLogin.jsp" />
			</div>
		
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div class="alert alert-success">
			  <strong>Success!</strong> <sec:authentication property="principal.username"/> 님 즐감하세요!
		</div>
	</sec:authorize>
	
</div>
</div>
<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</div>
</div>
</div>


	<script
		src="${pageContext.request.contextPath}/resources/login/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/login/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/login/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/login/js/main.js"></script>


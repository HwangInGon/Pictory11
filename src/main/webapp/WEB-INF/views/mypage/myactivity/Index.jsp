<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"  />
<div class="container">    
	<h2>마이페이지</h2>
	
	<ul>
		<li><a class="link-primary" href="<c:url value="/mypage/myactivity/ListArticle.do"/>">내가 쓴 글</a></li>
		<li><a class="link-primary" href="<c:url value="/mypage/myactivity/ListComment.do"/>">내가 쓴 댓글</a></li>
	</ul>	
<jsp:include page="/WEB-INF/views/Footer.jsp"  />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"  />
<div class="container">    
	<h2>구매목록</h2>
	
	<div>
		<ul>
			<li><a href="<c:url value="/gallery/Download.do?filename=10001"/>">글10001 (다운로드)</a></li>
			<li><a href="<c:url value="/gallery/View.do?no=10001"/>">글10001 (이동)</a></li>
			<li>구매일시 : 2022-02-01</li>
			<li>구매가격 : 100원</li>
		</ul>
	</div>
	<div>
		<ul>
			<li><a href="<c:url value="/gallery/Download.do?filename=10002"/>">글10002 (다운로드)</a></li>
			<li><a href="<c:url value="/gallery/View.do?no=10002"/>">글10002 (이동)</a></li>
			<li>구매일시 : 2022-02-02</li>
			<li>구매가격 : 200원</li>
		</ul>
	</div>

<jsp:include page="/WEB-INF/views/Footer.jsp"  />
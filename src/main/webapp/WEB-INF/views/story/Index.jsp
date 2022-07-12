<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"  />
<div class="container">    
	<h2>스토리</h2>
	<h3>category: ${category}</h3>
	<h3>catValue: ${catValue}</h3>
	
	
	
<div class="category_list_wrap" id="category_list_wrap" style="visibility: visible;">	
	<div id="innerDiscover">
		<h2 class="tit_discover"><span class="blind">Discover</span></h2>	
		<div id="tabDiscover">
			<ul>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=전체"/>" id="bottomType_0">전체</a></li>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=일상"/>" id="bottomType_1">일상</a></li>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=연애"/>" id="bottomType_2">연애</a></li>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=여행"/>" id="bottomType_3">여행</a></li>
				<li><a class="link-primary" href="<c:url value="/story/Category.do?category=디자인"/>" id="bottomType_4">디자인</a></li>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/Footer.jsp"  />
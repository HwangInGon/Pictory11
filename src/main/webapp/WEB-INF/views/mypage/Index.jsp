<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"  />
<div class="container">    
	<h2>마이페이지</h2>
	
	<ul>
		<li><a class="link-primary" href="<c:url value="/mypage/bookmark/Index.do"/>">북마크/좋아요</a></li>
		<li><a class="link-primary" href="<c:url value="/mypage/myactivity/Index.do"/>">내활동</a></li>
		<li><a class="link-primary" href="<c:url value="/mypage/sellbuy/Buy.do"/>">구매목록</a></li>
		<li><a class="link-primary" href="<c:url value="/mypage/sellbuy/Sell.do"/>">판매목록</a></li>
		<li><a class="link-primary" href="<c:url value="/mypage/alarm/Index.do"/>">알람</a></li>
	</ul>
	
	
	<div class="container">
		<table class="table table-bordered">
			<tbody class="table-sm">
				<tr>
					<th class="w-25 bg-dark text-white text-center">아이디</th>
					<td>${param.id}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">이름</th>
					<td>${name}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">성별</th>
					<td>${gender}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">관심사항</th>
					<td>${inter}</td>
				</tr>
				<tr>
					<th class="bg-dark text-white text-center" colspan="2">자기소개</th>
				</tr>
				<tr>
					<td colspan="2">${self}</td>
				</tr>
			</tbody>
		</table>
	
		<div class="text-center">
			<a href='<c:url value="/mypage/Edit.do" />' class="btn btn-success">수정</a>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/Footer.jsp"  />
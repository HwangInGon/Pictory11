<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"  />
<div class="container">    
	<h2>상세보기</h2>

	<table class="table table-bordered">
		<tbody class="table-sm">
			<tr>
				<th class="w-25 bg-dark text-white text-center">번호</th>
				<td>${article.no}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">작성자</th>
				<td>${article.name}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">작성일</th>
				<td>${article.postDate}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">조회수</th>
				<td>${article.count}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td>${article.title}</td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2">${fn:replace(article.content, newline, "<br/>")}</td>
				<!-- 
				.replace("\r\n", "<br/>")%></td>
				 -->
			</tr>
		</tbody>
	</table>


</div>

<jsp:include page="/WEB-INF/views/Footer.jsp"  />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"  />
<div class="container">    
	<h2>내가 쓴 댓글 ${id} / ${listComments}</h2>
	<span id="status">ㅇㅅㅇ</span>
	<button type="button" class="btn btn-danger" id="deleteButton">삭제</button>
	
	
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="10001">
	  <label class="form-check-label" for="inlineCheckbox1">댓글10001</label>
	</div>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="10002">
	  <label class="form-check-label" for="inlineCheckbox2">댓글10002</label>
	</div>

<jsp:include page="/WEB-INF/views/Footer.jsp"  />

<script>
	window.addEventListener('DOMContentLoaded', (event) => {
	    document.querySelector("#deleteButton").onclick = () => {
	        let tbdList = [];
	        
	        document.querySelectorAll('input[type=checkbox]')
	            .forEach((e) => {
	                if(e.checked) {
	                    tbdList.push(e.value);
	                }
	            });
   			
   			$.ajax({
				url: "<c:url value="/gallery/comment/Delete.do"/>",
				type: "POST",
				dataType: "json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data: {
   		        	${_csrf.parameterName}: "${_csrf.token}",
   		        	"cno": tbdList,
				},
				success:function(data) {
					document.querySelector("#status").innerHTML =  data.cnoList + " 삭제완료"
				}
			});
	        
	        
		}
	});
</script>
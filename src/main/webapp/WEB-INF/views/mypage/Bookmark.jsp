<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"  />
<div class="container">    
	<h2>북마크/좋아요</h2>
	
	<span id="status">ㅇㅅㅇ</span>
	
	<button type="button" class="btn btn-success" id="cartButton">카트</button>
	<button type="button" class="btn btn-danger" id="vacateButton">삭제</button>
	
	<a href="<c:url value="/gallery/View.do?no=10001"/>">글10001</a>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="10001">
	</div>
	<a href="<c:url value="/gallery/View.do?no=10002"/>">글10002</a>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="10002">
	</div>

<jsp:include page="/WEB-INF/views/Footer.jsp"  />

<script>
	window.addEventListener('DOMContentLoaded', (event) => {
	    document.querySelector("#cartButton").onclick = () => {
	        let tbdList = [];
	        document.querySelectorAll('input[type=checkbox]')
	            .forEach((e) => {
	                if(e.checked) {
	                    tbdList.push(e.value);
	                }
	            })
	        
            $.ajax({
				type: "GET",
				url: "<c:url value="/Cart.do"/>" + "?no=" + tbdList.join("&no="),
				dataType: "json",
		        success : (data) => {
					document.querySelector("#status").innerHTML =  data.noList + " 카트담기완료"
				}
			}); 
	        
	    }
	    
	    document.querySelector("#vacateButton").onclick = () => {
	        let tbdList = [];
	        document.querySelectorAll('input[type=checkbox]')
	            .forEach((e) => {
	                if(e.checked) {
	                    tbdList.push(e.value);
	                }
	            })
            $.ajax({
				type: "GET",
				url: "<c:url value="/mypage/bookmark/Revoke.do"/>" + "?no=" + tbdList.join("&no="),
				dataType: "json",
		        success : (data) => {
					document.querySelector("#status").innerHTML =  data.noList + " 북마크 취소 완료"
				}
			}); 
	    }
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"  />
<div class="container">    
	<h2>판매목록</h2>
	<span id="status">ㅇㅅㅇ</span>
	<button type="button" class="btn btn-success" id="modifyButton">가격수정</button>
	<button type="button" class="btn btn-danger" id="deleteButton">삭제</button>
	<button type="button" class="btn btn-danger" id="stopButton">판매중지</button>
	
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
		// 수정
	    document.querySelector("#modifyButton").onclick = () => {
	        let tbdList = [];
	        document.querySelectorAll('input[type=checkbox]')
	            .forEach((e) => {
	                if(e.checked) {
	                    tbdList.push(e.value);
	                }
	            })
            $.ajax({
				type: "GET",
				url: "<c:url value="/mypage/sellbuy/Modify.do"/>" + "?no=" + tbdList.join("&no="),
				dataType: "json",
		        success : (data) => {
					document.querySelector("#status").innerHTML =  data.noList + " 수정완료"
				}
			}); 
	    }
	    
	    // 삭제
	    document.querySelector("#deleteButton").onclick = () => {
	        let tbdList = [];
	        document.querySelectorAll('input[type=checkbox]')
	            .forEach((e) => {
	                if(e.checked) {
	                    tbdList.push(e.value);
	                }
	            })
            $.ajax({
				type: "GET",
				url: "<c:url value="/mypage/sellbuy/Delete.do"/>" + "?no=" + tbdList.join("&no="),
				dataType: "json",
		        success : (data) => {
					document.querySelector("#status").innerHTML =  data.noList + " 삭제완료"
				}
			}); 
	    }
	    
	    // 판매중단
	    document.querySelector("#stopButton").onclick = () => {
	        let tbdList = [];
	        document.querySelectorAll('input[type=checkbox]')
	            .forEach((e) => {
	                if(e.checked) {
	                    tbdList.push(e.value);
	                }
	            })
            $.ajax({
				type: "GET",
				url: "<c:url value="/mypage/sellbuy/Stop.do"/>" + "?no=" + tbdList.join("&no="),
				dataType: "json",
		        success : (data) => {
					document.querySelector("#status").innerHTML =  data.noList + " 판매중단완료"
				}
			}); 
	    }
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"/>
<h2> ㅇㅇㅇ </h2>
<div class="container">
	<h2>알람</h2>
	<div id="tabDiscover">
		<span>알람</span>
		<h3><span id="alarmSpan"></span></h3>
		<ul>
			<li><a class="link-primary alarm" id="alarm-comment">댓글/답글알림</a></li>
			<li><a class="link-primary alarm" id="alarm-sale">(내가올린글)판매알림</a></li>
			<li><a class="link-primary alarm" id="alarm-bookmark">(내가올린글)북마크알림</a></li>
			<li><a class="link-primary alarm" id="alarm-etc">기타알림</a></li>
		</ul>
	</div>
</div>

<script>
	window.addEventListener('DOMContentLoaded', () => {
		const alarms = document.querySelectorAll("a.alarm");

		Array.prototype.forEach.call(alarms, function(aTag) {
			aTag.addEventListener("click", alarmQuery, false);
		});

		function alarmQuery() {
			let type;
			if (this.id.indexOf("comment") != -1) {
				type = "Comment";
			} else if (this.id.indexOf("sale") != -1) {
				type = "Sale";
			} else if (this.id.indexOf("bookmark") != -1) {
				type = "Bookmark";
			} else {
				type = "Etc";
			}
			
	        $.ajax({
				type: "GET",
				url: "<c:url value="/mypage/alarm/"/>" + type + ".do",
				dataType: "json",
				success : (data) => {
		        	console.log(data);
					document.querySelector("#alarmSpan").innerHTML =  data.id + "에게 " + data.type + "의 알람이 " + data.alarmList + "있습니다.";
				}
			});
		}
	});
</script>
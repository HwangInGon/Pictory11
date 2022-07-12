<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/Top.jsp"  />
<div class="container">    
	<h2>갤러리</h2>
	
	<h4>당신을 위한 컨텐츠</h4>
	<div id="recommendDIV">
	</div>
	
	<h4>탑 크리에이터</h4>
	<div id="topCreatorDIV">
	</div>
	
	
	
	<h3><span id="categorySpan"></span></h3>
	<h3><span id="catValueSpan"></span></h3>
	<h3><span id="cartSpan"></span></h3>
	<h3><span id="purchaseSpan"></span></h3>
	<h3><span id="downloadSpan"></span></h3>

	
	<div id="innerDiscover">
		<h2 class="tit_discover"><span class="blind">Discover</span></h2>	
		<div id="tabDiscover">
			<ul>
				<li id="tabCategory">
				<span>유형별</span>
				<ul>
					<li><a class="link-primary category" id="bottomType_0">일러스트</a></li>
					<li><a class="link-primary category" id="bottomType_1">사진</a></li>
					<li><a class="link-primary category" id="bottomType_2">회화</a></li>
					<li><a class="link-primary category" id="bottomType_3">캘리그라피</a></li>
					<li><a class="link-primary category" id="bottomType_4">패턴</a></li>
				</ul>
				</li>
				<li id="tabTag">
				<span>태그별</span>
				<ul>
					<li><a class="link-primary category" id="bottomTag_0">전체</a></li>
					<li><a class="link-primary category" id="bottomTag_1">커플</a></li>
					<li><a class="link-primary category" id="bottomTag_2">행복한 우리집</a></li>
					<li><a class="link-primary category" id="bottomTag_3">꽃</a></li>
					<li><a class="link-primary category" id="bottomTag_4">사랑</a></li>
				</ul>
				</li>
				<li id="tabColor">
				<span>색상별</span>
				<ul>
					<li><a class="link-primary category" id="bottomColor_0">흰색</a></li>
					<li><a class="link-primary category" id="bottomColor_1">빨강</a></li>
					<li><a class="link-primary category" id="bottomColor_2">파랑</a></li>
					<li><a class="link-primary category" id="bottomColor_3">주횡</a></li>
					<li><a class="link-primary category" id="bottomColor_4">노랑</a></li>
				</ul>
				</li>
			</ul>
		</div>
	</div>
</div>

<h3>검색 결과 = ${articleList }</h3>


<h3>정렬</h3>
<ul>
<li><a type="button" class="btn btn-warning paid-filter" id="paidFilter">구매한 사진만 보기</a> <span id="paidList"></span></li>
<li><a type="button" class="btn btn-warning recent-filter" id="recentFilter">최신순</a> <span id="recentList"></span></li>
</ul>

<ul>
<li>
	<img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre">
	<a href="<c:url value="/gallery/View.do?no=10001"/>">글10001</a>
	<a type="button" class="btn btn-warning cart" id="cart10001">카트</a>
	<a type="button" class="btn btn-primary purchase" id="purchase10001">구매</a>
</li>
<li>
	<img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre">
	<a href="<c:url value="/gallery/View.do?no=10002"/>">글10002</a>
	<a type="button" class="btn btn-warning cart" id="cart10002">카트</a>
	<a type="button" href="<c:url value="/gallery/Download.do?filename=10002"/>" class="btn btn-primary download" id="download10002">다운로드</a>
</li>
<li>
	<img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre">
	<a href="<c:url value="/gallery/View.do?no=10003"/>">글10003</a>
	<a type="button" class="btn btn-warning cart" id="cart10003">카트</a>
	<a type="button" href="<c:url value="/gallery/Download.do?filename=10003"/>" class="btn btn-primary download" id="download10003">다운로드</a>
</li>
</ul>

<jsp:include page="/WEB-INF/views/Footer.jsp"  />


<script>
	window.addEventListener('DOMContentLoaded', () => {
		const categories = document.querySelectorAll("a.category");
		const carts = document.querySelectorAll("a.cart");
		const downloads = document.querySelectorAll("a.download");
		const purchases = document.querySelectorAll("a.purchase");
		const paidFilter = document.querySelector("#paidFilter");
		const recentFilter = document.querySelector("#recentFilter");

		Array.prototype.forEach.call(categories, function(aTag) {
			aTag.addEventListener("click", categoryQuery, false);
		});
		Array.prototype.forEach.call(carts, function(aTag) {
			aTag.addEventListener("click", cartQuery, false);
		});
		Array.prototype.forEach.call(purchases, function(aTag) {
			aTag.addEventListener("click", purchaseQuery, false);
		});
		paidFilter.addEventListener("click", paidQuery, false);
		recentFilter.addEventListener("click", recentQuery, false);

		let category;
		let catValue;

		function categoryQuery() {
			catValue = this.innerHTML;
			if (this.id.indexOf("Color") != -1) {
				category = "color";
			} else if (this.id.indexOf("Tag") != -1) {
				category = "tag";
			} else {
				category = "type";
			}
	        $.ajax({
				type: "GET",
				url: "<c:url value="/gallery/Category.do"/>"+"?category="+category+"&catValue="+catValue,
				dataType: "json",
		        success : (data) => {
					document.querySelector("#categorySpan").innerHTML =  "category: " + data.category;
					document.querySelector("#catValueSpan").innerHTML =  "catValue: " + data.catValue;
				}
			});
		}

		function cartQuery() {
			const articleNo = this.id.split("cart")[1];
	        $.ajax({
				type: "GET",
				url: "<c:url value="/Cart.do"/>"+"?no="+articleNo,
				dataType: "json",
		        success : (data) => {
					document.querySelector("#cartSpan").innerHTML = data.no + "가 카트에 등록됐습니다.";
				}
			});
		}

		function purchaseQuery() {
			const articleNo = this.id.split("purchase")[1];
	        $.ajax({
				type: "GET",
				url: "<c:url value="/Purchase.do"/>"+"?no="+articleNo,
				dataType: "json",
		        success : (data) => {
					document.querySelector("#purchaseSpan").innerHTML = data.no + "가 구매됐습니다.";
				}
			});
		}

		function paidQuery() {
	        $.ajax({
				type: "GET",
				url: "<c:url value="/gallery/Sort.do"/>"+"?type=paid" + "&category=" + category + "&catValue=" + catValue,
				dataType: "json",
		        success : (data) => {
		        	console.log(1111);
					document.querySelector("#paidList").innerHTML = "111";
				}
			});
		}

		function recentQuery() {
	        $.ajax({
				type: "GET",
				url: "<c:url value="/gallery/Sort.do"/>" + "?type=recent" + "&category=" + category + "&catValue=" + catValue,
				dataType: "json",
		        success : (data) => {
					document.querySelector("#recentList").innerHTML = data.articleList;
				}
			});
		}
		
		//
		// LOAD function으로 뺄 영역
		//
		const recommendDIV = document.querySelector("#recommendDIV");
		const topCreatorDIV = document.querySelector("#topCreatorDIV");
		
		// innerHTML에 들어가는 데이터는 하드코딩이 아닌 요청으로 이뤄질 예정
		recommendDIV.innerHTML = `
			<div class="d-flex flex-row bd-highlight mb-3">
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_1"><span>브런치 먹는 날</span></a></div>
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_2"><span>빈티지</span></a></div>
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_3"><span>여름</span></a></div>
		    </div>
		    <div class="d-flex flex-row bd-highlight mb-3">
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		    </div>
		`;
		
		// innerHTML에 들어가는 데이터는 하드코딩이 아닌 요청으로 이뤄질 예정
		topCreatorDIV.innerHTML = `
		    <div class="d-flex flex-row bd-highlight mb-3">
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_1"><span>브런치 먹는 날</span></a></div>
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_2"><span>빈티지</span></a></div>
		        <div class="p-4 bd-highlight"><a type="button" class="btn btn-success" id="id_3"><span>여름</span></a></div>
		    </div>
		    <div class="d-flex flex-row bd-highlight mb-3">
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		        <div class="p-2 bd-highlight"><img src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg" class="img-rounded" alt="Cinque Terre"></div>
		    </div>
		`;
	});
</script>
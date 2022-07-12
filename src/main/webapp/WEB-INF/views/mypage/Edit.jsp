<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="/WEB-INF/views/Top.jsp"/>


<div class="container">
	<div class="jumbotron bg-light">
		<h1>
			마이페이지<small>수정</small>
		</h1>
	</div>
</div>

	<div class="container">
	 	<form action='<c:url value="/mypage/Edit.do" />' method="post" id="joinForm">
	 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	 		
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">아이디</span>
				<input type="text" class="form-control col-4 mr-2" name="id" placeholder="아이디를 입력하세요">
				<a onclick=checkId(true) class="col-1 btn btn-primary">중복확인</a>
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">비밀번호</span>
				<input type="password" class="form-control col-4" name="pwd" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">비밀번호확인</span>
				<input type="password" class="form-control col-4" name="pwd2" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">이름</span>
				<input type="text" class="form-control col-4" name="name" placeholder="이름을 입력하세요">
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">성별</span>
				<div class="d-flex">
					<div class="custom-control custom-radio mr-2">
						<input type="radio" class="custom-control-input" name="gender" value="male" id="male"> 
						<label for="male" class="custom-control-label">남자</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" class="custom-control-input" name="gender" value="female" id="female"> 
						<label for="female"	class="custom-control-label">여자</label>
					</div>
				</div>
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">관심사항</span>
				<div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="inter" id="POL" value="POL">
						<label class="form-check-label" for="POL">정치</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="inter" id="ECO" value="ECO">
						<label class="form-check-label" for="ECO">경제</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="inter" id="ENT" value="ENT">
						<label class="form-check-label" for="ENT">연예</label>
					</div>
				</div>
			</div>
			
			


			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">학력</span>
				<select name="grade" class="custom-select mt-3 custom-select-lg col-8">
					<option value="">학력을 선택하세요</option>
					<option value="ELE">초등학교</option>
					<option value="MID">중학교</option>
					<option value="HIG">고등학교</option>
					<option value="UNI">대학교</option>
				</select>
			</div>
			<div class="form-inline my-2">
				<span class="col-2 mr-2 text-right" style="font-size:16px">자기소개</span>
				<textarea class="form-control col-8" rows="5" name="self"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">수정</button>
		</form>
	</div>

<script>
	
</script>
   
<jsp:include page="/WEB-INF/views/Footer.jsp"/>
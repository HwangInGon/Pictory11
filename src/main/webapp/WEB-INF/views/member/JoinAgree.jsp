<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="/WEB-INF/views/Top.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/membership/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/membership/checkBox.js"></script>

</head>
<body>
    <form action="" id="joinForm">
        <ul class="join_box">
            <li class="checkBox check01">
                <ul class="clearfix">
                    <li>이용약관, 개인정보 수집 및 이용,
                        위치정보 이용약관(선택), 프로모션 안내
                        메일 수신(선택)에 모두 동의합니다.</li>
                    <li class="checkAllBtn">
                        <input type="checkbox" name="chkAll" id="chkAll" class="chkAll">
                    </li>
                </ul>
            </li>
            <ul class="filsu">
            <li class="checkBox check02">
                <ul class="clearfix">
                    <li>이용약관 동의(필수)</li>
                    <li class="checkBtn">
                        <input type="checkbox" id="termsService" name="chk" class="chk"> 
                    </li>
                </ul>
                <textarea name="" id="">여러분을 환영합니다.
픽토리 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 픽토리 서비스의 이용과 관련하여 픽토리 서비스를 제공하는 픽토리 주식회사(이하 ‘네이버’)와 이를 이용하는 픽토리 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 픽토리 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
            </li>
            <li class="checkBox check03">
                <ul class="clearfix">
                    <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk" class="chk">
                    </li>
                </ul>

                <textarea name="" id="">여러분을 환영합니다.
픽토리 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 픽토리 서비스의 이용과 관련하여 픽토리 서비스를 제공하는 픽토리 주식회사(이하 ‘네이버’)와 이를 이용하는 픽토리 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 픽토리 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
            </li>
            </ul>
            <li class="checkBox check03">
                <ul class="clearfix">
                    <li>위치정보 이용약관 동의(선택)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk" class="chk">
                    </li>
                </ul>

                <textarea name="" id="">여러분을 환영합니다.
픽토리 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 픽토리 서비스의 이용과 관련하여 픽토리 서비스를 제공하는 픽토리 주식회사(이하 ‘네이버’)와 이를 이용하는 픽토리 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 픽토리 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
            </li>
            <li class="checkBox check04">
                <ul class="clearfix">
                    <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                    <li class="checkBtn">
                        <input type="checkbox" name="chk" class="chk">
                    </li>
                </ul>
                <span class="error" id="agreeMsg" style="display:none">픽토리 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
            </li>
        </ul>
        </form>
        <div class="buttonbox" style="display:inline-block">
          <div class="btn1">
             <button type="submit" class="fpmgBt1" onclick="location.href='<c:url value="/auth/Login.do"/>';">비동의</button>
          </div>
          <form action="<c:url value = "/member/Join.do"/>" class="btn2">
          	<button type="submit" class="fpmgBt2">동의</button>
          </form>
        
      	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/Footer.jsp"/>
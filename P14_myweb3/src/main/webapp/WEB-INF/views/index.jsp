<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중고마켓</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/index-style.css">
</head>
<body>
	<div class="container">
		<!-- nav -->
		<nav>
	        <ul class="gnb-lnb">
	            <li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li>
	            <c:choose>
	   				<c:when test="${not empty loginUser || not empty loginAdmin}"><li class="left-nav"><a href="/root/board/qna">문의 하기</a></li></c:when>
	            </c:choose>
	            <c:choose>
	          		<c:when test="${empty loginUser && empty loginAdmin}"><li class="right-nav"><a href="/root/member/register_form">회원가입</a></li></c:when>
	            </c:choose>
	            <c:choose>
	   				<c:when test="${not empty loginUser || not empty loginAdmin}"><li class="left-nav"><a href="/root/board/boardAllList">팝니다🙌</a></li></c:when>
	            </c:choose>
	            <c:choose>
				   	<c:when test="${empty loginUser && empty loginAdmin}"><li class="right-nav"><a href="/root/member/login">로그인</a></li></c:when>
				   	<c:when test="${not empty loginUser || not empty loginAdmin}"><li class="right-nav"><a href="/root/member/logouttest">로그아웃</a></li></c:when>
				</c:choose>
				<c:choose>
	   				<c:when test="${not empty loginAdmin}">
	   					<li class="right-nav clicked"><a href="/root/member/mypage?id=${loginAdmin }">마이페이지</a></li>
	   					<li class="right-nav profile-ico"><a href="/root/member/mypage?id=${loginAdmin }"><img src="img/ico-profile.png" alt=""></a></li>
	   				</c:when>
	   				<c:when test="${not empty loginUser }">
	   					<li class="right-nav clicked"><a href="/root/member/mypage?id=${loginUser }">마이페이지</a></li>
	   					<li class="right-nav profile-ico"><a href="/root/member/mypage?id=${loginUser}"><img src="img/ico-profile.png" alt=""></a></li>
	   				</c:when>
	            </c:choose>
	        </ul>
    	</nav>
        <!-- header -->
        <header>
            <h1>편리한 중고 거래 플랫폼,<br><span>중고</span>마켓</h1>
        </header>
    </div>
    <!-- section -->
    <section>
        <article>
            <div class="container">
                <img src="img/index-img3.png" alt="">
                <div class="text">
                    <h1>집 안에 안쓰는 물건이 있으신가요?</h1>
                    <br>
                    <h2>중고마켓에 올려보세요! 💰</h2>
                </div>
                
            </div>
        </article>
        <article>
            <div class="container">
                <h2>지금 중고마켓과 함께 하세요!</h2>
               	<c:if test="${empty loginUser && empty loginAdmin}">
                	<div class="btn"><a href="/root/member/register_form">가입하기</a></div>
                </c:if>
                <c:if test="${not empty loginUser }">
                	<h2>${loginUser }님 환영합니다</h2>
                </c:if>
                <c:if test="${not empty loginAdmin }">
                	<h2>${loginAdmin }님 환영합니다</h2>
                </c:if>
            </div>
        </article>
    </section>
    <!-- footer -->
    <footer>
	    <div class="container">
	        <a href="https://github.com/KoreaAcademeTeamFive" target="_blank"><img src="img/icon-github.png" alt="" class="ico-github"></a>
	        <div class="text">
	            <p>안범기 유동준 이승정 이덕현</p>
	            <p>Copyright 2022. TeamFive. All Rights Reserved.</p>
	        </div>
	    </div>
    </footer>
</body>
</html>
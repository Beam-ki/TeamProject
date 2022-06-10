<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <C:choose>
			    	<C:when test="${not empty id }"><li class="right-nav"><a href="/root/board/qna">문의 하기</a></li></C:when>
                </C:choose>
                <C:choose>
                <C:when test="${empty id }"><li class="right-nav"><a href="/root/member/register_form">회원가입</a></li></C:when>
                </C:choose>
                <C:choose>
			    	<C:when test="${not empty id }"><li class="right-nav"><a href="/root/member/memberinfo">내 정보 보기</a></li></C:when>
                </C:choose>
                <C:choose>
			    	<C:when test="${not empty id }"><li class="right-nav"><a href="/root/board/boardAllList">판매 게시판</a></li></C:when>
                </C:choose>
                <C:choose>
			    	<C:when test="${empty id }"><li class="right-nav"><a href="/root/member/login">로그인</a></li></C:when>
			    	<C:when test="${not empty id }"><li class="right-nav"><a href="/root/member/logouttest">로그아웃</a></li></C:when>
		  		</C:choose>
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
                <div class="btn"><a href="/root/member/register">가입하기</a></div>
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
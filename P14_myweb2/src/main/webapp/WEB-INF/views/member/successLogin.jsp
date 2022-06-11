<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중고마켓</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
</head>
<body>
    <div class="container">
        <nav>
            <ul>
                <li><a href="/root/index"><span>중고</span>마켓</a></li>
                <li><a href="/root/board/boardAllList">팝니다🙌</a></li>
                <li><a href="/root/board/qna">문의하기</a></li>
            </ul>
        </nav>
        <header>
            <h1>안쓰는 물건 사고팔땐, <strong>중고</strong> 마켓</h1>
            <img src="../img/img-header.png" alt="">
        </header>
        <section>
            <article id="con-left">
                <h2>팝니다🙌</h2>
                <p class="notice"><span>공지</span><a href="#">팝니다🙌 게시판 이용방법</a></p>
                <div class="product">
                	<a href="#"><div class="thumbnail"></div></a><p class="p-title"><a href="#">닌텐도 스위치 라이트 팝니다.</a></p>
                </div>
                <div class="product">
                	<a href="#"><div class="thumbnail"></div></a><p class="p-title"><a href="#">닌텐도 스위치 라이트 팝니다.</a></p>
                </div>
                <div class="product">
                	<a href="#"><div class="thumbnail"></div></a><p class="p-title"><a href="#">닌텐도 스위치 라이트 팝니다.</a></p>
                </div>
                <div class="product">
                	<a href="#"><div class="thumbnail"></div></a><p class="p-title"><a href="#">닌텐도 스위치 라이트 팝니다.</a></p>
                </div>
                <div class="product">
                	<a href="#"><div class="thumbnail"></div></a><p class="p-title"><a href="#">닌텐도 스위치 라이트 팝니다.</a></p>
                </div>
                <div class="product">
                	<a href="#"><div class="thumbnail"></div></a><p class="p-title"><a href="#">닌텐도 스위치 라이트 팝니다.</a></p>
                </div>
            </article>
            <article id="con-right">
                <div id="login">
                	<h1>로그인 성공 : ${loginUser }님 안녕하세요</h1>
                </div>
                <div id="ranking">
                    <p>👑 마일리지 랭킹</p>
                    <p><span>1위</span> 홍길동(1,000,000점)</p>
                    <p><span>2위</span> 이몽룡(900,000점)</p>
                    <p><span>3위</span> 성춘향(800,000점)</p>
                </div>
            </article>
        </section>
        
        <footer>
            <a href="#"><img src="../img/icon-github.png" alt=""></a>
            <p>안범기 유동준 이승정 이덕현</p>
            <p>Copyright 2022. TeamFive. All Rights Reserved.</p>
        </footer>
    </div>
</body>
</html>
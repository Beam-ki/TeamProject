<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
    <style>
        section {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- nav -->
        <nav>
            <ul class="gnb-lnb">
            	<li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li>
                <!--  <li class="left-nav clicked"><a href="/root/board/boardAllList">팝니다🙌</a></li>-->
                <!--  <li class="left-nav"><a href="/root/board/qna">문의하기</a></li>-->
                <li class="right-nav join"><a href="/root/member/register_form">회원가입</a></li>
                <li class="right-nav"><a href="/root/member/login">로그인</a></li>
                
<!--                 <li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li> -->
<!--                 <li class="left-nav clicked"><a href="/root/board/boardAllList">팝니다🙌</a></li> -->
<!--                 <li class="left-nav"><a href="/root/board/qna">문의하기</a></li> -->
<!--                 <li class="right-nav join"><a href="/root/member/register">회원가입</a></li> -->
<%--                 <C:choose> --%>
<%-- 			    	<C:when test="${empty loginUser }"><li class="right-nav"><a href="/root/member/login">로그인</a></li></C:when> --%>
<%-- 			    	<C:when test="${not empty loginUser }"><li class="right-nav"><a href="/root/member/logouttest">로그아웃</a></li></C:when> --%>
<%-- 		  		</C:choose> --%>

            </ul>
        </nav>

        <!-- section -->
        <section>
            <h1>회원가입</h1>
            <p>중고마켓에 오신걸 환영합니다! 이제 몇가지 정보만 입력하면 완료됩니다.</p>

            <form id=register name="register" action="/root/member/register" method="post">
                <fieldset>
                    <p>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" placeholder="이름을 입력해주세요" value="${member.name }" required></p>
                    <p>아이디&nbsp;&nbsp;&nbsp;<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" value="${member.id }" required></p>
                    <p>비밀번호<input type="password" name="pw" placeholder="비밀번호를 입력해주세요" required></p>
                    <p>닉네임&nbsp;&nbsp;&nbsp;<input type="text" name="nickname" placeholder="닉네임을 입력해주세요" value="${member.nickname }" required></p>
                    <p>이메일&nbsp;&nbsp;&nbsp;<input type="email" name="email" placeholder="이메일을 입력해주세요" value="${member.email }" required></p>
                    <input class="btn btn-submit" type="submit" value="가입하기">
                </fieldset>
            </form>
        </section>
    </div>

    <!-- footer -->
    <footer>
        <div class="container">
            <a href="https://github.com/KoreaAcademeTeamFive" target="_blank"><img src="../img/icon-github.png" alt="" class="ico-github"></a>
            <div class="text">
                <p>안범기 유동준 이승정 이덕현</p>
                <p>Copyright 2022. TeamFive. All Rights Reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>
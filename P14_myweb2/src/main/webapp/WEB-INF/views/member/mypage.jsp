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
    <title>마이페이지</title>
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
                <li class="left-nav"><a href="/root/board/AllList">팝니다🙌</a></li>
                <li class="left-nav"><a href="/root/board/qna">문의하기</a></li>
                <li class="right-nav first"><a href="index.html">로그아웃</a></li>
                <li class="right-nav clicked"><a href="root/member/mypage">마이페이지</a></li>
                <li class="right-nav profile-ico"><a href="root/member/mypage"><img src="img/ico-profile.png" alt=""></a></li>
            </ul>
        </nav>
        <section>
            <h2>마이페이지</h2>
            <div class="mypage">
                <div class="mypage-nav">
                    <ul class="mypage-rnb">
                        <li class="clicked"><a href="mypage.html">내 정보 수정</a></li>
                        <li><a href="mypage-product.html">내가 쓴 글</a></li>
                        <li><a href="#">마일리지 내역</a></li>
                    </ul>
                </div>
                <div class="mypage-con">
                    <form action="" method="post">
                        <fieldset>
                            <p>이름<input type="text" name="name" placeholder="아무개" disabled></p>
                            <p>아이디<input type="text" name="id" placeholder="test" disabled></p>
                            <p>비밀번호<input type="password" name="password" placeholder="비밀번호를 입력해주세요" required></p>
                            <p>닉네임<input type="text" name="nickname" placeholder="아무갱" disabled></p>
                            <p>이메일<input type="email" name="email" placeholder="test@test.com" disabled></p>
                            <input class="btn btn-submit" type="submit" value="수정하기">
                        </fieldset>
                    </form>
                </div>
            </div>
            
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
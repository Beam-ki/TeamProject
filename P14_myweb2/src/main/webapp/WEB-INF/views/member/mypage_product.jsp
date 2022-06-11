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
    <title>내가 쓴 글</title>
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
                <li class="right-nav clicked"><a href="/root/member/mypage">마이페이지</a></li>
                <li class="right-nav profile-ico"><a href="/root/member/mypage"><img src="img/ico-profile.png" alt=""></a></li>
            </ul>
        </nav>
        <section>
            <h2>마이페이지</h2>
            <div class="mypage">
                <div class="mypage-nav">
                    <ul class="mypage-rnb">
                        <li><a href="/root/member/mypage">내 정보 수정</a></li>
                        <li class="clicked"><a href="/root/member/mypage_product">내가 쓴 글</a></li>
                        <li><a href="#">마일리지 내역</a></li>
                    </ul>
                </div>
                <div class="mypage-con">
                    <table border="1">
                        <tr>
                            <th>번호</th>
                            <th class="t-title">제목</th>
                            <th>날짜</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="product-detail.html">닌텐도 스위치 팝니다.</a></td>
                            <td>2022.06.08</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><a href="product-detail.html">맘스터치 기프티콘 팝니다.</a></td>
                            <td>2022.06.08</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><a href="product-detail.html">더미텍스트입니다.</a></td>
                            <td>2022.06.08</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><a href="product-detail.html">더미텍스트입니다.</a></td>
                            <td>2022.06.08</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td><a href="product-detail.html">더미텍스트입니다.</a></td>
                            <td>2022.06.08</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td><a href="product-detail.html">더미텍스트입니다.</a></td>
                            <td>2022.06.08</td>
                        </tr>
                    </table>
                    <ul class="paging">
                        <a href="javascript:;"><li>&lt;</li></a>
                        <a href="javascript:;"><li>1</li></a>
                        <a href="javascript:;"><li>2</li></a>
                        <a href="javascript:;"><li>3</li></a>
                        <a href="javascript:;"><li>4</li></a>
                        <a href="javascript:;"><li>5</li></a>
                        <a href="javascript:;"><li>&gt;</li></a>
                    </ul>
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
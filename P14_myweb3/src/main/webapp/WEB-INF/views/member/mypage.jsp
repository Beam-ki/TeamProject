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
        <c:import url="../default/nav.jsp"/>
        <!-- section -->
        <section>
            <h2>마이페이지</h2>
            <div class="mypage">
                <div class="mypage-nav">
                    <ul class="mypage-rnb">
                        <li><a href="info?id=${member.id }">내 정보 수정</a></li>
                        <li><a href="mypage-product.html">내가 쓴 글</a></li>
                        <li><a href="memberDelete?id=${member.id }">회원 탈퇴</a></li>
                    </ul>
                </div>
            </div>
            
        </section>
    </div>
    <!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>
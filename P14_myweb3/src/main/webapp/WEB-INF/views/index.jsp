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
		<c:import url="default/nav.jsp"/>
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
                <c:choose>
                <c:when test="${empty loginUser }"><div class="btn"><a href="/root/member/register_form">가입하기</a></div></c:when>
                <c:when test="${not empty loginUser }"><h2>${loginUser }님 환영합니다</h2></c:when>
                </c:choose>
            </div>
        </article>
    </section>
    <!-- footer -->
    <c:import url="default/footer.jsp"></c:import>
</body>
</html>
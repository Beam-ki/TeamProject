<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <nav>
        <ul class="gnb-lnb">
            <li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li>
            <c:choose>
   				<c:when test="${not empty loginUser }"><li class="right-nav"><a href="/root/board/qna">문의 하기</a></li></c:when>
            </c:choose>
            <c:choose>
          		<c:when test="${empty loginUser }"><li class="right-nav"><a href="/root/member/register_form">회원가입</a></li></c:when>
            </c:choose>
            <c:choose>
   				<c:when test="${not empty loginUser }"><li class="right-nav"><a href="/root/member/memberinfo">내 정보 보기</a></li></c:when>
            </c:choose>
            <c:choose>
   				<c:when test="${not empty loginUser }"><li class="right-nav"><a href="/root/board/boardAllList">판매 게시판</a></li></c:when>
            </c:choose>
            <c:choose>
			   	<c:when test="${empty loginUser }"><li class="right-nav"><a href="/root/member/login">로그인</a></li></c:when>
			   	<c:when test="${not empty loginUser }"><li class="right-nav"><a href="/root/member/logouttest">로그아웃</a></li></c:when>
			</c:choose>
        </ul>
    </nav>
</body>
</html>
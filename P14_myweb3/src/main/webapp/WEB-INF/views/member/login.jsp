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
    <title>로그인</title>
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
                <!--  <li class="right-nav"><a href="/root/member/login">로그인</a></li>-->
            </ul>
        </nav>
        <!-- section -->
        <section>
            <h1>로그인</h1>
            <p>중고마켓을 이용하시려면 로그인 해주세요.</p>
            <!-- action 속성 값 주소 백엔드 분들께 물어보기 -->
            <form action="${contextPath }/member/logintest" method="post">
                <fieldset>
                    <p>아이디&nbsp;&nbsp;&nbsp;<input type="text" name="id" placeholder=" 아이디를 입력해주세요" required></p>
                    <p>비밀번호<input type="password" name="pw" placeholder=" 비밀번호를 입력해주세요" required></p>
                    <input class="btn btn-submit" type="submit" value="로그인">
                    <a href="/root/member/register_form" class="btn btn-submit">회원가입</a>
                </fieldset>
            </form>    
        </section>
    </div>

    <!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>


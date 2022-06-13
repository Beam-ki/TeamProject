<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
                        <li class="clicked"><a href="mypage.html">내 정보 수정</a></li>
                        <li><a href="mypage-product.html">내가 쓴 글</a></li>
                        <li><a href="mypage-mileage.html">마일리지 내역</a></li>
                    </ul>
                </div>
                <div class="mypage-con">
                    <form action="" method="post">
                        <fieldset>
                            <label for="name">이름</label><input type="text" name="name" placeholder="test" required disabled><br>
        
                            <label for="id">아이디</label><input type="text" name="id" placeholder="test" required disabled><br>
        
                            <label for="password">비밀번호</label><input type="password" name="password" placeholder="비밀번호를 입력해주세요" required ><br>
        
                            <label for="password-check">비밀번호 확인</label><input type="password" name="password-check" placeholder="비밀번호를 입력해주세요" required><br>
        
                            <label for="nickname">닉네임</label><input type="text" name="nickname" placeholder="test" required disabled><br>
        
                            <label for="email">이메일</label><input type="email" name="email" placeholder="test@test.com" required disabled><br>
                            <div style="text-align: center;" class="btn-wrapper">
                                <input class="btn btn-submit" type="submit" value="수정하기">
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
            
        </section>
    </div>
    <!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>
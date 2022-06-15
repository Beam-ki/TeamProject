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
    <title>마일리지 적립이 안됩니다.</title>
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
                <li class="left-nav home"><a href="index.html"><span>중고</span>마켓</a></li>
                <li class="left-nav"><a href="product.html">팝니다🙌</a></li>
                <li class="left-nav clicked"><a href="qna.html">문의하기</a></li>
                <li class="right-nav first"><a href="index.html">로그아웃</a></li>
                <li class="right-nav"><a href="mypage.html">마이페이지</a></li>
                <li class="right-nav profile-ico"><a href="mypage.html"><img src="img/ico-profile.png" alt=""></a></li>
            </ul>
        </nav>
		<c:import url="../default/nav.jsp"/>
        
        
        <!-- header -->
        <header>
            <h1>안쓰는 물건 사고팔땐, <span>중고</span>마켓</h1>
        </header>



		<!-- section -->
        	<section class="qna-form">
            	<h2>문의 게시판</h2>
     	       <div class="title-wrapper">
        	        <p>제목</p><div class="title">마일리지 적립이 안됩니다.</div>
         	   </div>            
          	  <div class="content">마일리지 적립이 안돼요.</div>
          	  <div class="btn-wrapper">
          	      <a href="qna.html"><div class="btn btn-submit">&lt; back</div></a>
          	      
          	      <c:if test="${data.product_img=='nan' }">
						<b>이미지가 없습니다</b>
					</c:if>
					<c:if test="${data.product_img!='nan' }">
						<img src="${contextPath }/board/download?file=${data.product_img }" width="200px" height="200px">
					</c:if>
          	  </div>
          	  
          	  <textarea id="content" name="content" rows="10" cols="110" readonly placeholder="문의 내용을 입력하세요">${data.product_main }</textarea>
			<br>
			<c:if test="${data.product_writer==loginUser }">
				<input type="button" 
				       value="수정" onclick="location.href='${contextPath}/board/modifyForm?product_no=${data.product_no }'">
				<input type="button" 
			           value="삭제" onclick="location.href='${contextPath}/board/delete?product_no=${data.product_no }&product_img=${data.product_img }'">
			</c:if>
			<input type="button" value="글목록" onclick="location.href='${contextPath}/board/boardAllList'">
      	  </section>

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
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>
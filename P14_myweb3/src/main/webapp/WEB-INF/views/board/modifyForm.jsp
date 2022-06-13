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
    <title>게시글 등록</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	function readURL(input){
		var file=input.files[0] // 파일 정보
		console.log(file)
		if(file!=""){
			var reader=new FileReader()
			reader.readAsDataURL(file) // 파일 정보 읽어오기
			reader.onload=function(e){ // 일기에 성공하면 결과 표시
				$("#preview").attr("src", e.target.result)
			}
		}
	}
	</script>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
    <style>
        section {
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- container -->
    <div class="container">
        <!-- nav -->
        <nav>
            <ul class="gnb-lnb">
                <li class="left-nav home"><a href="/root/login"><span>중고</span>마켓</a></li>
                <li class="left-nav clicked"><a href="/root/board/boardAllList">팝니다🙌</a></li>
                <li class="left-nav"><a href="root/board/qna">문의하기</a></li>
                <li class="right-nav first"><a href="">로그아웃</a></li>
                <li class="right-nav"><a href="">마이페이지</a></li>
                <li class="right-nav profile-ico"><a href=""><img src="../img/ico-profile.png" alt=""></a></li>
            </ul>
        </nav>

        <!-- header -->
        <header>
            <h1>안쓰는 물건 사고팔땐,<br><span>중고</span>마켓</h1>
        </header>

        <!-- section -->
        <section class="writing">
            <h2>게시글 등록하기</h2>
            <form action="${contextPath }/board/modify" enctype="multipart/form-data" method="post">
                <fieldset>
                    <input type="hidden" name="product_no" value="${data.product_no }">
					<input type="hidden" name="originFileName" value="${data.product_img }"><!-- 이미지 변경시 삭제에 사용하는 값 -->
                    
                    <p class="wr-title">제목<input type="text" name="product_title" value="${data.product_title }" required></p>
                    <textarea name="product_main" id="wr-con" cols="130" rows="20" required><c:out value="${data.product_main }"/></textarea>
                    <input type="file" class="file" name="product_img" onchange="readURL(this)">
                    <img id="preview" src="${contextPath }/board/download?file=${data.product_img }" width="100px" height="100px">
                    <div class="btn-wrapper">
                        <div class="btn btn-submit"><a href="${contextPath }/board/contentView?product_no=${data.product_no}">&lt; back</a></div>
                        <input class="btn btn-submit" type="submit" value="수정완료">
                    </div>
                    
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
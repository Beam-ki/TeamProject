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
		<c:import url="../default/nav.jsp"/>
        <!-- header -->
        <header>
            <h1>안쓰는 물건 사고팔땐,<br><span>중고</span>마켓</h1>
        </header>

        <!-- section -->
        <section class="writing">
            <h2>게시글 등록하기</h2>
            <form action="${contextPath }/board/writeSave" enctype="multipart/form-data" method="post">
                <fieldset>
                    <input type="hidden" name="product_type" value="A">
                	<input type="hidden" name="product_writer" value="${loginUser }">
                    <p class="wr-title">제목<input type="text" name="product_title" placeholder="제목을 입력해주세요" required></p>
                    <textarea name="product_main" id="wr-con" cols="130" rows="20" placeholder="본문 내용을 입력해주세요." required></textarea>
                    <input type="file" class="file" name="product_img" onchange="readURL(this)">
                    <img id="preview" src="#" width="100px" height="100px">
                    <fieldset>
                    <p>금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="product_price" placeholder="금액 입력해주세요" value="${product_price }" required></p>
                    
                     <h4>흥정 여부</h4>
                    <label><input type="radio" name="product_status1" value="흥정 가능" > 흥정 가능</label>           
                    <label><input type="radio" name="product_status1" value="흥정 불가능">흥정 불가능</label>
                    
                    <h4>상품 상태</h4>
                    <label><input type="radio" name="product_status" value="새 상품"> 새 상품</label>           
                    <label><input type="radio" name="product_status" value="중고 상품"> 중고 상품</label>
                    
                    <h4>거래 방법</h4>
                    <label><input type="radio" name="product_trade" value="직거래"> 직거래</label>           
                    <label><input type="radio" name="product_trade" value="택배거래"> 택배거래</label>    
                    <label><input type="radio" name="product_trade" value="기프티콘"> 기프티콘</label>   
                    
                </fieldset>
                    
                    <div class="btn-wrapper">
                        <div class="btn btn-submit"><a href="/root/board/boardAllList">&lt; back</a></div>
                        <input class="btn" type="submit" value="등록">
                    </div>
                    
                </fieldset>
                
            </form>
        </section>
    </div>
	<!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>
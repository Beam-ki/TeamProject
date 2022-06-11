<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm</title>
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
<style>
.write_title{
	text-align:center;
}
.write{
	width:300px;
	margin:auto;
/* 	border:1px solid gray; */
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<h1 class="write_title">글쓰기</h1>
	<div class="write">
		<div class="write_save">
		<form action="${contextPath }/board/writeSave" enctype="multipart/form-data" method="post">
			<b>작성자</b>
			<input type="text" name="id" value="${loginUser }" readonly>
			<hr>
			<b>제목</b><br>
			<input type="text" name="title" size="50">
			<hr>
			<b>내용</b><br>
			<textarea rows="10" cols="50" name="content"></textarea>
			<hr>
			<b>파일첨부</b><br>
			<input type="file" name="image_file_name" onchange="readURL(this)">
			<img id="preview" src="#" width="100px" height="100px">
			<hr>
			<input type="submit" value="완료">&nbsp;
			<input type="button" value="글목록" onclick="location.href='${contextPath }/board/boardAllList'">
		</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>
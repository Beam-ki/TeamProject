<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify_form</title>
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
.modify_title{
	text-align:center;
}
.modify{
	width:300px;
	margin:auto;
/* 	border:1px solid gray; */
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<h1 class="modify_title">수정</h1>
	<div class="modify">
		<div class="modify_form">
		<form action="${contextPath }/board/modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="writeNo" value="${data.writeNo }">
			<input type="hidden" name="originFileName" value="${data.imageFileName }"><!-- 이미지 변경시 삭제에 사용하는 값 -->
			<input type="text" name="title" value="${data.title }">
			<hr>
			<b>내용</b><br>
			<textarea rows="10" cols="50" name="content">${data.content }</textarea>
			<hr>
			<img id="preview" src="${contextPath }/board/download?imageFileName=${data.imageFileName }" width="100px" height="100px">
			<input type="file" name="image_file_name" onchange="readURL(this)">
			<hr>
			<input type="submit" value="수정완료">&nbsp;
			<input type="button" value="글목록" onclick="location.href='${contextPath }/board/boardAllList'">
		</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>
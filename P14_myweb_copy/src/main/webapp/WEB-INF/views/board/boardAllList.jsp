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
    <title>ํ๋๋ค๐</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
</head>
<body>
    <!-- container -->
    <div class="container">
    	<!-- nav -->
        <c:import url="../default/nav.jsp"/>
        <!-- header -->
        <header class="sub">
            <h1>์์ฐ๋ ๋ฌผ๊ฑด ์ฌ๊ณ ํ๋,<br><span>์ค๊ณ </span>๋ง์ผ</h1>
        </header>
        <!-- section -->
        <section>
            <h2>ํ๋๋ค๐</h2>
            <div class="notice">
                <div class="btn ico-notice">๊ณต์ง</div>
				<a href="Notice">๊ณต์ง์ฌํญ</a>
            </div>
			<form class="search" action="${contextPath }/board/boardList.do" enctype="multipart/form-data" method="post">
		        <select name="searchOption">
		            <!-- ๊ฒ์์กฐ๊ฑด์ ๊ฒ์์ฒ๋ฆฌํ ๊ฒฐ๊ณผํ๋ฉด์ ๋ณด์ฌ์ฃผ๊ธฐ์ํด  c:out ์ถ๋ ฅํ๊ทธ ์ฌ์ฉ, ์ผํญ์ฐ์ฐ์ -->
		            <option value="product_title" <c:out value="${map.searchOption == 'product_title'?'selected':''}"/> >์ ๋ชฉ</option>
		            <option value="product_main" <c:out value="${map.searchOption == 'product_main'?'selected':''}"/> >๋ด์ฉ</option>
		            <option value="product_writer" <c:out value="${map.searchOption == 'product_writer'?'selected':''}"/> >์ด๋ฆ</option>
		            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >์ ๋ชฉ+๋ด์ฉ+์ด๋ฆ</option>
		        </select>
		        <input name="keyword" value="${map.keyword}">
		        <input type="submit" class="btn btn-submit" value="๊ฒ์">
		    </form>
            <c:if test="${boardList.size()==0 }">
            	<div class="empty">
            		<img src="../img/img-empty.png">
            		<h2>๊ฒ์๊ธ์ด ์์ด์...</h2>
            		<h3>์ง๊ธ ์ฒซ ๊ฒ์๋ฌผ์ ๋ฑ๋กํด๋ณด์ธ์!</h3>
            	</div>
			</c:if>
			<c:set var="i" value="0"/>
			<c:set var="j" value="4"/>
			<!-- table ์์ -->
			<table class="pro-board">
				<c:forEach var="dto" items="${boardList }">
				<input type="hidden" name="type" value="A">
					<c:if test="{i%j==0}">
					<tr>
					</c:if>
						<td>
							<div class="pro-column">
		                    	<a href="${contextPath }/board/contentView?product_no=${dto.product_no}">
		                    		<img src="${contextPath }/board/download?file=${dto.product_img }" onerror="this.src='https://ifh.cc/g/o5Tpl9.png';"/>
		                    	</a>
		                    	<p class="pro-title">
	                    			<a href="${contextPath }/board/contentView?product_no=${dto.product_no}">${dto.product_title }</a>
	                   			</p>
	                    	</div>
	                    	
						</td>
					<c:if test="${i%j==j-1}">
					<tr>
					</c:if>
					<c:set var="i" value="${i+1}"/>
				</c:forEach>	
			</table>
		    <table class="pro-board">
		    	<c:if test="${map.list.size()==0 }">
	            	<div class="empty">
	            		<img src="../img/img-empty.png">
	            		<h2>๊ฒ์๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค</h2>
	            	</div>
				</c:if>
				<c:forEach var="row" items="${map.list}">
					<input type="hidden" name="type" value="A">
					<c:if test="{i%j==0}">
					<tr>
					</c:if>
						<td>
							<div class="pro-column">
		                    	<a href="${contextPath }/board/contentView?product_no=${row.product_no}">
		                    		<img src="${contextPath }/board/download?file=${row.product_img }" onerror="this.src='https://ifh.cc/g/o5Tpl9.png';">
		                    	</a>
		                    	<p class="pro-title">
	                    			<a href="${contextPath }/board/contentView?product_no=${row.product_no}">${row.product_title }</a>
	                   			</p>
	                    	</div>
						</td>
					<c:if test="${i%j==j-1}">
					<tr>
					</c:if>
					<c:set var="i" value="${i+1}"/>
				</c:forEach>	
			</table>							
            <table class="paging">
            	<tr>
					<td colspan="6" align="center">
					<span><a href="boardAllList?num=${num -1}">์ด์ </a></span>
						<c:forEach var="num" begin="1" end="${repeat }">
							<a href="boardAllList?num=${num }">${num }</a>
							<span>[<a href="boardAllList?num=${num +1}">๋ค์</a>]</span>	
						</c:forEach>
					</td>
				</tr>							
            </table>
	    	<div class="btn-wrapper">
				<a href="/root/board/writeForm" class="btn btn-submit">๊ธ์ฐ๊ธฐ</a>
			</div>		
        </section>
    </div>
    <!-- footer -->
    <c:import url="../default/footer.jsp"></c:import>
</body>
</html>
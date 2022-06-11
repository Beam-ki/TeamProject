<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>맘스터치 싸이버거 기프티콘 팝니다.</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/sub-style.css">
</head>
<body>
    <div class="container">
        <!-- nav -->
        <nav>
            <ul class="gnb-lnb">
                <li class="left-nav home"><a href="/root/index"><span>중고</span>마켓</a></li>
                <li class="left-nav clicked"><a href="/root/board/boardAllList">팝니다🙌</a></li>
                <li class="left-nav"><a href="/root/board/qna">문의하기</a></li>
            </ul>
        </nav>

        <!-- header -->
        <header>
            <h1>안쓰는 물건 사고팔땐, <span>중고</span>마켓</h1>
        </header>

        <!-- section -->
        <section>
            <div class="detail">
                <div class="detail-img">
                    <img src="../img/img-hamburger.png" alt="">
                </div>
                <div class="detail-article">
                    <h2>${data.title }</h2>
                    <h2>${data.writeNo }(테스트용)원</h2>
                    <table border="1">
                        <tr>
                            <th>금액</th>
                            <td>3,000원</td>
                            <td>에누리 불가</td>
                            
                        </tr>
                        <tr>
                            <th>상품 상태</th>
                            <td>새것</td>
                            <td>하자 내용(있을 시)</td>
                        </tr>
                        <tr>
                            <th>거래 방법</th>
                            <td>기프티콘</td>
                            <td>택배 거래 불가</td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
			<textarea id="content" name="content" rows="10" cols="110" placeholder="상품 내용을 입력하세요">${data.content }</textarea>
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
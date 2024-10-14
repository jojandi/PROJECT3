<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북플릭스</title>
<link href="./assets/css/bookflix/bookflix.css" rel="stylesheet">
</head>
<body>

            <div id="parent">
                <div id="top_logo">
                    <img id="top_logo_img"
                        src="../assets/img/bookflix.png">
                </div>
                
                <div class="top_for_you">
                    당신만을 위한 취향저격 이달의 구독 도서 서비스!
                    <div id="top_in_for_you">
                        당신만을 위한 책을 소개시켜드릴게요.<br>
                        인공지능 데이터를 토대로 추천 해드립니다.
                    </div>
                </div>
                <div class="slider">
                    <div class="slider-container">
                        <!-- 복제된 마지막 슬라이드 -->
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198686114.jpg" alt="Book 9" class="book">
                        <!-- 원본 슬라이드들 -->
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788965138068.jpg" alt="Book 1" class="book">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788930041683.jpg" alt="Book 2" class="book">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198517425.jpg" alt="Book 3" class="book">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791170611561.jpg" alt="Book 4" class="book">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198682505.jpg" alt="Book 5" class="book">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788998441012.jpg" alt="Book 6" class="book">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788952776372.jpg" alt="Book 7" class="book">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198682550.jpg" alt="Book 8" class="book">
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198686114.jpg" alt="Book 9" class="book">
                        <!-- 복제된 첫 번째 슬라이드 -->
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788965138068.jpg" alt="Book 1" class="book">
                    </div>
                </div>
               
                <div class="mid_for_you">
                        도서관 방문이 어려운 당신을 위해 !<br>
                        한 달에 두권씩 배송해드립니다.
                        <div id="mid_in_for_you">
                            취향에 맞는 책만 읽으시면 됩니다.<br><br>
                            간단한 리뷰를 작성해 주시면
                            최대 1000포인트 적립 찬스까지!
                        </div>
                </div>
                        
                <!-- <div id = "img_box">
                    <img src = "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FsVdgP%2Fbtq39lgZ1wz%2FTUevFSNmFB88xWuWNT60Ok%2Fimg.jpg">
                    <img src = "https://cdn.discordapp.com/attachments/1128320143232077876/1266660376645210132/2024-07-27_4.35.40.png?ex=66a5f4e7&is=66a4a367&hm=de83ff8fa776e5b5ebba6b3a3e459c95edf23649a51bb7c5f59cf1119005a38b&">
                    <img src = "https://t4.ftcdn.net/jpg/05/03/80/81/240_F_503808125_yHaRPhf8DJO9rnUPuPlpd8EiI0GMWcVm.jpg">
                    <img src = "https://as1.ftcdn.net/v2/jpg/04/99/71/28/1000_F_499712861_Uu1vTfZLoCPZ9ZHt8DCA6TVlNYH5LgRW.jpg">
                </div> -->

				<c:if test="${login.user_seq != null}">
	                <div id="top_box">
		                <form method="post" action="sub">
		                	<input type="hidden" name="seq" value="${login.user_seq}">
		                    <input type="submit" value="구독 서비스 신청하기" id="fixed-button">
		                </form>
	                </div>
                </c:if>
				<c:if test="${login.user_seq == null}">
	                <div id="top_box">
		                <form method="get" action="login">
		                    <input type="submit" value="구독 서비스 신청하기" id="fixed-button">
		                </form>
	                </div>
                </c:if>
                
            </div>
        <!-- wrap -->
        <script src="./assets/js/bookflix/slider.js"></script>
        <script src="./assets/js/bookflix/bookflix_use.js"></script>

</body>
</html>
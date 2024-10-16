<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%-- <%@ page import="user.dto.noti.NotiDTO"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 메인페이지</title>
<link href="./assets/css/main/main_user.css" rel="stylesheet">
</head>
<body>
    <!-- google fonts 가져오기 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <div id="wrap">

        <section class="section1">

            <div id="hukwan">
            
            	<div id="librarys">
                    
                    <div class="library" id="joong">중앙</div>
                    <div class="library" id="ssang">쌍용</div>
                    <div class="library" id="du">두정</div>
                    <div class="library" id="sin">신방</div>
                    <div class="library" id="cheng">청수</div>
                    
                </div>
                
                <div id="calendar">
                    <div class="calHeader">
                        <h2 id="YearMonth">
                            <!-- YYYY년 M월 -->
                        </h2>
                    </div>
					
                    <div id="days">
                        <div>일</div>
                        <div>월</div>
                        <div>화</div>
                        <div>수</div>
                        <div>목</div>
                        <div>금</div>
                        <div>토</div>
                    </div>

                    <div id="dates">
                        <!-- 날짜들 들어오는 곳 -->
                    </div>
                </div>
                <script src="./assets/js/main/calendar.js"></script>

            </div>

        </section>

        <section class="section1">
			<div id="chartName">2024년 10월 대출 / 반납 현황</div>
			<canvas id="myChart" height="175"></canvas>
            
        </section>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
        <script>
	        let myCt = document.getElementById('myChart');
	        
	        const lib0 = '${lib[0].book_loan_seq}';
	        const lib1 = '${lib[1].book_loan_seq}';
	        const lib2 = '${lib[2].book_loan_seq}';
	        const lib3 = '${lib[3].book_loan_seq}';
	        const lib4 = '${lib[4].book_loan_seq}';
	
	        let myChart = new Chart(myCt, {
	          type: 'bar',
	          data: {
	            labels: ['${lib[0].lib_name}', 
	            	'${lib[1].lib_name}', 
	            	'${lib[2].lib_name}', 
	            	'${lib[3].lib_name}', 
	            	'${lib[4].lib_name}'], // 도서관 이름
	            datasets: [ // 데이터 속성
	              {
	                label: '대출', // 축의 제목
	                data: [lib0, lib1, lib2, lib3, lib4], // 각 도서관 별 값
	                backgroundColor: 'rgb(165, 224, 144)' // 배경색
	              },
	              {
	                label: '반납',
	                data: [Math.floor(lib0 * 0.8),
	                	Math.floor(lib1 * 0.79),
	                	Math.floor(lib2 * 0.81),
	                	Math.floor(lib3 * 0.75),
	                	Math.floor(lib4 * 0.73)
	                	],
	                backgroundColor: 'rgba(172, 229, 151, 0.637)'
	              }
	            ]
	          },
	          options: {
	                      plugins: {
	                          legend: { // 범례 스타일링
	                              display: true, // 범례 활성화 (기본값 true)
					  	position: 'top', // 범례를 상단에 위치
					    align: 'end' // 오른쪽으로 정렬
	                          },
	                      }
	                  }
	        });
        </script>


        <section class="section2">
            
            <div id="noticewrap">          
                <div id="noticetitle">
                    <sapn>공지사항</sapn>
                    <a href="notice">
                        <span class="material-symbols-outlined">add</span>
                    </a>
                </div>

                <div id="notices">

                    <ul>
	                    <c:forEach var="noti" items="${noti}">
	                        <li class="notice" id="n1">
	                            <div class="nbox joong">${noti.class_name}</div>
	                            <div class="noticeTD">
	                                <a class="title" href="notice3?ann_seq=${noti.ann_seq}">${noti.ann_title}</a>
	                                <div class="update">${noti.ann_regi}</div>
	                            </div>
	                        </li>
	                    </c:forEach>
                    </ul>

                </div>
            </div>

        </section>

        

    <!-- wrap -->
    </div> 
</body>
</html>
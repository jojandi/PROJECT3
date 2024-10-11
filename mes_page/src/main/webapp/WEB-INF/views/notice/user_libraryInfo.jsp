<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="layout.css" type="text/css">
    <link href="./assets/css/admin_table.css" rel="stylesheet">
    <link href="./assets/css/00.user_side_base.css" rel="stylesheet">
    <link href="./assets/css/admin.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="./assets/css/click.css" rel="stylesheet">
    <link href="./assets/css/mes_notice.css" rel="stylesheet">
</head>
<body>
	<section>
		<div class="main_page">

                <h3>${selectLibrary.lib_name} 정보</h3>

	            
            <div>
                <img id = "infor_img" src= "${selectLibrary.lib_pic}">
            </div>
            <div>
                <ul style="line-height:200%;">
                    <li>
                    <strong>위치</strong>
                    ${selectLibrary.lib_add}
                    </li> 
                    
                    <li>
                    <strong>주차면수</strong>
                    ${selectLibrary.lib_parking}
                    </li> 
                    
                    <li>
                    <strong>좌석수</strong>
                    ${selectLibrary.lib_seat }
                    </li> 
                    
                    <li>
                    <strong>개관일</strong>
                    ${selectLibrary.lib_open }
                    </li> 
                
                    <li>
                    <strong>주요시설</strong>
                    ${selectLibrary.lib_facil }
                    </li> 
                    
                    <li>
                    <strong>전화번호</strong>
                    ${selectLibrary.lib_call }
                    </li> 

                </ul>
            </div>
	
<!--             <div id="info_map_addr"> -->
<!--                 <div id = "infor_map"> -->
<!--                     <h3>오시는길</h3> -->
<!--                     * 카카오맵 - 지도퍼가기 -->
<!--                     1. 지도 노드 -->
<!--                     <div id="daumRoughmapContainer1721958350676" class="root_daum_roughmap root_daum_roughmap_landing"></div> -->

<!--                    
<!--                         2. 설치 스크립트 -->
<!--                         * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다. -->
<!--                     -->
<!--                     <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script> -->

<!--                     3. 실행 스크립트 -->
<!--                     <script charset="UTF-8"> -->
<!-- //                         new daum.roughmap.Lander({ -->
<!-- //                             "timestamp" : "1721958350676", -->
<!-- //                             "key" : "2k6pc", -->
<!-- //                             "mapWidth" : "640", -->
<!-- //                             "mapHeight" : "360" -->
<!-- //                         }).render(); -->
<!--                     </script> -->
<!--                 </div> -->
<!--                 <div id="infor_adress"> -->
<!--                     <div class="addr"> -->
<!--                         <span class="material-symbols-outlined">home</span> -->
<!--                         천안시 서북구 부성3길 9 -->
<!--                     </div> -->
<!--                     <div class="call"> -->
<!--                         <span class="material-symbols-outlined">call</span> -->
<!--                         041-521-3733 -->
<!--                     </div> -->
<!--                 </div>  -->
<!-- 	            </div> -->
            </div>
        </section>
</body>
</html>
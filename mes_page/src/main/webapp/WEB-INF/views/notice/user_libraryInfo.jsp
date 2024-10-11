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
</head>
<body>
	<section>
		<div class="main_page">
            <div id = "infor_top_box">
                <h1>${lib_name} ����</h1>
            </div>
	            
            <div>
                <img id = "infor_img" src= "${lib_pic} }">
            </div>
            <div>
                <ul style="line-height:200%;">
                    <li>
                    <strong>��ġ</strong>
                    ${lib_add}
                    </li> 
                    
                    <li>
                    <strong>�������</strong>
                    ${lib_parking}
                    </li> 
                    
                    <li>
                    <strong>�¼���</strong>
                    ${lib_seat }
                    </li> 
                    
                    <li>
                    <strong>������</strong>
                    ${lib_open }
                    </li> 
                
                    <li>
                    <strong>�ֿ�ü�</strong>
                    ${lib_facil }
                    </li> 
                    
                    <li>
                    <strong>��ȭ��ȣ</strong>
                    ${lib_call }
                    </li> 

                </ul>
            </div>
	
<!--             <div id="info_map_addr"> -->
<!--                 <div id = "infor_map"> -->
<!--                     <h3>���ô±�</h3> -->
<!--                     * īī���� - �����۰��� -->
<!--                     1. ���� ��� -->
<!--                     <div id="daumRoughmapContainer1721958350676" class="root_daum_roughmap root_daum_roughmap_landing"></div> -->

<!--                    
<!--                         2. ��ġ ��ũ��Ʈ -->
<!--                         * ���� �۰��� ���񽺸� 2�� �̻� ���� ���, ��ġ ��ũ��Ʈ�� �ϳ��� �����մϴ�. -->
<!--                     --> -->
<!--                     <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script> -->

<!--                     3. ���� ��ũ��Ʈ -->
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
<!--                         õ�Ƚ� ���ϱ� �μ�3�� 9 -->
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
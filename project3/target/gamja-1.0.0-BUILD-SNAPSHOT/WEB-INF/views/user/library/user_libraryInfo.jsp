<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="project3.talking.gamja.dto.user.LibraryDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link href="./assets/css/user_base.css" rel="stylesheet">
    <link href="./assets/css/library/library.css" rel="stylesheet">
    <style>
		<%
		    Object selectLibraryObj = request.getAttribute("selectLibrary"); // lib_id���� ���� ��ü ����
		    Integer libId = null; // �⺻ libId ��
		
		    if (selectLibraryObj != null && selectLibraryObj instanceof LibraryDTO) {
		        LibraryDTO selectLibrary = (LibraryDTO) selectLibraryObj;
		        libId = selectLibrary.getLib_id(); // dto�� lib_id ���� ������ ���
		    }
		%>
		<% if (libId != null && libId == 7000) { %>
			#i1 .material-symbols-outlined {
				background-color: rgb(165, 224, 144);
			}
		<% } else if (libId != null && libId == 7001) { %>
			#i2 .material-symbols-outlined {
				background-color: rgb(165, 224, 144);
			}
		<% } else if (libId != null && libId == 7002) { %>
			#i3 .material-symbols-outlined {
				background-color: rgb(165, 224, 144);
			}
		<% } else if (libId != null && libId == 7003) { %>
			#i4 .material-symbols-outlined {
				background-color: rgb(165, 224, 144);
			}
		<% } else if (libId != null && libId == 7004) { %>
			#i5 .material-symbols-outlined {
				background-color: rgb(165, 224, 144);
		<%	}%>

    </style>
    
</head>
<body>
	<section id = "library_infor">
		<div>
	        <h1>${selectLibrary.lib_name} ����</h1>
		</div>

		<div id="libraryInfo">	            
            <div>
                <img id = "infor_img" src= "${selectLibrary.lib_pic}">
            </div>
            <div id="info">
                <ul style="line-height:200%;">
                    <li>
                    <strong>��ġ : </strong>
                    ${selectLibrary.lib_add}
                    </li> 
                    
                    <li>
                    <strong>������� : </strong>
                    ${selectLibrary.lib_parking}
                    </li> 
                    
                    <li>
                    <strong>�¼��� : </strong>
                    ${selectLibrary.lib_seat }
                    </li> 
                    
                    <li>
                    <strong>������ : </strong>
                    ${selectLibrary.lib_open }
                    </li> 
                
                    <li>
                    <strong>�ֿ�ü� : </strong>
                    ${selectLibrary.lib_facil }
                    </li> 
                    
                    <li>
                    <strong>��ȭ��ȣ : </strong>
                    	<%
                    	LibraryDTO dto = (LibraryDTO)request.getAttribute("selectLibrary");
                		String call = dto.getLib_call().toString();
                		String call1 = call.substring(0, 2);
                		String call2 = call.substring(2, 5);
                		String call3 = call.substring(5, 9);
                		
                		String num = 0 + call1 + "-" +call2 + "-" +call3;
                    	%>
                    <%=num %>
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
<!--                     -->
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
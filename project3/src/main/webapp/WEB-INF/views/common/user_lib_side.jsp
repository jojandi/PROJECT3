<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../assets/css/library/user_library_side.css" rel="stylesheet">
</head>
<body>
<!-- 사이드 -->
<aside class="clearfix" id="side">
	<div id="sideleft">
        <h2 id="title">도서관정보</h2>
        
        <div id="items">
            
            <div class="item" id="i1">
               <a href="?lib_id=7000">
                <span>중앙도서관</span>
    	        <span class="material-symbols-outlined">arrow_forward_ios</span>
               </a>
            </div>
            <div class="item" id="i2">
               <a href="?lib_id=7001">
                <span>쌍용도서관</span>
                <span class="material-symbols-outlined">arrow_forward_ios</span>
               </a>
            </div>
            <div class="item" id="i3">
               <a href="?lib_id=7002">
                <span>두정도서관</span>
                <span class="material-symbols-outlined">arrow_forward_ios</span>
               </a>
            </div>
            <div class="item" id="i4">
               <a href="?lib_id=7003">
                <span>신방도서관</span>
                <span class="material-symbols-outlined">arrow_forward_ios</span>
               </a>
            </div>
            <div class="item" id="i5">
               <a href="?lib_id=7004">
                <span>청수도서관</span>
                <span class="material-symbols-outlined">arrow_forward_ios</span>
               </a>
            </div>
            
        </div>
     </div>
</aside>
</body>
</html>
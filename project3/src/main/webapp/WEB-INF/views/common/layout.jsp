<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../assets/css/base/user_base.css" rel="stylesheet">
</head>
<body>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- header -->
		<tiles:insertAttribute name="header"/>
	
	<div id="wrap">
		<!-- side -->
			<tiles:insertAttribute name="side"/>
		
		<!-- content -->
			<tiles:insertAttribute name="content"/>
	</div>
	
	<!-- footer -->
		<tiles:insertAttribute name="footer"/>
<script src="../assets/js/loginFilter/loginFilter.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GamJa Mes</title>
<style>
	
	#side{display: inline-block; width: 30%; border: 1px solid green;}
	#content{display: inline-block; width: 100%; vertical-align: top;}

</style>
</head>
<body>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- header -->
	<div>
		<tiles:insertAttribute name="header"/>
	</div>
	
	<!-- content -->
	<div id="content">

		<tiles:insertAttribute name="content"/>
	</div>
	


</body>
</html>
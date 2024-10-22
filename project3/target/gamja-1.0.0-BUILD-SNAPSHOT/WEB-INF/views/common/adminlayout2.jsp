<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GamJa Admin</title>
<link href="../assets/css/base/admin_base.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>

	<!-- header -->
	<div>
		<tiles:insertAttribute name="header"/>
	</div>
	
	<!-- content -->
	<tiles:insertAttribute name="content"/>
	
	<!-- footer -->
	<div>
		<tiles:insertAttribute name="footer"/>
	</div>

</body>
</html>
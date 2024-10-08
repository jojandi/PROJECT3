<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#side{display: inline-block; width: 30%; border: 1px solid green;}
	#content{display: inline-block; width: 69%; border: 1px solid green; vertical-align: top;}

</style>
</head>
<body>

	<!-- header -->
	<div>
		<tiles:insertAttribute name="header"/>
	</div>
	
	<!-- content -->
	<div id="content">
		<tiles:insertAttribute name="title"/>
		<tiles:insertAttribute name="content"/>
	</div>
	
	<!-- footer -->
	<div>
		<tiles:insertAttribute name="footer"/>
	</div>

</body>
</html>
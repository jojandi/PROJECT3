<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../assets/css/notice/noti3.css" rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
		<div id="section">
			<div id="content_all">
				<div class="name">
					<div class="mini_name">${notice.class_name }</div>
					<strong>${notice.ann_title }</strong>
					<div id="mini">
						<span class="mini_date">등록일 | ${notice.ann_regi }</span> <span>조회
							| ${notice.ann_check }</span>
					</div>
				</div>

				<div id="content">
					<div id="file">
						<div>
							<span>첨부파일 </span> 
							<span class="material-symbols-outlined">folder</span>
						</div>
					</div>
					<div class="bookTitle book">${notice.ann_detail }</div>

					<div id="back">
						<a href="notice2"><input type="button"
							value="목록"></a>
					</div>
				</div>
			</div>
		</div>

</body>
</html>
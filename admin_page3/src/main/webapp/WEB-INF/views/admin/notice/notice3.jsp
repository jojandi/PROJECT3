<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../assets/css/noti/noti3.css" rel="stylesheet">
<meta charset="UTF-8">
<style>
/* 공고 세부 내용 스타일 */
.bookTitle.book {
  margin-top: 20px;
  padding: 15px;
  border: 1px solid #ddd;
  border-radius: 8px;
  font-size: 16px;
  word-wrap: break-word; /* 긴 텍스트 줄바꿈 */
  white-space: pre-wrap; /* 공백과 줄바꿈 유지 */
}



</style>

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
							<span>첨부파일 </span> <span class="material-symbols-outlined">folder</span>
						</div>
					</div>
					<div class="bookTitle book">${notice.ann_detail }</div>

					<div id="back">
						<a href="/user_page/user/notice"><input type="button"
							value="목록"></a>
					</div>
				</div>
			</div>
		</div>

</body>
</html>
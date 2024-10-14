<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지사항 추가</title>
<link href="./assets/css/notice/noti.css" rel="stylesheet">
</head>
<body>


	<section>

		<div class="main_page" id="main_page_1">
			<div id="admin_controls">
				<h2>공지사항 추가</h2>

				<!-- 			<form action="noti2" method="post" enctype="multipart/form-data"> -->
					<input type="hidden" name="action" value="create">


					<form action="insertNoti" method="post" >
						<div id="con">
							<select id="notice_category" name="class_id">
								<option value="5001">공지</option>
								<option value="5002">안내</option>
							</select>
						</div>
						
						
						<!-- 도서관 ID 추가 -->
						<div class="form-group">
						   
						    <select name="lib_id" id="lib_id" class="library-select">
						        <option value="7003">중앙도서관</option>
						        <option value="7001">신방도서관</option>
						        <option value="7004">청수도서관</option>
						        <option value="7002">쌍용도서관</option>
						        <option value="7000">두정도서관</option>
						    </select>
						</div>
					    <!-- 공지사항 제목 -->
					    <input type="text" id="new_notice_title" name="ann_title" placeholder="공지사항 제목" required>
					
					    <!-- 공지사항 작성일 -->
					    <input type='date' id='currentDate' name="ann_regi" required />
					
					    <!-- 공지사항 내용 -->
					    <textarea id="new_notice_content" name="ann_detail" rows="5" placeholder="공지사항 내용" required></textarea>
					
					    <!-- 파일 첨부 입력 -->
					    <input type='file' id='ann_attach' name='ann_attach'>
					
					    <button type="submit">공지사항 추가</button>

				</form>
				
				
			</div>
		</div>
	</section>
	<script>
		document.getElementById('currentDate').value = new Date().toISOString()
				.substring(0, 10);
	</script>

	<script src="../assets/js/noti/noti.js"></script>

</body>
</html>

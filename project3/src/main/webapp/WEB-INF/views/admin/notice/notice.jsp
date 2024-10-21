<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지사항 추가</title>
<link href="../assets/css/notice/noti.css" rel="stylesheet">
</head>
<body>


	<section>
		
		<div class="main_page" id="main_page_1">
			<c:if test="${cmd eq 'insert'}">
				<h3>공지사항 추가</h3>
			</c:if>
			<c:if test="${cmd eq 'edit'}">
				<h3>공지사항 수정</h3>
			</c:if>
			
			<div id="admin_controls">
				<!-- 추가하기 form -->
				<c:if test="${cmd eq 'insert'}">
					<form action="insertNoti" method="post" enctype="multipart/form-data" accept-charset="utf-8" >
						<div id="con">
							<select id="notice_category" name="class_id">
								<option value="5001">공지</option>
								<option value="5002">안내</option>
							</select>
						    <select name="lib_id" id="lib_id" class="library-select">
						        <option value="7000">두정</option>
						        <option value="7001">신방</option>
						        <option value="7002">쌍용</option>
						        <option value="7003">중앙</option>
						        <option value="7004">청수</option>
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
				</c:if>
				
				<!-- 수정하기 form -->
				<c:if test="${cmd eq 'edit'}">
					<form action="insertNoti" method="post" enctype="multipart/form-data" accept-charset="utf-8" >
						<div id="con">
							<select id="notice_category" name="class_id">
								<option value="5001">공지</option>
								<option value="5002">안내</option>
								<c:if test="${notice.class_id}">
									<option value="5001">공지</option>
									<option value="5002" selected="selected">안내</option>
								</c:if>
							</select>
						    <select name="lib_id" id="lib_id" class="library-select">
						        <option value="7000">두정</option>
						        <option value="7001" ${notice.class_id == 7001 ? "selected='selected'" : ""}>신방</option>
						        <option value="7002" ${notice.class_id == 7002 ? "selected='selected'" : ""}>쌍용</option>
						        <option value="7003" ${notice.class_id == 7003 ? "selected='selected'" : ""}>중앙</option>
						        <option value="7004" ${notice.class_id == 7004 ? "selected='selected'" : ""}>청수</option>
						    </select>
						</div>
						   
					    <!-- 공지사항 제목 -->
					    <input type="text" id="new_notice_title" name="ann_title" placeholder="공지사항 제목" value="${notice.ann_title}" required>
					
					    <!-- 공지사항 작성일 -->
					    <input type='date' id='currentDate' name="ann_regi" required value="${notice.ann_regi}"/>
					
					    <!-- 공지사항 내용 -->
					    <textarea id="new_notice_content" name="ann_detail" rows="5" 
					    placeholder="공지사항 내용" required>${notice.ann_detail}</textarea>
					
					    <!-- 파일 첨부 입력 -->
					    <input type='file' id='ann_attach' name='ann_attach' value="${notice.ann_attach}">
					    <input type='hidden' id='ann_seq' name='ann_seq' value="${notice.ann_seq}">
					    
					
					    <button type="button" id="modalUpdateButton">공지사항 수정</button>
	
					</form>
				</c:if>
			</div>
		</div>
	</section>
	<script>
		document.getElementById('currentDate').value = new Date().toISOString()
				.substring(0, 10);
		window.addEventListener("load",function(){
			updateNotice();
        })
		
		// 공지사항 수정용 모달창 열기 함수
        function updateNotice(ann_seq, class_id, lib_id, title, regi, check, attach) {
            // 수정 버튼 클릭 이벤트 등록
            document.getElementById("modalUpdateButton").addEventListener("click", function() {
                const updatedData = {
                        ann_seq: document.getElementById("ann_seq").value,
                        class_id: document.getElementById("notice_category").value,
                        lib_id: document.getElementById("lib_id").value,
                        ann_title: document.getElementById("new_notice_title").value,
                        ann_regi: document.getElementById("currentDate").value,
                        ann_attach: document.getElementById("ann_attach").value,
                        ann_detail: document.getElementById("new_notice_content").value
                    };

                    const url = "${pageContext.request.contextPath}/notice2"; // 수정 URL

                    ajax(url, updatedData, function(response) {
                        alert("공지사항이 수정되었습니다.");
                        location.href="notice3_${ann_seq}"; // 페이지 새로고침
                    }, "PUT"); // PUT 메서드로 호출
                }) 
        }

        // 공통 Ajax 실행 함수
        function ajax(url, param, cb, method) {
            if (!method) method = "GET"; // 기본값 설정
            const xhr = new XMLHttpRequest();
            xhr.open(method, url);
            xhr.setRequestHeader("Content-Type", "application/json");
            const strData = JSON.stringify(param);
            console.log("strData : " + strData);
            xhr.send(strData); // 최종 전송

            if (typeof cb === "function") {
                xhr.onload = function() {
                    cb(xhr.responseText); // 콜백 함수로 응답 처리
                };
            }
        }
	</script>

	<script src=".../assets/js/noti/noti.js"></script>

</body>
</html>

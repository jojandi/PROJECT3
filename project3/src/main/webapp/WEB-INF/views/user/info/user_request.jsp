<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 도서신청</title>
    <link href="../assets/css/info/user_request.css" rel="stylesheet">
    <link href="../assets/css/base/user_base.css" rel="stylesheet">
    <link href="../assets/css/info/user_info_side.css" rel="stylesheet">
<script>
    // 폼이 제출될 때 validateForm 함수를 실행
    document.addEventListener("DOMContentLoaded", function() {
        var form = document.forms["requestForm"];
        
        // 폼의 submit 이벤트를 가로채서 validateForm 호출
        form.addEventListener("submit", function(event) {
            if (!validateForm()) {
                event.preventDefault(); // 폼 제출을 막음
            }
        });
        
        // 엔터 키를 감지하여 폼 제출
        form.addEventListener("keydown", function(event) {
            if (event.key === "Enter") {
                event.preventDefault(); // 엔터 키로 인한 기본 submit 방지
                if (validateForm()) {
                    form.submit(); // 모든 검증이 통과되면 폼 제출
                }
            }
        });
    });

    function validateForm() {
        var book = document.forms["requestForm"]["app_book"].value;
        var author = document.forms["requestForm"]["app_name"].value;
        var publisher = document.forms["requestForm"]["app_pub"].value;
        var library = document.forms["requestForm"]["lib_id"].value;

        if (book == "" || author == "" || publisher == "" || library == "") {
            alert("모든 필드를 입력해주세요.");
            return false;
        }

        alert("도서 신청이 완료되었습니다.");
        return true;
    }
</script>
</script>
</head>
<body>
    <div id="section">
        <h3>도서신청</h3>

        <!-- 도서 신청 성공 메시지 출력 -->
        <c:if test="${not empty message}">
            <div id="messageBox">
                <p>${message}</p>
            </div>
        </c:if>

        <form name="requestForm" method="post"
            action="<%=request.getContextPath()%>/user/requestInsert" onsubmit="return validateForm()">
            <div class="app">
                <input type="hidden" name="user_seq" value="${login.user_seq }">

                <!-- 책 이름 입력 -->
                <div>
                    <input type="text" name="app_book" placeholder="책이름을 입력해주세요">
                </div>

                <!-- 저자 입력 -->
                <div>
                    <input type="text" name="app_name" placeholder="저자를 입력해주세요">
                </div>

                <!-- 출판사 입력 -->
                <div>
                    <input type="text" name="app_pub" placeholder="출판사를 입력해주세요">
                </div>

                <!-- 도서관 선택 -->
                <div>
                    <select id="library" name="lib_id">
                        <option value="">도서관을 선택해주세요</option>
                        <option value="7000">두정도서관</option>
                        <option value="7001">신방도서관</option>
                        <option value="7002">쌍용도서관</option>
                        <option value="7003">중앙도서관</option>
                        <option value="7004">청수도서관</option>
                    </select>
                </div>
                
                <!-- 도서 신청 버튼 -->
                <div>
                    <input type="submit" value="도서신청하기">
                </div>
            </div>
        </form>
    </div>
</body>
</html>

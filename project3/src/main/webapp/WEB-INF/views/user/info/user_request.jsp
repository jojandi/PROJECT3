<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 도서신청</title>
    <link href="./assets/css/info/user_request.css" rel="stylesheet">
    <link href="./assets/css/base/user_base.css" rel="stylesheet">
    <link href="./assets/css/info/user_info_side.css" rel="stylesheet">
</head>
<body>
    <div id="section">
        <h3>도서신청</h3>

        <form method="post"
            action="<%=request.getContextPath()%>/requestInsert">
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

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

    <style>
        /* 폼 전체에 기본적인 스타일 적용 */
        form select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
            background-color: #fff;
          
        }


        form {
            max-width: 400px; /* 폼의 최대 너비를 설정 */
            margin: 0 auto;   /* 중앙 정렬 */
        }

        /* 추가적인 폼 입력 필드 스타일링 */
        form input[type="text"] {
            width:  50%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        form input[type="submit"] {
            padding: 10px 20px;
            background-color: #A5E090;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

    </style>
</head>
<body>
    <div id="section">
        <h3>도서신청</h3>

        <form method="post"
            action="<%=request.getContextPath()%>/request/insert">
            <div class="app">
                <%-- <input type="hidden" name="user_seq" value="${login.user_seq }"> --%>

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
                        <option value="cheon-an">천안도서관</option>
                        <option value="cheong-su">청수도서관</option>
                        <option value="shimbang">신방도서관</option>
                        <option value="ssangyong">쌍용도서관</option>
                        <option value="dojeong">두정도서관</option>
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

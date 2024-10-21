<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href=".../assets/css/my/user_mypage_side.css" rel="stylesheet">

</head>
<body>
	<!-- 사이드 -->
        <aside class="clearfix" id="side">
            <div id="sideleft">
                <h2 id="title">생산 관리</h2>
                <div id="items">
                    <div class="item" id="i1">
                    <a href="mes_workorder1">
                        <span>작업지시서</span>
                        <span class="material-symbols-outlined active">arrow_forward_ios</span>
					</a>                       
                    </div>
                    <div class="item" id="i2">
                     <a href="mes_workorder2">
                        <span>BOM</span>
                        <span class="material-symbols-outlined">arrow_forward_ios</span>
                     </a>
                    </div>
                </div>
            </div>
        </aside>
        <script src=".../assets/js/my/mypage.js"></script>
</body>
</html>
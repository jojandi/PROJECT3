<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.layerPopup img {
	margin-bottom: 20px;
}

.layerPopup:before {
	display: block;
	content: "";
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .5);
	z-index: 9000
}

.layerPopup .layerBox {
	z-index: 10000;
	position: fixed;
	left: 70%;
	top: 40%;
	transform: translate(-50%, -50%);
	padding: 20px;
	background: #fff;
	border-radius: 6px;
}

.layerPopup .layerBox .title {
	margin-bottom: 10px;
	padding-bottom: 10px;
	font-weight: 600;
	border-bottom: 1px solid #d9d9d9;
}

.layerPopup .layerBox .btnTodayHide {
	font-size: 14px;
	font-weight: 600;
	color: black;
	float: left;
	text-decoration: none;
	width: 150px;
	height: 30px;
	line-height: 30px;
	border: black solid 1px;
	text-align: center;
	text-decoration: none;
}

.layerPopup div {
	display: inline;
}

.layerPopup form {
	margin-top: 5px;
	font-size: 16px;
	font-weight: 600;
	weight: 100%;
	height: 30px;
	line-height: 30px
}

.layerPopup #close {
	font-size: 16px;
	font-weight: 600;
	width: 40px;
	height: 30px;
	color: black;
	float: right;
	line-height: 30px;
	text-align: center;
	text-decoration: underline;
}

.layerPopup a {
	text-decoration: none;
	color: black;
	width: 50px;
	height: 40px;
}

#poppng {
	width: 420px;
	height: 550px;
}

</style>
</head>
<body>

	<!-- layer popup content -->
	<div class="layerPopup" id="layer_popup" style="visibility: visible;">
		<div class="layerBox">
			<h3 class="title">행복만땅 도서관 북플릭스</h3>
			<div class="cont">
				<p>
					<a href="notice">
						<img src="../assets/img/notice.png" id="poppng" usemap="#popup" alt="event page">
					</a>
				</p>
			</div>
			<form name="pop_form">
				<div id="check">
					<input type="checkbox" name="chkbox" value="checkbox" id='chkbox'>
					<label for="chkbox">오늘 하루동안 보지 않기</label>
				</div>
				<div id="close">
					<a href="javascript:closePop();">닫기</a>
				</div>
			</form>
		</div>
	</div>

	<script>
		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ todayDate.toGMTString() + ";"
		}
		function closePop() {
			if (document.pop_form.chkbox.checked) {
				setCookie("popup", "push", 1);
			}
			document.all['layer_popup'].style.visibility = "hidden";
		}
		cookiedata = document.cookie;
		if (cookiedata.indexOf("popup=push") < 0) {
			document.all['layer_popup'].style.visibility = "visible";
		} else {
			document.all['layer_popup'].style.visibility = "hidden";
		}
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="../assets/css/noti/noti2.css" rel="stylesheet">
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
      <section>
          <h1>공지사항 상세보기</h1>
          <table>
              <tr>
                  <th>번호</th>
                  <td>${notice.ann_seq}</td>
              </tr>
              <tr>
                  <th>분류 ID</th>
                  <td>${notice.class_id}</td>
              </tr>
              <tr>
                  <th>제목</th>
                  <td>${notice.ann_title}</td>
              </tr>
              <tr>
                  <th>등록일</th>
                  <td>${notice.ann_regi}</td>
              </tr>
              <tr>
                  <th>조회수</th>
                  <td>${notice.ann_check}</td>
              </tr>
              <tr>
                  <th>내용</th>
                  <td>${notice.ann_detail}</td>
              </tr>
              <tr>
                  <th>첨부파일</th>
                  <td>
                      <c:choose>
                          <c:when test="${not empty notice.ann_attach}">
                              <a href="/uploads/${notice.ann_attach}" download="${notice.ann_attach}">${notice.ann_attach}</a>
                          </c:when>
                          <c:otherwise>
                              첨부파일 없음
                          </c:otherwise>
                      </c:choose>
                  </td>
              </tr>
          </table>
          <p>
              <a href="notice_list">목록</a>
          </p>
      </section>
</body>
</html>


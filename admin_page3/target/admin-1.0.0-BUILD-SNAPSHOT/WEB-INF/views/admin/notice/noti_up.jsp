<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="../assets/css/noti/noti2.css" rel="stylesheet">
<meta charset="UTF-8">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--<link href="../assets/css/noti/noti2.css" rel="stylesheet"> -->
<title>공지사항 수정</title>
</head>
<body>
   <section>
       <h1>공지사항 수정</h1>
       <form action="${pageContext.request.contextPath}/notice/update" method="post" enctype="multipart/form-data">
           <input type="hidden" name="id" value="${notice.ann_seq}" />
           <table>
               <tr>
                   <td>분류 ID:</td>
                   <td><input type="text" name="class_id" value="${notice.class_id}" /></td>
               </tr>
               <tr>
                   <td>제목:</td>
                   <td><input type="text" name="ann_title" value="${notice.ann_title}" /></td>
               </tr>
               <tr>
                   <td>등록일:</td>
                   <td><input type="text" name="ann_regi" value="${notice.ann_regi}" readonly /></td>
               </tr>
               <tr>
                   <td>내용:</td>
                   <td><textarea name="ann_detail">${notice.ann_detail}</textarea></td>
               </tr>
               <tr>
                   <td>첨부파일:</td>
                   <td>
                       <input type="file" name="ann_attach" />
                       <c:if test="${not empty notice.ann_attach}">
                           <p>기존 파일: ${notice.ann_attach}</p>
                       </c:if>
                   </td>
               </tr>
           </table>
           <button type="submit">수정하기</button>
       </form>
        </section>
</body>
</html>


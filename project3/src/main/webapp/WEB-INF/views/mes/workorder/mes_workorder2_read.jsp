<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BOM 수정</title>
    <link href="./assets/css/mes/admin_table.css" rel="stylesheet">
    <link href="./assets/css/mes/00.user_side_base.css" rel="stylesheet">
    <link href="./assets/css/mes/admin.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
    <script src="./assets/js/mes/click.js"></script>
    <link href="./assets/css/mes/mes_workorder.css" rel="stylesheet">
    <link href="./assets/css/mes/click.css" rel="stylesheet">
</head>
<body>
    <section>
        <div class="main_page" id="main_page_1">
            <h3>BOM 수정</h3>

            <div class="page_2">
                <!-- 등록 폼 -->
                <form id="postForm" method="post" action="${pageContext.request.contextPath}/updateBom">
                    <table id="main_library">
                        <thead>
                            <tr>
                                <th class="sortable">제품코드</th>
                                <th>부품명</th>
                                <th>부품코드1</th>
                                <th>부품코드2</th>
                                <th>부품코드3</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="hidden" name="bom_code" value="${list.bom_code}"/>
                                    ${list.bom_code}
                                </td>
                                <td>
                                    <input type="text" name="bom_name" value="${list.bom_name}" />
                                </td>
                                <td>
                                    <select name="mes_book_code1">
                                        <c:forEach var="code" items="${list2}">
                                            <option value="${code.mes_book_code1}">${code.mes_book_code1}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <select name="mes_book_code2">
                                        <c:forEach var="code" items="${list2}">
                                            <option value="${code.mes_book_code2}">${code.mes_book_code2}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <select name="mes_book_code3">
                                        <c:forEach var="code" items="${list2}">
                                            <option value="${code.mes_book_code3}">${code.mes_book_code3}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" value="등록">
                </form>
            </div>
            
            <!-- 삭제 폼 -->
           <form method="post" action="mes_bomdelete">
			 <input type="hidden" name="bom_code" value="${param.bom_code}">
                <input type="submit" id="deleteButton" value="BOM 삭제">
            </form>
        </div>
    </section>

    <script src="./assets/js/mes/mes_workorderBom.js"></script>
</body>
</html>

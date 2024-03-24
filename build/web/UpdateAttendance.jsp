<%-- 
    Document   : UpdateAttendance
    Created on : Oct 30, 2023, 5:28:12 AM
    Author     : kienb
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Attendance for ${account.username} - ${classID.name} - ${course.name}</h1>
        <table class="table">
            <thead>
                <tr>
                    <td>STT</td>
                    <td>Room</td>
                    <td>Slot</td>
                    <td>Date</td>
                    <td>Teacher</td>
                    <td>Class</td>
                    <td>Status</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.list}" var="item" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${item.room.name}</td>
                        <td>${item.slotid}</td>
                        <td>
                            <fmt:parseDate value="${item.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
                            <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="date" pattern="dd.MM.yyyy" />
                        </td>
                        <td>${item.teacher.username}</td>
                        <td>${item.tier.name}</td>
                        <td>
                            <form action="UpdateAttendance" method="post">
                                <input type="hidden" name="room" value="${item.room.id}">
                                <input type="hidden" name="slot" value="${item.slotid}">
                                <input type="hidden" name="id" value="${account.id}">
                                <input type="hidden" name="date" value="${item.date}">
                                <select name="status" onchange="this.form.submit()">
                                    <option value="1" ${item.status eq true ? 'selected' : ''}>Attended</option>
                                    <option value="0" ${item.status eq false ? 'selected' : ''}>Absent</option>
                                    <option value="2" ${item.status == null ? 'selected' : ''}>Not Yet</option>
                                </select>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div>
            <a href="viewAttendance">Back</a>
        </div>
    </body>
</html>

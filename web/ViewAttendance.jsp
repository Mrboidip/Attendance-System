<%-- 
    Document   : ViewAttendance
    Created on : Oct 30, 2023, 4:43:37 AM
    Author     : kienb
--%>

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
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" href="#profile" role="tab" data-toggle="tab">View Attendance</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#buzz" role="tab" data-toggle="tab">View Students</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active" id="profile"> <h1 style="text-align: center">View Attendance</h1>
                <div style="margin: auto 0" class="row">
                    <div class="col-lg-12">
                        <form action="viewAttendance">
                            <div class="form-row">
                                <div class="col-lg-3">
                                    <label>Class Name</label>
                                    <select name="class" class="form-control">
                                        <c:forEach items="${requestScope.classes}" var="item">
                                            <option value="${item.id}" ${item.id == classid.id ? 'selected' : ''}>${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label>Subject Name</label>
                                    <select name="subject" class="form-control">
                                        <c:forEach items="${requestScope.courses}" var="item">
                                            <option value="${item.id}" ${item.id == courseid.id ? 'selected' : ''}>${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button style="margin-top: 24px" type="submit" class="btn btn-primary mb-2 col">Search</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-12" style="margin-top: 12px">
                        <table class="table">
                            <thead>
                                <tr>
                                    <td>STT</td>
                                    <td>Student Name</td>
                                    <td>Subject Name</td>
                                    <td>Class Name</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.list}" var="item" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${item.username}</td>
                                        <td>${courseid.name}</td>
                                        <td>${classid.name}</td>
                                        <td><a href="UpdateAttendance?class=${classid.id}&subject=${courseid.id}&id=${item.id}">View</a></td>
                                        <c:if test="${sessionScope.isAdmin}">
                                            <td><a href="UpdateAttendance?class=${classid.id}&subject=${courseid.id}&id=${item.id}">View Profile</a></td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </tbody>                 
                        </table>
                        <div style="text-align: center">
                            <c:forEach begin="1" end="${requestScope.totalpage}" var="item">
                                <a href="${pageContext.request.contextPath}/viewAttendance?class=${classid.id}&subject=${courseid.id}&pagenum=${item}">${item}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="buzz">
                <c:if test="${sessionScope.listAcc == null}">
                    <h2>You don't have permission to access</h2>
                </c:if>
                <c:if test="${sessionScope.listAcc != null}">
                    <div role="tabpanel" class="tab-pane fade in active" id="profile"> <h1 style="text-align: center">View Students</h1>
                        <div style="margin: auto 0" class="row">
                            <div class="col-lg-12" style="margin-top: 12px">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <td>STT</td>
                                            <td>Student Name</td>
                                            <td>Role</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.listAcc}" var="item" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${item.username}</td>
                                                <td>${item.isIsTeacher() ? 'Teacher' : 'Student'}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>                 
                                </table>
                            </div>
                        </div>
                    </div> 
                </c:if>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="references">ccc</div>
        </div>

    </body>
</html>

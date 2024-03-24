<%-- 
    Document   : AttendanceReport
    Created on : Oct 29, 2023, 10:10:07 PM
    Author     : kienb
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
                <title>
                    View attendance for student
                </title>
                <link rel="Stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" type="text/css">
                    <link rel="Stylesheet" href="fu.css" type="text/css">
                        <link rel="Stylesheet" href="JavaScript/jquery.css" type="text/css">
                            <link rel="Stylesheet" href="JavaScript/jquery-ui.css" type="text/css">
                                <link rel="Stylesheet" href="JavaScript/jquery.alerts.css" type="text/css">
                                    <script type="text/javascript" async="" src="https://ssl.google-analytics.com/ga.js"></script>
                                    <script src="../JavaScript/jquery.min.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery_002.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery_003.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery-1.8.3.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery-ui.js" type="text/javascript"></script>
                                    <script src="../JavaScript/jquery.alerts.js" type="text/javascript"></script>
                                    <link rel="Stylesheet" href="Content/bootstrap.css" type="text/css">
                                        <link rel="Stylesheet" href="Content/bootstrap.min.css" type="text/css">
                                            <link rel="Stylesheet" href="Content/bootstrap-theme.min.css" type="text/css">
                                                <style type="text/css">
                                                    .style1 {
                                                        font-weight: bold;
                                                    }
                                                </style>
                                                </head>

                                                <body style="">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <h1><span>FPT University Academic Portal</span>
                                                                </h1>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><a href="https://apps.apple.com/app/id1527723314">
                                                                                    <img src="https://fap.fpt.edu.vn/images/app-store.png"
                                                                                         style="width: 120px; height: 40px" alt="apple store"></a></td>
                                                                            <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                                                                    <img src="https://fap.fpt.edu.vn/images/play-store.png"
                                                                                         style="width: 120px; height: 40px" alt="google store"></a></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <jsp:include page="Header.jsp"></jsp:include>
                                                                    <table>
                                                                        <tbody>
                                                                            <tr style="border-bottom: 0 none">
                                                                                <td>
                                                                                    <div>
                                                                                        <h2>View attendance for <span id="ctl00_mainContent_lblStudent">${sessionScope.account.username}</span></h2>
                                                                                    <font style="font-weight: bold"> </font>
                                                                                    <div id="ctl00_mainContent_divDetail"> </div>
                                                                                    <table>
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td valign="top">
                                                                                                    <h3>Select a campus/program, term, course ...</h3>
                                                                                                    <table summary="Select a course">
                                                                                                        <thead>
                                                                                                            <tr>
                                                                                                                <th scope="col">Campus/program</th>
                                                                                                                <th scope="col">Course</th>
                                                                                                            </tr>
                                                                                                        </thead>
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <div id="ctl00_mainContent_divCampus">
                                                                                                                        <table>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td><b>FU-HL</b></td>
                                                                                                                                </tr>
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                                <td valign="top">
                                                                                                                    <div id="ctl00_mainContent_divCourse">
                                                                                                                        <table>
                                                                                                                            <tbody>
                                                                                                                                <c:forEach items="${requestScope.list}" var="item">
                                                                                                                                    <c:if test="${item.id == course.id}">
                                                                                                                                        <tr>
                                                                                                                                            <td><b>${item.name}</b></td>
                                                                                                                                        </tr>
                                                                                                                                    </c:if>
                                                                                                                                    <c:if test="${item.id != course.id}">
                                                                                                                                        <tr>
                                                                                                                                            <td><a href="${pageContext.request.contextPath}/report?id=${item.id}">${item.name}</a></td>
                                                                                                                                        </tr>
                                                                                                                                    </c:if>
                                                                                                                                </c:forEach>                                                                                                 
                                                                                                                            </tbody>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td valign="top">
                                                                                                    <h3 style="    padding: 0;margin: 11px">... then see report<br><br></h3>
                                                                                                                <table class="table table-bordered table1">
                                                                                                                    <tbody>
                                                                                                                        <tr></tr>
                                                                                                                    </tbody>
                                                                                                                    <thead>
                                                                                                                        <tr>
                                                                                                                            <th>No.</th>
                                                                                                                            <th>Date</th>
                                                                                                                            <th>Slot</th>
                                                                                                                            <th>Room</th>
                                                                                                                            <th>Lecturer</th>
                                                                                                                            <th>Group Name</th>
                                                                                                                            <th>Attedance status</th>                                                                                                                        </tr>
                                                                                                                    </thead>
                                                                                                                    <tbody>
                                                                                                                        <c:forEach items="${requestScope.listAtt}" var="item" varStatus="loop">
                                                                                                                            <tr>
                                                                                                                                <td>${loop.index + 1}</td>
                                                                                                                                <td><span class="label label-primary">
                                                                                                                                        <fmt:parseDate value="${item.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
                                                                                                                                        <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="date" pattern="dd.MM.yyyy" />
                                                                                                                                        ${newParsedDate}
                                                                                                                                    </span></td>
                                                                                                                                <td><span
                                                                                                                                        class="label label-danger">${item.slotid}</span>
                                                                                                                                </td>
                                                                                                                                <td>${item.room.name}</td>
                                                                                                                                <td>${item.teacher.username}</td>
                                                                                                                                <td>${item.tier.name}</td>
                                                                                                                                <td>
                                                                                                                                    <c:if test="${item.status == null}"> 
                                                                                                                                        <font color="red">Not Yet</font>
                                                                                                                                        </c:if>
                                                                                                                                        <c:if test="${item.status != null and item.status eq false}"> 
                                                                                                                                        <font color="red">Absent</font>
                                                                                                                                        </c:if>
                                                                                                                                        <c:if test="${item.status != null and item.status eq true}"> 
                                                                                                                                        <font color="green">Attended</font>
                                                                                                                                        </c:if>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </c:forEach>
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                                </td>
                                                                                                                </tr>
                                                                                                                </tbody>
                                                                                                                </table>
                                                                                                                </div>
                                                                                                                </td>
                                                                                                                </tr>
                                                                                                                </tbody>
                                                                                                                </table>
                                                                                                                </div>
                                                                                                                </div>
                                                                                                                </div>
                                                                                                                <script defer=""
                                                                                                                        src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317"
                                                                                                                        integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA=="
                                                                                                                        data-cf-beacon="{&quot;rayId&quot;:&quot;81dc56c3a81807ad&quot;,&quot;version&quot;:&quot;2023.10.0&quot;,&quot;token&quot;:&quot;56c6dd7e4ecf4947aa540f48289e45af&quot;}"
                                                                                                                crossorigin="anonymous"></script>


                                                                                                                </body>

                                                                                                                </html>

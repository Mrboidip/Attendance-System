<%-- 
    Document   : Attendance
    Created on : Jul 4, 2023, 4:19:25 PM
    Author     : kienb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
                <title>
                    FPT University Academic Portal
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
                                                                    <form method="post" action="attendance">
                                                                        <table>
                                                                            <tbody>
                                                                                <tr style="border-bottom: 0 none">
                                                                                    <td>
                                                                                        <div>
                                                                                            <h2>
                                                                                                Attendance</span>
                                                                                            </h2>
                                                                                            <div id="ctl00_mainContent_divContent"></div>
                                                                                            <table>
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <th>
                                                                                                            STT
                                                                                                        </th>
                                                                                                        <th>
                                                                                                            Username
                                                                                                        </th>
                                                                                                        <th colspan="2">
                                                                                                            Attendance
                                                                                                        </th>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                                <tbody>
                                                                                                <c:forEach items="${requestScope.listAtt}" var="i" varStatus="item">
                                                                                                    <tr>
                                                                                                        <td>${item.index + 1}</td>
                                                                                                        <td>${i.student.username}</td>
                                                                                                        <td>
                                                                                                            <input type="radio" name="${i.student.id}" value="1" ${i.status != null and i.status eq true ? 'checked' : ''}>
                                                                                                                <label>Attended</label>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <input type="radio" name="${i.student.id}" value="0" ${i.status == null or i.status eq false ? 'checked' : ''}>
                                                                                                                <label>Absent</label>
                                                                                                        </td>
                                                                                                    </tr> 
                                                                                                </c:forEach>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                        <tr style="border-bottom: 0 none">
                                                                            <button type="submit">Save</button>
                                                                        </tr>
                                                                    </table>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <script defer=""
                                                            src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816"
                                                            integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw=="
                                                            data-cf-beacon="{&quot;rayId&quot;:&quot;7e1649ac2eb7b42d&quot;,&quot;token&quot;:&quot;56c6dd7e4ecf4947aa540f48289e45af&quot;,&quot;version&quot;:&quot;2023.4.0&quot;,&quot;si&quot;:100}"
                                                    crossorigin="anonymous"></script>


                                                </body>

                                                </html>

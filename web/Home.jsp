<%-- 
    Document   : Home
    Created on : Jul 3, 2023, 6:52:59 PM
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
                                                                    <table>
                                                                        <tbody>
                                                                            <tr style="border-bottom: 0 none">
                                                                                <td>
                                                                                    <div>
                                                                                        <style>
                                                                                            #displayed {
                                                                                                display: block;
                                                                                                margin-left: auto;
                                                                                                margin-right: auto;
                                                                                            }
                                                                                        </style>
                                                                                        <script type="text/javascript">
                                                                                            $(document).ready(function () {

                                                                                                $("#thover").click(function () {
                                                                                                    $(this).fadeOut();
                                                                                                    $("#tpopup").fadeOut();
                                                                                                });

                                                                                                $("#tclose").click(function () {
                                                                                                    $("#thover").fadeOut();
                                                                                                    $("#tpopup").fadeOut();
                                                                                                });

                                                                                            });

                                                                                        </script>
                                                                                        <div class="row">
                                                                                            <div id="ctl00_mainContent_divMain">
                                                                                                <div class="box">
                                                                                                    <h3 class="orangeTitle">Academic Information</h3>
                                                                                                    <div class="listBoxWrapper">
                                                                                                        <table>
                                                                                                            <tbody>
                                                                                                                <tr>
                                                                                                                    <td>
                                                                                                                        <table>
                                                                                                                            <tbody>
                                                                                                                                <tr>
                                                                                                                                    <td valign="top">
                                                                                                                                        <h4>Information Access(Tra cứu
                                                                                                                                            thông tin)</h4>
                                                                                                                                        <ul>
                                                                                                                                            <li><a
                                                                                                                                                    href="weeklyTable">Weekly
                                                                                                                                                    timetable</a> (Thời
                                                                                                                                                khóa biểu từng tuần)
                                                                                                                                            </li>
                                                                                                                                        <c:if test="${sessionScope.account.isTeacher eq false}">
                                                                                                                                            <li><a
                                                                                                                                                    href="report">Attendance Report</a> (Báo cáo điểm danh)
                                                                                                                                            </li>
                                                                                                                                        </c:if>
                                                                                                                                    </ul>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </tbody>
                                                                                                                    </table>
                                                                                                                </td>

                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div id="ctl00_mainContent_divFed">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </body>

                                                </html>
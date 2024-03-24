<%-- 
    Document   : WeeklyTimeTable
    Created on : Jul 4, 2023, 11:43:13 AM
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
                                                                <form method="post" action="weeklyTable">
                                                                    <ol class="breadcrumb">
                                                                        <li>
                                                                            <span id="ctl00_lblNavigation"><a href="Home.jsp">Home</a>&nbsp;|&nbsp;<b>View
                                                                                    Schedule</b></span>
                                                                        </li>
                                                                    </ol>
                                                                    <table>
                                                                        <tbody>
                                                                            <tr style="border-bottom: 0 none">
                                                                                <td>
                                                                                    <div>
                                                                                        <style>
                                                                                            div.online-indicator {
                                                                                                display: inline-block;
                                                                                                width: 15px;
                                                                                                height: 15px;
                                                                                                margin-right: 5px;

                                                                                                background-color: #0fcc45;
                                                                                                border-radius: 50%;

                                                                                                position: relative;
                                                                                            }

                                                                                            span.blink {
                                                                                                display: block;
                                                                                                width: 15px;
                                                                                                height: 15px;

                                                                                                background-color: #0fcc45;
                                                                                                opacity: 0.7;
                                                                                                border-radius: 50%;

                                                                                                animation: blink 1s linear infinite;
                                                                                            }

                                                                                            h3.online-text {
                                                                                                display: inline;

                                                                                                font-family: 'Rubik', sans-serif;
                                                                                                font-weight: 400;
                                                                                                text-shadow: 0px 3px 6px rgba(150, 150, 150, 0.2);

                                                                                                position: relative;
                                                                                                cursor: pointer;
                                                                                            }

                                                                                            /*Animations*/

                                                                                            @keyframes blink {
                                                                                                100% {
                                                                                                    transform: scale(2, 2);
                                                                                                    opacity: 0;
                                                                                                }
                                                                                            }

                                                                                            .auto-style1 {
                                                                                                color: #FF3300;
                                                                                            }

                                                                                            .auto-style2 {
                                                                                                color: #FF3300;
                                                                                                font-size: 14pt;
                                                                                            }
                                                                                        </style>
                                                                                        <h2>Activities for ${sessionScope.account.username}
                                                                                            <span id="ctl00_mainContent_lblStudent"></span>
                                                                                        </h2>
                                                                                        <div id="ctl00_mainContent_divNameDay"></div>
                                                                                        <div id="ctl00_mainContent_divShowDate"></div>
                                                                                        <div id="ctl00_mainContent_divContent"></div>
                                                                                        <table>
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th rowspan="2">
                                                                                                        <span class="auto-style1"><strong>Year</strong></span>
                                                                                                        <select name="year"
                                                                                                                id="ctl00_mainContent_drpYear" onchange="this.form.submit()">
                                                                                                            <option value="2020" ${requestScope.selectedYear == 2020 ? 'selected' : ''}>2020</option>
                                                                                                            <option value="2021" ${requestScope.selectedYear == 2021 ? 'selected' : ''}>2021</option>
                                                                                                            <option value="2022" ${requestScope.selectedYear == 2022 ? 'selected' : ''}>2022</option>
                                                                                                            <option value="2023" ${requestScope.selectedYear == 2023 ? 'selected' : ''}>2023</option>
                                                                                                            <option value="2024" ${requestScope.selectedYear == 2024 ? 'selected' : ''}>2024</option>
                                                                                                        </select>
                                                                                                        <br>
                                                                                                            Week
                                                                                                            <select name="DateRange"
                                                                                                                    id="ctl00_mainContent_drpSelectWeek" onchange="this.form.submit()">
                                                                                                                <c:forEach items="${requestScope.listDayDTO}" var="i">
                                                                                                                    <option value="${i.week}" ${i.week == requestScope.selectedWeek ? 'selected' : ''}>${i.content}</option>
                                                                                                                </c:forEach>                                                      
                                                                                                            </select>
                                                                                                    </th>
                                                                                                    <th align="center">Mon</th>
                                                                                                    <th align="center">Tue</th>
                                                                                                    <th align="center">Wed</th>
                                                                                                    <th align="center">Thu</th>
                                                                                                    <th align="center">Fri</th>
                                                                                                    <th align="center">Sat</th>
                                                                                                    <th align="center">Sun</th>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <c:forEach items="${requestScope.dayWeeks}" var="i">
                                                                                                        <th align="center">${i.showDate()}</th>
                                                                                                        </c:forEach>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <c:forEach items="${requestScope.map}" var="i">
                                                                                                    <tr>
                                                                                                        <td>${i.key}</td>
                                                                                                        <c:forEach items="${i.value}" var="j">                                
                                                                                                            <c:if test="${j.session == null}">
                                                                                                                <td>-</td>
                                                                                                            </c:if>
                                                                                                            <c:if test="${j.session != null}">
                                                                                                                <td>
                                                                                                                    <p>
                                                                                                                        <a
                                                                                                                            href="detail?sid=${j.session.room.id}&slid=${j.session.slotid}&date=${j.session.date}">${j.session.course.name}-
                                                                                                                        </a>
                                                                                                                        <br> at ${j.session.room.name}
                                                                                                                            <br>
                                                                                                                                <c:if test="${sessionScope.account != null && sessionScope.account.isTeacher eq false}">
                                                                                                                                    (
                                                                                                                                    <c:if test="${j.session.status == null}">
                                                                                                                                        <font color="red">Not yet
                                                                                                                                        </font>
                                                                                                                                    </c:if>
                                                                                                                                    <c:if test="${j.session.status != null and j.session.status eq true}">
                                                                                                                                        <font color="green">Attended
                                                                                                                                        </font>
                                                                                                                                    </c:if>
                                                                                                                                    <c:if test="${j.session.status != null and j.session.status eq false}">
                                                                                                                                        <font color="red">Absent
                                                                                                                                        </font>
                                                                                                                                    </c:if>)
                                                                                                                                </c:if>
                                                                                                                                <br>
                                                                                                                                    </p>
                                                                                                                                    </td>
                                                                                                                                </c:if>
                                                                                                                            </c:forEach>
                                                                                                                            </tr>
                                                                                                                        </c:forEach>
                                                                                                                        </tbody>
                                                                                                                        </table>
                                                                                                                        <p>
                                                                                                                            <b>More note / Chú thích thêm</b>:
                                                                                                                        </p>
                                                                                                                        <div id="ctl00_mainContent_divfoot">
                                                                                                                            <ul>
                                                                                                                                <li>(<font color="green">attended</font>): ${sessionScope.account.username} had attended
                                                                                                                                    this activity / ${sessionScope.account.username} đã tham gia hoạt động này</li>
                                                                                                                                <li>(<font color="red">absent</font>): ${sessionScope.account.username} had NOT attended
                                                                                                                                    this activity / ${sessionScope.account.username} đã vắng mặt buổi này</li>
                                                                                                                                <li>(-): no data was given / chưa có dữ liệu</li>
                                                                                                                            </ul>
                                                                                                                        </div>
                                                                                                                        <p>
                                                                                                                        </p>
                                                                                                                        </div>
                                                                                                                        </td>
                                                                                                                        </tr>
                                                                                                                        </tbody>
                                                                                                                        </table>
                                                                                                                        </form>
                                                                                                                        </div>
                                                                                                                        </div>
                                                                                                                        </div>
                                                                                                                        <script type="text/javascript">

                                                                                                                            var _gaq = _gaq || [];
                                                                                                                            _gaq.push(['_setAccount', 'UA-10421012-13']);
                                                                                                                            _gaq.push(['_trackPageview']);

                                                                                                                            (function () {
                                                                                                                                var ga = document.createElement('script');
                                                                                                                                ga.type = 'text/javascript';
                                                                                                                                ga.async = true;
                                                                                                                                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                                                                                                                                var s = document.getElementsByTagName('script')[0];
                                                                                                                                s.parentNode.insertBefore(ga, s);
                                                                                                                            })();

                                                                                                                        </script>
                                                                                                                        <script type="text/javascript">
                                                                                                                            var isClose = false;

                                                                                                                            //this code will handle the F5 or Ctrl+F5 key
                                                                                                                            //need to handle more cases like ctrl+R whose codes are not listed here
                                                                                                                            document.onkeydown = checkKeycode;
                                                                                                                            function checkKeycode(e) {
                                                                                                                                var keycode;
                                                                                                                                if (window.event)
                                                                                                                                    keycode = window.event.keyCode;
                                                                                                                                else if (e)
                                                                                                                                    keycode = e.which;
                                                                                                                                if (keycode == 116) {
                                                                                                                                    isClose = true;
                                                                                                                                }
                                                                                                                            }
                                                                                                                            function somefunction() {
                                                                                                                                isClose = true;
                                                                                                                            }

                                                                                                                            //<![CDATA[

                                                                                                                            function bodyUnload() {

                                                                                                                                if (!isClose) {
                                                                                                                                    var request = GetRequest();
                                                                                                                                    request.open("GET", "LogOut.aspx", true);
                                                                                                                                    request.send();
                                                                                                                                }
                                                                                                                            }
                                                                                                                            function GetRequest() {
                                                                                                                                var request = null;
                                                                                                                                if (window.XMLHttpRequest) {
                                                                                                                                    //incase of IE7,FF, Opera and Safari browser
                                                                                                                                    request = new XMLHttpRequest();
                                                                                                                                } else {
                                                                                                                                    //for old browser like IE 6.x and IE 5.x
                                                                                                                                    request = new ActiveXObject('MSXML2.XMLHTTP.3.0');
                                                                                                                                }
                                                                                                                                return request;
                                                                                                                            }
                                                                                                                            
                                                                                                                            function checkChange(e,i){
                                                                                                                                const curdate = new Date();
                                                                                                                                var date = new Date(i);
                                                                                                                                if(date <= curdate){
                                                                                                                                    alert('Không thể đổi lịch học ngày này');
                                                                                                                                    e.preventDefault();
                                                                                                                                }
                                                                                                                            }
                                                                                                                            //]]>
                                                                                                                        </script>
                                                                                                                        <script defer=""
                                                                                                                                src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816"
                                                                                                                                integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw=="
                                                                                                                                data-cf-beacon="{&quot;rayId&quot;:&quot;7e0eef704b7e195f&quot;,&quot;token&quot;:&quot;56c6dd7e4ecf4947aa540f48289e45af&quot;,&quot;version&quot;:&quot;2023.4.0&quot;,&quot;si&quot;:100}"
                                                                                                                        crossorigin="anonymous"></script>


                                                                                                                        </body>

                                                                                                                        </html>

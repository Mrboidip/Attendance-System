<%-- 
    Document   : Login
    Created on : Jul 3, 2023, 4:34:21 PM
    Author     : kienb
--%>

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
                                    <script type="text/javascript" async="" src="http://www.google-analytics.com/ga.js"></script>
                                    <script type="text/javascript" async="" src="http://www.google-analytics.com/ga.js"></script>
                                    <script
                                        src="https://apis.google.com/_/scs/abc-static/_/js/k=gapi.lb.en.5o5-TAFr18s.O/m=signin2/rt=j/sv=1/d=1/ed=1/rs=AHpOoo_qgszOsFrBH7bZ1Rmfwa9Mc03wLQ/cb=gapi.loaded_0?le=scs"
                                    async=""></script>
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
                                                <style>
                                                    .abcRioButton {
                                                        border-radius: 1px;
                                                        box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .25);
                                                        -moz-box-sizing: border-box;
                                                        box-sizing: border-box;
                                                        -webkit-transition: background-color .218s, border-color .218s, box-shadow .218s;
                                                        transition: background-color .218s, border-color .218s, box-shadow .218s;
                                                        -webkit-user-select: none;
                                                        -webkit-appearance: none;
                                                        background-color: #fff;
                                                        background-image: none;
                                                        color: #262626;
                                                        cursor: pointer;
                                                        outline: none;
                                                        overflow: hidden;
                                                        position: relative;
                                                        text-align: center;
                                                        vertical-align: middle;
                                                        white-space: nowrap;
                                                        width: auto
                                                    }

                                                    .abcRioButton:hover {
                                                        box-shadow: 0 0 3px 3px rgba(66, 133, 244, .3)
                                                    }

                                                    .abcRioButtonBlue {
                                                        background-color: #4285f4;
                                                        border: none;
                                                        color: #fff
                                                    }

                                                    .abcRioButtonBlue:hover {
                                                        background-color: #4285f4
                                                    }

                                                    .abcRioButtonBlue:active {
                                                        background-color: #3367d6
                                                    }

                                                    .abcRioButtonLightBlue {
                                                        background-color: #fff;
                                                        color: #757575
                                                    }

                                                    .abcRioButtonLightBlue:active {
                                                        background-color: #eee;
                                                        color: #6d6d6d
                                                    }

                                                    .abcRioButtonIcon {
                                                        float: left
                                                    }

                                                    .abcRioButtonBlue .abcRioButtonIcon {
                                                        background-color: #fff;
                                                        border-radius: 1px
                                                    }

                                                    .abcRioButtonSvg {
                                                        display: block
                                                    }

                                                    .abcRioButtonContents {
                                                        font-family: Roboto, arial, sans-serif;
                                                        font-size: 14px;
                                                        font-weight: 500;
                                                        letter-spacing: .21px;
                                                        margin-left: 6px;
                                                        margin-right: 6px;
                                                        vertical-align: top
                                                    }

                                                    .abcRioButtonContentWrapper {
                                                        height: 100%;
                                                        width: 100%
                                                    }

                                                    .abcRioButtonBlue .abcRioButtonContentWrapper {
                                                        border: 1px solid transparent
                                                    }

                                                    .abcRioButtonErrorWrapper,
                                                    .abcRioButtonWorkingWrapper {
                                                        display: none;
                                                        height: 100%;
                                                        width: 100%
                                                    }

                                                    .abcRioButtonErrorIcon,
                                                    .abcRioButtonWorkingIcon {
                                                        margin-left: auto;
                                                        margin-right: auto
                                                    }

                                                    .abcRioButtonErrorState,
                                                    .abcRioButtonWorkingState {
                                                        border: 1px solid #d5d5d5;
                                                        border: 1px solid rgba(0, 0, 0, .17);
                                                        box-shadow: 0 1px 0 rgba(0, 0, 0, .05);
                                                        color: #262626
                                                    }

                                                    .abcRioButtonErrorState:hover,
                                                    .abcRioButtonWorkingState:hover {
                                                        border: 1px solid #aaa;
                                                        border: 1px solid rgba(0, 0, 0, .25);
                                                        box-shadow: 0 1px 0 rgba(0, 0, 0, .1)
                                                    }

                                                    .abcRioButtonErrorState:active,
                                                    .abcRioButtonWorkingState:active {
                                                        border: 1px solid #aaa;
                                                        border: 1px solid rgba(0, 0, 0, .25);
                                                        box-shadow: inset 0 1px 0 #ddd;
                                                        color: #262626
                                                    }

                                                    .abcRioButtonWorkingState,
                                                    .abcRioButtonWorkingState:hover {
                                                        background-color: #f5f5f5
                                                    }

                                                    .abcRioButtonWorkingState:active {
                                                        background-color: #e5e5e5
                                                    }

                                                    .abcRioButtonErrorState,
                                                    .abcRioButtonErrorState:hover {
                                                        background-color: #fff
                                                    }

                                                    .abcRioButtonErrorState:active {
                                                        background-color: #e5e5e5
                                                    }

                                                    .abcRioButtonErrorState .abcRioButtonErrorWrapper,
                                                    .abcRioButtonWorkingState .abcRioButtonWorkingWrapper {
                                                        display: block
                                                    }

                                                    .abcRioButtonErrorState .abcRioButtonContentWrapper,
                                                    .abcRioButtonErrorState .abcRioButtonWorkingWrapper,
                                                    .abcRioButtonWorkingState .abcRioButtonContentWrapper {
                                                        display: none
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
                                                                <table>
                                                                    <tbody>
                                                                        <tr style="border-bottom: 0 none">
                                                                            <td>
                                                                                <div>
                                                                                    <div id="ctl00_mainContent_divcontent">
                                                                                        <div class="row">
                                                                                            <div class="col-md-4">
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <form action="login" method="post">
                                                                                                    <div class="form-group">
                                                                                                        <label for="exampleInputEmail1">Username</label>
                                                                                                        <input type="text" class="form-control" id="exampleInputEmail1"
                                                                                                               aria-describedby="emailHelp" placeholder="Enter email" name="username" required="">
                                                                                                    </div>
                                                                                                    <div class="form-group">
                                                                                                        <label for="exampleInputPassword1">Password</label>
                                                                                                        <input type="password" class="form-control"
                                                                                                               id="exampleInputPassword1" placeholder="Password" name="password" required="">
                                                                                                    </div>
                                                                                                    <div class="form-check">
                                                                                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="remember">
                                                                                                            <label class="form-check-label" for="exampleCheck1">Remember me</label>
                                                                                                    </div>
                                                                                                    <div style="color: red">${requestScope.error}</div>
                                                                                                    <button style="margin-left: 40%;" type="submit"
                                                                                                            class="btn btn-primary">Submit</button>
                                                                                                </form>
                                                                                            </div>
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
                                                    <script defer=""
                                                            src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816"
                                                            integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw=="
                                                            data-cf-beacon="{&quot;rayId&quot;:&quot;7e0dabeb5c0b8b7b&quot;,&quot;token&quot;:&quot;56c6dd7e4ecf4947aa540f48289e45af&quot;,&quot;version&quot;:&quot;2023.4.0&quot;,&quot;si&quot;:100}"
                                                    crossorigin="anonymous"></script>


                                                    <iframe id="ssIFrame_google" sandbox="allow-scripts allow-same-origin" aria-hidden="true" frame-border="0"
                                                            style="position: absolute; width: 1px; height: 1px; inset: -9999px; display: none;"
                                                            src="https://accounts.google.com/o/oauth2/iframe#origin=https%3A%2F%2Ffap.fpt.edu.vn&amp;rpcToken=544982079.8912868"></iframe>
                                                    <!-- Code injected by live-server -->


                                                </body>

                                                </html>
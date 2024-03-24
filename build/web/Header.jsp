<%-- 
    Document   : Header
    Created on : Jul 3, 2023, 6:55:19 PM
    Author     : kienb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="ctl00_divUser" style="float: right; margin-right: 16px;">
    <a href="#">
        <span id="ctl00_lblLogIn" class="label label-success">${sessionScope.account.username}</span></a> | <a
        href="logout" class="label label-success">logout</a> |
</div>

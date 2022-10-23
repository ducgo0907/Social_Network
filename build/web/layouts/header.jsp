<%-- 
    Document   : header
    Created on : Sep 20, 2022, 12:03:33 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file="../css/custom.css" %>
        </style>
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-fixed-top navbar-dark bg-primary header-tab">
            <div class="container">
                <a class="" id="logo" href="${sessionScope.account != null? "home" : "login"}">Social Network</a>
                <c:if test="${sessionScope.account != null}">
                    <div class="righ-tab-header">
                        <a class="text-tab btn" href="profile.jsp">Profile</a>
                        <a class="text-tab btn" href="check?action=edit">Edit</a>
                        <a class="text-tab btn" href="check?action=change">Change password</a>
                        <a class="text-tab btn" href="logout">Logout</a>
                    </div>
                </c:if>
            </div>
        </nav>
        <c:if test="${requestScope.message != null}">
            <div class="container nofication alert alert-${requestScope.status}" role="alert">
                ${requestScope.message}
            </div>
        </c:if>
    </body>
</html>

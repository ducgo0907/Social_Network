<%-- 
    Document   : header
    Created on : Sep 20, 2022, 12:03:33 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ckfinder" uri="http://cksource.com/ckfinder" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" 
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/libraries/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-fixed-top navbar-dark bg-primary header-tab">
            <div class="container">
                <div class="row">

                    <a class="" id="logo" href="${sessionScope.account != null? "home" : "login"}">Social Network</a>
                    <div class="mid-tab-header">
                        <form action="search" method="get">
                            <input type="text" name="nameSearch" id="input-search"/>
                            <select style="color: black; height: 28px;" name="typeSearch">
                                <option value="user">User</option>
                                <option value="post">Post</option>
                            </select>
                            <input type="submit" value="Search" class="btn btn-success"/>
                        </form>
                    </div>
                    <c:if test="${sessionScope.account != null}">

                        <div class="righ-tab-header">
                            <a class="text-tab btn" href="profile?id=${sessionScope.account.getUserId()}">Profile</a>
                            <a class="text-tab btn" href="check?action=edit">Edit</a>
                            <a class="text-tab btn" href="check?action=change">Change password</a>
                            <a class="text-tab btn" href="logout">Logout</a>
                        </div>

                    </c:if>
                </div>
            </div>
        </nav>
        <c:if test="${requestScope.message != null}">
            <div class="container nofication alert alert-${requestScope.status}" role="alert">
                ${requestScope.message}
            </div>
        </c:if>
    </body>
</html>

<%-- 
    Document   : edit_profile
    Created on : Oct 9, 2022, 8:33:57 AM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="layouts/header.jsp" %>
        <div class="edit-user-information container">
            <h1>Change password</h1>
            <div class="col-lg-4"></div>
            <form class="col-lg-4" action="change" method="post">
                <label for="email" class="text-form">Email</label>
                <input type="text" name="email" readonly value="${sessionScope.account.email}" class="form-control"/><br/>
                
                <label for="password" class="text-form">Old password</label>
                <input type="password" name="oldPassword" class="form-control"/><br/>
                
                <label for="password" class="text-form">New Password</label>
                <input type="password" name="newPassword" class="form-control"/><br/>
                
                <label for="password" class="text-form">Password Confirmation</label>
                <input type="password" name="confirmPassword" class="form-control"/><br/>
                
                <input type="submit" value="Change password" class="btn btn-primary"/>
            </form>
            <div class="col-lg-4"></div>
        </div>
    </body>
</html>

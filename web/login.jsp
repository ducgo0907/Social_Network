<%-- 
    Document   : login
    Created on : Oct 8, 2022, 11:55:15 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            <%@include file="../css/login.css" %>
        </style>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <c:if test="${requestScope.message != null}">
        <div class="container nofication alert alert-${requestScope.status}" role="alert">
            ${requestScope.message}
        </div>
    </c:if>
    <body style="background-color: #edf0f5">
        <div class="container">
            <div class="col-lg-8 introduce-web">
                <div class="col-lg-12 logo-text">Social Network</div>
                <div class="col-lg-10 text-introduce">
                    Social Network helps you connect and share with the people in your life.
                </div>
            </div>
            <div class="col-lg-4 table-login">
                <form action="login" method="post" class="form-login">
                    <input type="text" class="form-control" name="email" placeholder="Your email..." /><br/>
                    <input type="password" class="form-control" name="pass" placeholder="password" /><br/>
                    <input type="submit" value="Login" class="btn btn-primary col-lg-12"/>

                </form>
                <a href="#">Forget Password?</a>
                <hr/>
                <br/>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#newAccount">
                    New Account
                </button>
            </div>
        </div>
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="newAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h5 class="modal-title" id="exampleModalLabel">
                            <h2>Sign Up</h2>
                            <div>It's quick and easy</div>
                        </h5>

                    </div>
                    <div class="modal-body">
                        <form action="register" method="post" >
                            <input type="text" name="name" placeholder="User Name..." class="form-control"/><br/>
                            <input type="email" name="email" placeholder="Your email..." class="form-control"/><br/>
                            <input type="password" name="password" placeholder="Password..." class="form-control"/><br/>
                            <input type="submit" value="Sign Up" class="btn btn-success"/><br/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="layouts/footer.jsp"/>
    </body>
</html>

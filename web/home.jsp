<%-- 
    Document   : index
    Created on : Sep 20, 2022, 12:07:31 PM
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
        <jsp:include page="layouts/header.jsp" />
        <div class="row" id="wrap-all">
            <div class="col-lg-2">
                <jsp:include page="layouts/bar-left.jsp" />
            </div>
            <div class="col-lg-8 page-content">
                <h1>Hello ${sessionScope.account.name}</h1>
                <div class="row">
                    <div>
                        <jsp:include page="posts/new.jsp"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <br/>
                        <jsp:include page="posts/list.jsp"/>
                    </div>
                    <div class="col-lg-2">

                    </div>
                </div>
            </div>
            <div class="col-lg-2">
                <jsp:include page="layouts/bar-right.jsp"/>
            </div>
        </div>
        <script type="text/javascript">
            if(localStorage.getItem("sortType") === 'mostlike'){
                document.getElementById('optionMostLike').selected = true;
            }
            function changeOption(e) {
                localStorage.setItem("sortType", e.value);
                window.location = "home?sort=" + e.value;
            }
        </script>
    </body>
</html>

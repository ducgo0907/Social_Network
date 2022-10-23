<%-- 
    Document   : new
    Created on : Oct 9, 2022, 9:56:49 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-lg-2"></div>
<div class="col-lg-8">
    <form action="new_post" method="get">
        <input 
            type="text" name="content" 
            placeholder="${sessionScope.account.name}, what are you thinking..."
            class="form-control" /> 
        <input type="submit" value="Post" class="btn btn-primary" id="post-button" />
    </form>
</div>
<div class="col-lg-2"></div>


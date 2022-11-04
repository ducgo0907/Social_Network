<%-- 
    Document   : search
    Created on : Oct 31, 2022, 1:09:49 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="layouts/header.jsp" %>
<div class="container">
    <c:if test="${requestScope.listUser.size() > 0}">
        <h2 style="margin: 100px 0px 0px 0px"> Have ${requestScope.listUser.size()} result: </h2>
    </c:if>
    <div class="row" id="search-wrap">
        <c:forEach items="${requestScope.listUser}" var="user">
            <a href="profile?id=${user.getUserId()}">
                <div class="col-lg-12 user-profile-wrap">
                    <div class="col-lg-2">
                        <c:if test="${user.avatarPath == null}">
                            <img src="${pageContext.request.contextPath}/images/default_image.png" class="avatar-search"/>
                        </c:if>
                        <c:if test="${user.avatarPath != null}">
                            <img src="${pageContext.request.contextPath}/${user.getAvatarPath()}" class="avatar-search"/>
                        </c:if>
                    </div>
                    <div>${user.getName()}</div>
                </div>
            </a>
        </c:forEach>
    </div>
</div>
<div class="row">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8 page-content">
                <br/>
                <jsp:include page="posts/list.jsp"/>
            </div>
            <div class="col-lg-2"></div>
        </div>
    </div>
    <div class="col-lg-2"></div>
</div>


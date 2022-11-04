<%-- 
    Document   : profile
    Created on : Oct 9, 2022, 8:20:56 AM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layouts/header.jsp" %>
<div class="container profile-page">
    <div class="row" id="profile-wrap">
        <div class="col-lg-2">
            <img src="${requestScope.user.getAvatarPath()}" class="avatar-profile"/>
        </div>
        <div class="col-lg-1">
            <div class="row" id="profile-text-wrap">
                <h1 class="col-lg-12 profile-text">
                    ${requestScope.user.getName()}
                </h1>
                <h3 class="col-lg-12 profile-text">
                    Friends
                </h3>
            </div>
        </div>
        <div class="col-lg-9">
            <c:if test="${sessionScope.account.getUserId() != requestScope.user.getUserId()}">
                <div id="button-wrap">
                    <c:if test="${requestScope.status == null}">
                        <form action="addfriend" method="post">
                            <input type="hidden" name="userRequestId" value="${sessionScope.account.getUserId()}"/>
                            <input type="hidden" name="userBeRequestId" value="${requestScope.user.getUserId()}"/>
                            <input 
                                type="submit" 
                                id="add-friends-button" 
                                class="btn btn-primary" 
                                value="Add Friend"
                                />
                        </form>
                    </c:if>
                    <c:if test="${requestScope.status != null}">
                        <input 
                            type="submit" 
                            id="add-friends-button" 
                            class="btn btn-primary" 
                            value="${requestScope.status == 'accepted' ?  'Friend' : 'Requested'}"
                            />
                    </c:if>
                        <a href="message?id=${requestScope.user.getUserId()}">
                        <button id="messages-button" class="btn btn-secondary">
                            Message
                        </button>
                    </a>
                </div>
            </c:if>
        </div>
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
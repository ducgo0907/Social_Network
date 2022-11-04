<%-- 
    Document   : message
    Created on : Nov 1, 2022, 9:23:18 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layouts/header.jsp"/>
<div class="container space-header">
    <div class="row">
        <div class="col-lg-9">
            <div class="col-lg-12" id="chat-box-header">
                <div class="col-lg-1">
                    <img src="${requestScope.userMessage.getAvatarPath()}" id="avatar-chat" />
                </div>
                <div class="col-lg-8">
                    <div id="name-message">
                        <h3>${requestScope.userMessage.getName()}</h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-12" id="chat-box">
                <div class="messages">
                    <c:forEach items="${requestScope.listMessage}" var="message">
                        <c:if test="${message.getUserSendId() == sessionScope.account.getUserId()}">
                            <div class="send-message">
                                <span class="send-text">${message.getContent()}</span>
                            </div>
                        </c:if> 
                        <c:if test="${message.getUserSendId() != sessionScope.account.getUserId()}">
                            <div class="receive-message">
                                <span class="receive-text">${message.getContent()}</span>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <div class="col-lg-12" id="input-wrap">
                <form action="message" method="post">
                    <div class="row">
                        <div class="col-lg-11">
                            <input type="hidden" name="id" value="${requestScope.userMessage.getUserId()}"/>
                            <input type="text" class="form-control" name="content"/>
                        </div>
                        <input type="submit" value="Send" class="btn btn-primary"/>
                    </div>
                </form>
            </div>

        </div>
        <div class="col-lg-3">
            <div class="row" id="user-message-wrap">
                <div class="col-lg-12" id="image-avatar">
                    <img src="${requestScope.userMessage.getAvatarPath()}" id="avatar-user-details"/>
                </div>
                <div class="col-lg-12" id="text-avatar">
                    ${requestScope.userMessage.getName()}
                </div>
                <div class="col-lg-12" id="user-details-button">
                    <div class="col-lg-4">
                        <a href="profile?id=${requestScope.userMessage.getUserId()}">Profile</a>
                    </div>
                    <div class="col-lg-4">
                        <a>Block</a>
                    </div>
                    <div class="col-lg-4">
                        <a>
                            Find
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

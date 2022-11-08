<%-- 
    Document   : bar_left_group
    Created on : Nov 8, 2022, 8:53:37 AM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-2 ">
    <div class="row sticky" id="bar-left-group">
        <div class="col-lg-12">
            <div class="row" id="group-header-bar">
                <div class="col-lg-3">
                    <img src="${requestScope.group.avtarGroupPath}" class="group-avatar-bar"/>
                </div>
                <div class="col-lg-9">
                    <span>${requestScope.group.name}</span>
                </div>
            </div>
        </div>
        <c:if test="${requestScope.group.ownerId == sessionScope.account.getUserId()}">
            <h3>Request List: </h3>
            <c:forEach items="${requestScope.group.listRequest}" var="user">
                <div class="col-lg-12 tab-bar-left">
                    <div class="row">
                        <div class="col-lg-3">                        

                            <img src="${user.avatarPath}" class="avatar-request"/>

                        </div>
                        <div class="col-lg-2 text-request">
                            ${user.name}
                        </div>
                        <div class="col-lg-6">
                            <div class="col-lg-12">
                                <form action="responserequest" method="get">
                                    <input type="hidden" name="action" value="accept" />
                                    <input type="hidden" name="groupId" value="${group.groupId}" />
                                    <input type="hidden" name="userId" value="${user.userId}" />
                                    <input type="submit" value="Accept" class="btn btn-primary button-request"/>
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <form action="responserequest" method="get">
                                    <input type="hidden" name="action" value="refuse" />
                                    <input type="hidden" name="groupId" value="${group.groupId}" />
                                    <input type="hidden" name="userId" value="${user.userId}" />
                                    <input type="submit" value="Delete" class="btn btn-secondary button-request"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="col-lg-12" href="showgroup?id=${requestScope.group.groupId}">
                    <div class="tab-bar-left" style="height: 30px">
                        Home
                    </div>
                </a>
                <a class="col-lg-12" href="showgroup?id=${requestScope.group.groupId}&action=view">
                    <div class="tab-bar-left" style="height: 30px">
                        View
                    </div>
                </a>
            </c:forEach>
            <h5>Member List(${requestScope.group.listMember.size()} members):</h5>
            <c:forEach items="${requestScope.group.listMember}" var="user">
                <div class="col-lg-12 tab-bar-left">
                    <div class="row">
                        <div class="col-lg-3">                        

                            <img src="${user.avatarPath}" class="avatar-request"/>

                        </div>
                        <div class="col-lg-2 text-request">
                            ${user.name}
                        </div>
                        <div class="col-lg-6">

                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>
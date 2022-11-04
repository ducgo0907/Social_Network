<%-- 
    Document   : list_group
    Created on : Nov 2, 2022, 10:02:10 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./layouts/header.jsp"/>
<div class="container space-header">
    <div class="row">
        <div class="col-lg-10">
            <h2>List Group:</h2>
            <c:forEach items="${requestScope.listGroup}" var="group">
                <a href="showgroup?id=${group.groupId}">
                    <div class="row group-wrap">
                        <div class="col-lg-2">
                            <img src="${group.avtarGroupPath}" class="list-group-avatar"/>
                        </div>
                        <div class="col-lg-4">
                            ${group.name}
                        </div>
                        <c:set var="isRequest" value="0"/>
                        <c:forEach items="${group.listRequest}" var="request">
                            <c:if test="${request.getUserId() == sessionScope.account.getUserId()}">
                                <c:set var="isRequest" value="1" />
                            </c:if>
                        </c:forEach>
                        <c:if test="${isRequest == '1'}">
                            <c:forEach items="${group.listMember}" var="member">
                                <c:if test="${member.getUserId() == sessionScope.account.getUserId()}">
                                    <c:set var="isRequest" value="2" />
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <c:if test="${group.ownerId != sessionScope.account.getUserId()}">
                            <c:if test="${isRequest == '0'}">
                                <div class="col-lg-6">
                                    <form action="joingroup" method="post">
                                        <input type="hidden" name="groupId" value="${group.groupId}"/>
                                        <input 
                                            type="submit"
                                            value="Join"
                                            style="float: right" 
                                            class="btn btn-primary" />
                                    </form>
                                </div>
                            </c:if>
                            <c:if test="${isRequest == '1'}">
                                <div class="col-lg-6">
                                    <input 
                                        type="submit"
                                        value="Requested"
                                        style="float: right" 
                                        class="btn btn-primary" />
                                </div>
                            </c:if>
                            <c:if test="${isRequest == '2'}">
                                <div class="col-lg-6">
                                    <input 
                                        type="submit"
                                        value="Member"
                                        style="float: right" 
                                        class="btn btn-primary" />
                                </div>
                            </c:if>

                        </c:if>

                    </div>
                </a>
            </c:forEach>
        </div>
        <div class="col-lg-2">
            <a href="addgroup">
                <i class="fa fa-plus fa-2x" style="margin-top: 20px">Add</i>
            </a>
        </div>
    </div>
</div>
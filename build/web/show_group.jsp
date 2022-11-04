<%-- 
    Document   : show_group
    Created on : Nov 2, 2022, 10:54:56 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layouts/header.jsp" />
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
            </c:forEach>
            <h3>Member List: </h3>
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
<div class="col-lg-10">

    <div class="container space-header" id="wrap-all">
        <div class="row" id="group-header">
            <div class="col-lg-2">
                <img src="${requestScope.group.avtarGroupPath}" class="group-avatar"/>
            </div>
            <div class="col-lg-6">
                <h1>${requestScope.group.name}</h1>
            </div>
        </div>
        <div class="row" id="post-post">
            <div class="col-lg-3"></div>
            <div class="col-lg-8">
                <form action="new_post" method="post" enctype="multipart/form-data">
                    <div id="new-post">
                        <textarea 
                            placeholder="${sessionScope.account.name}, what are you thinking..."
                            style="width: 550px"
                            id="editor" 
                            name="content"
                            >
                        </textarea>

                        <input type="hidden" value="${requestScope.group.groupId}" name="groupId" />
                        <input type="file" name="image"/>
                        <input type="submit" value="Post" class="btn btn-primary" 
                               id="post-button" 
                               style="float: left"
                               />
                    </div>
                </form>

            </div>
            <div class="col-lg-2"></div>
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
    </div>

</div>

<script>
    CKEDITOR.replace("editor");
    CKEDITOR.instances.editor.destroy();
    $("#new-post").click((e) => {
        e.stopPropagation();
        CKEDITOR.replace("editor");
        CKEDITOR.config.width = '75%'
    });

    $("#wrap-all").click(() => {
        //        CKEDITOR.instances.editor.updateElement();
        CKEDITOR.instances.editor.destroy();
    })

</script>

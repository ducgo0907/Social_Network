<%-- 
    Document   : show_group
    Created on : Nov 2, 2022, 10:54:56 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layouts/header.jsp" />
<jsp:include page="bar_left_group.jsp"/>
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

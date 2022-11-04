<%-- 
    Document   : add_group
    Created on : Nov 2, 2022, 10:10:22 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layouts/header.jsp" />

<div class="container space-header">
    <div class="row">
        <h1>Add your group</h1>
        <form action="addgroup" method="post" enctype="multipart/form-data">
            <div class="col-lg-3">
                <img id="preview" class="avatar-group"/>
            </div>
            <div class="col-lg-6">
                <label>Group Name:</label>
                <input type="text" name="groupName" class="form-control"/>
                <label>Avatar Group:</label>
                <input 
                    type="file" 
                    name="image" 
                    id="image-file"
                    class="form-control"/>
                <br/>
                <input type="submit" value="Create" class="btn btn-primary" />
            </div>
            <div class="col-lg-3"></div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $("#image-file").change((e) => {
        const picturePreview = URL.createObjectURL(e.target.files[0])
        console.log(picturePreview)
        document.getElementById('preview').src = picturePreview;
    })
</script>
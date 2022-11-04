<%-- 
    Document   : new
    Created on : Oct 9, 2022, 9:56:49 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-lg-2"></div>
<div class="col-lg-8">
    <form action="new_post" method="post" enctype="multipart/form-data">
        <div id="new-post">
            <textarea 
                placeholder="${sessionScope.account.name}, what are you thinking..."
                style="width: 650px"
                id="editor" 
                name="content"
                >
            </textarea>

            <input type="file" name="image"/>
            <input type="submit" value="Post" class="btn btn-primary" id="post-button" />
        </div>
    </form>

</div>
<div class="col-lg-2"></div>
<script>
    CKEDITOR.replace("editor");
    CKEDITOR.instances.editor.destroy();
    $("#new-post").click((e) => {
        e.stopPropagation();
        CKEDITOR.replace("editor");
    });

    $("#wrap-all").click(() => {
//        CKEDITOR.instances.editor.updateElement();
        CKEDITOR.instances.editor.destroy();
    })

    const test2 = () => {

    }
</script>

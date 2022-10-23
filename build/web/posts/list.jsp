<%-- 
    Document   : list
    Created on : Oct 19, 2022, 11:17:08 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    const handleDelete = () => {
        console.log("Hi")
    }
</script>
<div>
    <c:forEach items="${requestScope.listPost}" var="post">
        <div class="post">
            <br/>
            <div class="profile-post">
                <div class="row">
                    <div class="avatar col-lg-2"></div>
                    <div class="col-lg-9 name-user">
                        <div>
                            ${post.user.getName()}
                        </div>
                        <div>${post.getDateCreated()}</div>
                    </div>
                    <a class="col-lg-1" id="delete-btn" onclick="handleDelete()" href="deletepost?post_id=${post.getPostId()}">
                        x
                    </a>
                </div>
            </div>
            <div class="content">
                ${post.content}
            </div>
            <br/>
            <div class="horizontal-line"></div>
            <div class="reaction">
                <div class="col-lg-6 like-btn">Like</div>
                <div class="col-lg-6 comment-btn">Comments</div>
            </div>
            <div class="horizontal-line"></div>
            <div class="comments">
                <div class="comment-details">
                    Comment 1
                </div>
            </div>
        </div>
    </c:forEach>
</div>

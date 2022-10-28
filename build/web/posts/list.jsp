<%-- 
    Document   : list
    Created on : Oct 19, 2022, 11:17:08 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    const handleDeletePost = () => {
        console.log("Hi");
    };
    const handleDeleteComment = () => {

    }
</script>
<div>
    <c:forEach items="${requestScope.listPost}" var="post">
        <div class="post">
            <br/>
            <div class="profile-post">
                <div class="row">
                    <div class="col-lg-2">
                        <img src="${pageContext.request.contextPath}/images/default_image.png" class="avatar" />    
                    </div>
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
                <div class="comment-input">
                    <form action="newcomment" method="get">
                        <br/>
                        <input type="text" name="comment" class="col-lg-10" placeholder="Write comment..."/>
                        <input type="hidden" name="postId" value="${post.getPostId()}" />
                        <input type="submit" class="col-lg-2" value="Submit"/>
                    </form>
                </div>
                <div class="comment-details">
                    <c:forEach items="${post.comments}" var="comment">
                        <div class="row">
                            <div class="col-lg-1">
                                <img src="${pageContext.request.contextPath}/images/default_image.png" class="avatar-comment" />
                            </div>
                            <div class="col-lg-11">
                                <div class="comment-background">
                                    <div class="row">
                                        <div class="col-lg-11">
                                            <div class="comments-name">${comment.getUser().getName()}</div>
                                            <div class="comments-content">${comment.getContent()}</div>
                                        </div>
                                        <div class="col-lg-1">
                                            <a href="deletecomment?id=${comment.getCommentId()}">x</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="space"></div>
            </div>
        </div>
    </c:forEach>
</div>

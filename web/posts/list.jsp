<%-- 
    Document   : list
    Created on : Oct 19, 2022, 11:17:08 PM
    Author     : ngoqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <c:forEach items="${requestScope.listPost}" var="post">
        <div class="post">
            <br/>
            <div class="profile-post">
                <div class="row">
                    <div class="col-lg-2">
                        <c:if test="${post.getUser().getAvatarPath() != null}">
                            <img src="${post.getUser().getAvatarPath()}" class="avatar"/>
                        </c:if>
                        <c:if test="${post.getUser().getAvatarPath() == null}">
                            <img src="${pageContext.request.contextPath}/images/default_image.png" class="avatar" />
                        </c:if>
                    </div>
                    <div class="col-lg-9 name-user">
                        <div>
                            <a href="profile?id=${post.user.getUserId()}">${post.user.getName()}</a>
                        </div>
                        <div>${post.getDateCreated()}</div>
                    </div>
                    <div class="col-lg-1">
                        <div class="dropdown dropdown-comment">
                            <button class="btn btn-secondary dropdown-toggle btn-more-post" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ...
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <div class="dropdown-item edit-button btn-link" onclick="editPost(${post.postId})">
                                    Edit
                                </div>
                                <br/>
                                <form action="deletepost" method="post">
                                    <input type="hidden" name="post_id" value="${post.getPostId()}"/>
                                    <input type="submit" value="Delete" class="btn-link" />
                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="content">
                <div id="post-${post.postId}">
                    <div class="post-text">
                        ${post.content}
                    </div>
                    <c:if test="${post.imagePath != null}">
                        <img src="${pageContext.request.contextPath}/${post.imagePath}" class="image-post"/>
                    </c:if>
                </div>
                <div id="post-edit${post.postId}" class="post-edit" style="display: none">
                    <div class="row">
                        <form action="editpost" method="post">
                            <div class="">
                                <textarea 
                                    name="content-edit" 
                                    class="col-lg-10" 
                                    id="editor${post.postId}"
                                    >    
                                    ${post.getContent()}
                                </textarea>
                                <input type="hidden" name="postId" value="${post.postId}" />
                                <br/>
                                <input type="submit" value="Change" class="col-lg-2" />
                            </div>

                        </form>
                    </div>
                </div>
            </div>
            <br/>
            <div class="like-amount">
                <c:if test="${post.getLikeAmout() > 1}">
                    ${post.userLike.get(post.userLike.size() - 1).getName()} and ${post.userLike.size() - 1} people liked 
                </c:if>
                <c:if test="${post.getLikeAmout() == 1}">
                    ${post.userLike.get(post.userLike.size() - 1).getName()} liked 
                </c:if>
            </div>
            <div class="horizontal-line"></div>
            <div class="reaction">
                <div class="col-lg-6 like-btn">
                    <form action="like" method="post">
                        <input type="hidden" value="${sessionScope.account.getUserId()}" name="userId" />
                        <input type="hidden" value="${post.getPostId()}" name="postId" />
                        <%--<c:set var="isLiked" value="false"/>--%>
                        <c:set var="isLiked" value="false" />
                        <c:forEach items="${post.userLike}" var="userLike">
                            <c:if test="${userLike.getUserId() == sessionScope.account.getUserId()}">
                                <c:set value="true" var="isLiked"/>
                            </c:if>
                            <c:if test="${!isLiked && userLike.getUserId() != sessionScope.account.getUserId()}">
                                <c:set value="false" var="isLiked"/>
                            </c:if>
                        </c:forEach>
                        <c:if test="${isLiked}">
                            <input type="submit" value="Like" class="liked-btn btn"/>
                        </c:if>
                        <c:if test="${!isLiked}">
                            <input type="submit" value="Like" class="like-btn btn btn-default"/>
                        </c:if>
                    </form>
                </div>
                <div class="col-lg-6 comment-btn">Comments</div>
            </div>
            <div class="horizontal-line"></div>
            <div class="comments">
                <div class="comment-input">
                    <form action="newcomment" method="post">
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
                                <c:if test="${comment.getUser().getAvatarPath() != null}">
                                    <img src="${comment.getUser().getAvatarPath()}" class="avatar-comment"/>
                                </c:if>
                                <c:if test="${comment.getUser().getAvatarPath() == null}">
                                    <img src="${pageContext.request.contextPath}/images/default_image.png" class="avatar-comment" />
                                </c:if>

                            </div>
                            <div 
                                class="col-lg-10 edit-input" 
                                id="edit-comment${comment.getCommentId()}" 
                                style="display: none">
                                <form action="editcomment" method="post">
                                    <div class="row">
                                        <input 
                                            type="text" 
                                            name="edit-comment"
                                            class="col-lg-8"
                                            value="${comment.getContent()}"
                                            />
                                        <input type="hidden" name="commentId" value="${comment.getCommentId()}" />

                                        <input type="submit" value="Send" class="col-lg-2"/>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-11" id="comment-${comment.getCommentId()}">
                                <div class="comment-background">
                                    <div class="row">
                                        <div class="col-lg-11">
                                            <div>
                                                <div class="comments-name">${comment.getUser().getName()}</div>
                                                <div class="comments-content">${comment.getContent()}</div>
                                            </div>
                                        </div>
                                        <div class="col-lg-1">
                                            <div class="dropdown dropdown-comment">
                                                <button class="btn btn-secondary dropdown-toggle btn-more" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    ...
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <button 
                                                        class="dropdown-item btn-link"
                                                        onclick="editComment(${comment.getCommentId()})"
                                                        >
                                                        Edit
                                                    </button>
                                                    <br/>
                                                    <a 
                                                        href="deletecomment?id=${comment.getCommentId()}"
                                                        style="margin-left: 7px"
                                                        >
                                                        Delete
                                                    </a>
                                                </div>
                                            </div>
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
<script type="text/javascript">
    const editComment = (id) => {
        var edit_comment = document.getElementById("edit-comment" + id);
        var comment = document.getElementById('comment-' + id);
        comment.style.display = "none";
        edit_comment.style.display = "block";
    };
    const editPost = (postId) => {
        var edit_post = document.getElementById('post-edit' + postId);
        var post = document.getElementById('post-' + postId);
        edit_post.style.display = "block";
        post.style.display = "none";
        CKEDITOR.replace('editor' + postId);
        CKEDITOR.config.width = '90%';
    };
</script>

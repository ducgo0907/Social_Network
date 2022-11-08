<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="bar sticky">
    <h2>Friend Requests</h2>
    <div class="row">
        <c:if test="${requestScope.listRequest == null || requestScope.listRequest.size() <= 0}">
            <div style="margin-left: 30px;">Don't have any friend request</div>
        </c:if>
        <c:forEach items="${requestScope.listRequest}" var="request">
            <a href="profile?id=${request.getUserRequest().getUserId()}">
                <div class="col-lg-12 tab-bar-left">
                    <div class="row">
                        <div class="col-lg-3">                        
                            <c:if test="${request.getUserRequest().getAvatarPath() != null}">
                                <img src="${request.getUserRequest().getAvatarPath()}" class="avatar-request"/>
                            </c:if>
                            <c:if test="${request.getUserRequest().getAvatarPath() == null}">
                                <img src="${pageContext.request.contextPath}/images/default_image.png" class="avatar-request"/>
                            </c:if>
                        </div>
                        <div class="col-lg-2 text-request">
                            ${request.getUserRequest().getName()}
                        </div>
                        <div class="col-lg-6">
                            <div class="col-lg-12">
                                <form action="accept" method="post">
                                    <input type="hidden" name="userRequestId" value="${request.getUserRequest().getUserId()}" />
                                    <input type="hidden" name="userBeRequestId" value="${request.getUserBeRequest().getUserId()}" />
                                    <input type="submit" value="Accept" class="btn btn-primary button-request"/>
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <form action="refuse" method="post">
                                    <input type="hidden" name="userRequestId" value="${request.getUserRequest().getUserId()}" />
                                    <input type="hidden" name="userBeRequestId" value="${request.getUserBeRequest().getUserId()}" />
                                    <input type="submit" value="Delete" class="btn btn-secondary button-request"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
    <h1>Friends</h1>
    <input oninput="searchByName(this)" type="text" name="searchValue" class="form-control" placeholder="Search friends..."/>
    <div class="row" id="list-friend-wrap">
        <c:forEach items="${requestScope.listFriends}" var="friend">
            <c:if test="${friend.getUserRequest().getUserId() == sessionScope.account.getUserId()}">
                <c:set var="f" value="${friend.getUserBeRequest()}"  /> 
            </c:if>
            <c:if test="${friend.getUserRequest().getUserId() != sessionScope.account.getUserId()}">
                <c:set var="f" value="${friend.getUserRequest()}"  /> 
            </c:if>
            <a href="profile?id=${f.getUserId()}">
                <div class="col-lg-12 tab-bar-left">
                    <div class="row">
                        <div class="col-lg-3">                        
                            <c:if test="${f.getAvatarPath() != null}">
                                <img src="${f.getAvatarPath()}" class="avatar-request"/>
                            </c:if>
                            <c:if test="${f.getAvatarPath() == null}">
                                <img src="${pageContext.request.contextPath}/images/default_image.png" class="avatar-request"/>
                            </c:if>
                        </div>
                        <div class="col-lg-2 text-request">
                            ${f.getName()}
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
</div>
<script>
    function searchByName(param) {
        var nameSearch = param.value;
        $.ajax({
            url: "/socialnetwork/searchfriend",
            type: "get",
            data: {
                searchValue: nameSearch,
            },
            success: function (data) {
                var row = document.getElementById('list-friend-wrap');
                row.innerHTML = data;
            },
            error: function (jqXHR) {
                console.log(jqXHR)
            }
        });
    }
</script>
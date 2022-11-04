<div class="bar sticky">
    <div class="row">
        <a href="profile?id=${sessionScope.account.getUserId()}">
            <div class="col-lg-12 tab-bar-left">
                <div class="col-lg-2">
                    <img src="${sessionScope.account.getAvatarPath()}" class="my-avatar"/>
                </div>
                <div class="col-lg-4">
                    <h3 id="name-text">${sessionScope.account.getName()}</h3>
                </div>
            </div>
        </a>
        <div class="col-lg-12 tab-bar-left">
            <div class="col-lg-2">
                <img src="${pageContext.request.contextPath}/images/2583035.png" class="icon"/>
            </div>
            <div class="col-lg-6">
                <h3>Friends</h3>
            </div>
        </div>
        <div class="col-lg-12 tab-bar-left">
            <div class="col-lg-2">
                <img src="${pageContext.request.contextPath}/images/group-icon.png" class="icon"/>
            </div>
            <a href="listgroup">
                <div class="col-lg-6">
                    <h3>Group</h3>
                </div>
            </a>
        </div>
    </div>
</div>
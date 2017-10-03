<!-- IF isValid -->
    <div class="top-tool-box hidden">
        <a href="" class='need-more-share2'
            data-shareUrl='{redirect_url}'
            title="Share"
        >
            <i class="i-share icon-share" aria-hidden="true"></i>
        </a>

        <a component="post/bookmark" style="color: inherit; text-decoration: none;" title="Mark">
            <i class="i-bookmark icon-bookmark"></i>
        </a>
        <a component="post/upvote" style="color: inherit; text-decoration: none; margin-right: 5px;" title="Upvote">
            <i class="i-upvote icon-thumbs-up-alt"></i>
            <span class="upvote-count">
            </span>
        </a>
    </div>
    <!-- IF atTop -->
        <div class="topic-profile-pic user first-image">

            <!-- IF !isLoggedIn -->
                <img src="https://1.gravatar.com/avatar/177d180983be7a2c95a4dbe7451abeba?s=95&d=&r=PG" class="profile-image" />
            <!-- ELSE -->
                <!-- IF user.picture -->
                <img data-uid="{user.uid}" src="{user.picture}" class="profile-image" title="{user.username}" />
                <!-- ELSE -->
                <div class="profile-image" style="background-color: {user.icon:bgColor};" title="{user.username}">{user.icon:text}</div>
                <!-- ENDIF user.picture -->
            <!-- ENDIF !isLoggedIn -->
        </div>

        <form action="{relative_path}/comments/reply" class="clearfix" method="post">
            <textarea id="nodebb-content" class="form-control" name="content" placeholder="Join the conversation" rows="1"></textarea>
        <!-- IF isLoggedIn -->
            <button class="btn btn-primary">Post a Reply</button>
            <input type="hidden" name="_csrf" value="{token}" />
            <input type="hidden" name="tid" value="{tid}" />
            <input type="hidden" name="url" value="{redirect_url}" />
        </form>
        <br />
        <!-- ELSE -->
        </form>
        <button class="btn btn-primary" id="nodebb-register">Register</button>
        <button class="btn btn-primary" id="nodebb-login">Login</button>

        <!-- This button is here just for making the css margin right -->
        <button style="visibility: hidden; padding-top: 8px;"> </button>

        <!-- ENDIF isLoggedIn -->
    <!-- ENDIF atTop -->

    <ul id="nodebb-comments-list" data-mainpid="{mainPost.pid}">
        <!-- BEGIN posts -->
        <li <!-- IF pagination --> class="nodebb-post-fadein" <!-- ENDIF pagination --> <!-- IF !posts.index --> class="nodebb-post-fadein" <!-- ENDIF !posts.index --> >
            <div class="topic-item" data-pid="{posts.pid}" data-userslug="{user.userslug}" data-uid="{posts.uid}">
                <div class="topic-body">
                    <div class="topic-profile-pic">
                        <a href="{relative_path}/user/{user.userslug}">
                            <!-- IF user.picture -->
                            <img src="{user.picture}" alt="{user.username}" class="profile-image" title="{user.username}">
                            <!-- ELSE -->
                            <div class="profile-image" style="background-color: {user.icon:bgColor}" title="{user.username}" alt="{user.username}">{user.icon:text}</div>
                            <!-- ENDIF user.picture -->
                        </a>
                    </div>
                    <div class="topic-text">
                        <div class="post-content" itemprop="text">
                            <small>
                                <div class="dropdown post-tools">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                        <i class="ur-icon-more"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        <!-- IF !posts.selfPost -->
                                        <li>
                                            <a component="post/flag">
                                                Report
                                            </a>
                                        </li>
                                        <!-- ELSE -->
                                        <li>
                                            <a component="post/purge">
                                                Edit
                                            </a>
                                        </li>
                                        <li>
                                            <a component="post/purge">
                                                Delete
                                            </a>
                                        </li>
                                        <!-- ENDIF !posts.selfPost -->
                                        <!--<li>-->
                                            <!--<a component="post/quote">-->
                                                <!--<i class="icon-quote-right"></i> Quote-->
                                            <!--</a>-->
                                        <!--</li>-->
                                        <!--<li>-->
                                            <!--<a component="post/bookmark" data-bookmarked="{posts.bookmarked}">-->
                                                <!--<i class="i-bookmark &lt;!&ndash; IF posts.bookmarked &ndash;&gt; icon-bookmark &lt;!&ndash; ELSE &ndash;&gt; icon-bookmark-empty &lt;!&ndash; ENDIF posts.bookmarked &ndash;&gt;"></i>-->
                                                <!--Mark-->
                                            <!--</a>-->
                                        <!--</li>-->
                                        <!--<li>-->
                                            <!--<a component="post/upvote" data-upvoted="{posts.upvoted}" date-votes="{posts.votes}">-->
                                                <!--<i class="i-upvote &lt;!&ndash; IF posts.upvoted &ndash;&gt; icon-thumbs-up-alt &lt;!&ndash; ELSE &ndash;&gt; icon-thumbs-up &lt;!&ndash; ENDIF posts.upvoted &ndash;&gt;"></i>-->
                                                <!--Upvote-->
                                                <!--<span class="badge badge-default pull-right upvote-count &lt;!&ndash; IF !posts.votes &ndash;&gt; hidden &lt;!&ndash; ENDIF !posts.votes &ndash;&gt;">-->
                                                    <!--{posts.votes}-->
                                                <!--</span>-->
                                            <!--</a>-->
                                        <!--</li>-->
                                    </ul>
                                </div>

                                <a href="{relative_path}/user/{user.userslug}"><strong>{user.username}</strong></a>
                                <span title="{posts.timestampISO}" class="date-created">{posts.timestamp}</span>
                                <!-- IF posts.isReply -->
                                <!-- IF !posts.deletedReply -->
                                    <button component="post/parent" class="reply-label no-select" data-topid="{posts.toPid}">
                                        <i class="icon-reply"></i> @{posts.parentUsername}
                                    </button>
                                <!-- ENDIF !posts.deletedReply -->
                                <!-- ENDIF posts.isReply -->
                            </small>
                            <br />
                            <div class="post-body">{posts.content}</div>
                            <a href class="reply-button" component="post/reply">
                                Reply
                            </a>
                        </div>
                    </div>
                </div>

                <form action="{relative_path}/comments/reply" method="post" class="sub-reply-input hidden">
                    <textarea id="nodebb-content" class="form-control" name="content" placeholder="Join the conversation" rows="1"></textarea>
                    <button class="btn btn-primary">Post a reply</button>
                    <input type="hidden" name="_csrf" value="{token}" />
                    <input type="hidden" name="tid" value="{tid}" />
                    <input type="hidden" name="toPid" value="{posts.pid}" />
                    <input type="hidden" name="url" value="{redirect_url}" />
                </form>
            </div>
        </li>
        <!-- END posts -->
    </ul>

    <!-- IF atBottom -->
        <div class="topic-profile-pic user">
            <!-- IF isLoggedIn -->
            <img src="{user.picture}" class="profile-image" />
            <!-- ELSE -->
            <img src="http://1.gravatar.com/avatar/177d180983be7a2c95a4dbe7451abeba?s=95&d=&r=PG" class="profile-image" />
            <!-- ENDIF isLoggedIn -->
        </div>
        <form action="{relative_path}/comments/reply" method="post">
            <textarea id="nodebb-content" class="form-control" name="content" placeholder="Join the conversation" rows="3"></textarea>
        <!-- IF isLoggedIn -->
            <small>Signed in as <strong>{user.username}</strong>. <strong id="nodebb-error"></strong></small>
            <button class="btn btn-primary">Post a Reply</button>
            <input type="hidden" name="_csrf" value="{token}" />
            <input type="hidden" name="tid" value="{tid}" />
            <input type="hidden" name="url" value="{redirect_url}" />
        </form>
        <!-- ELSE -->
        </form>
        <button class="btn btn-primary" id="nodebb-register">Register</button>
        <button class="btn btn-primary" id="nodebb-login">Login</button>

        <!-- This button is here just for making the css margin right -->
        <button style="visibility: hidden; padding-top: 8px;"> </button>

        <!-- ENDIF isLoggedIn -->
    <!-- ENDIF atBottom -->

    <button class="btn btn-primary" <!-- IF !posts.length -->style="display: none"<!-- ENDIF !posts.length --> id="nodebb-load-more">Load more comments...</button>
<!-- ELSE -->
    {siteTitle} Commenting has been disabled.
    <!-- IF isAdmin -->
    <form action="{relative_path}/comments/publish" method="post">
        <button class="btn btn-primary">Publish this article to {siteTitle}</button>
        <input type="hidden" name="markdown" id="nodebb-content-markdown" />
        <input type="hidden" name="title" id="nodebb-content-title" />
        <input type="hidden" name="cid" id="nodebb-content-cid" />
        <input type="hidden" name="blogger" id="nodebb-content-blogger" />
        <input type="hidden" name="tags" id="nodebb-content-tags" />
        <input type="hidden" name="id" value="{article_id}" />
        <input type="hidden" name="url" value="{redirect_url}" />
        <input type="hidden" name="_csrf" value="{token}" />
    </form>
    <!-- ENDIF isAdmin -->
<!-- ENDIF isValid -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cyl27
  Date: 2020/2/11
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${requestScope.ContextPath}/css/user/myInformation.css">

</head>
<body>
<div class="container member-home" ref="body" data-sp="0">
    <div class="layout-article" ref="comMain" data-sp="0.6">
        <div class="container member-page">
            <div class="frame-l-r clearfix">

                <div class="left">
                    <div class="com-member-user-info" data-sp="0.26">
                        <div class="img-w">

                            <c:if test="${empty user.avatar}">
                                <img src="https://avatar-user.mucang.cn/user-avatar/2018/07/31/15/6f6ffe1a4ef5498ca8b303ce0c0c78eb.jpeg">
                            </c:if>
                            <c:if test="${not empty user.avatar}">
                                <img src= "${user.avatar}">

                            </c:if>


                        </div>
                        <p class="name">
                            <c:if test="${empty user.name}">
                                未登录
                            </c:if>
                            <c:if test="${not empty user.name}">
                                ${user.name}
                            </c:if>

                        </p>
                        <br>
                        <c:if test="${not empty user.name}">
                            <p class="name">
                                <a href="/user/replaceAvatar" target="iframe2">更换头像</a>
                            </p>

                            <p class="name">
                                <a href="/user/changePasssword1" target="iframe2">修改密码</a>
                            </p>
                        </c:if>

                    </div>
                    <%--<div class="com-member-user-related-info" data-sp="0.27">--%>
                    <%--<div class="tab-bar">--%>
                    <%--<ul class="clearfix">--%>
                    <%--<li class="item active" ref="fans"><a>我关注的人</a></li>--%>
                    <%--<li class="fgx"></li>--%>
                    <%--<li class="item " ref="hisFans"><a>我的粉丝</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--<div class="related-content clearfix show">--%>
                    <%--<div class="empty-data"></div>--%>
                    <%--<p class="tip-text">暂无关注</p></div>--%>
                    <%--<div class="related-content clearfix hide">--%>
                    <%--<div class="empty-data"></div>--%>
                    <%--<p class="tip-text">暂无粉丝</p></div>--%>
                    <%--</div>--%>
                </div>

                <c:if test="${not empty user.name}">
                    <%--我的信息-科目一--%>
                    <div class="right">
                        <div class="com-member-tiku-statis com-user-page-part" data-sp="0.30">

                            <div class="part-title clearfix">
                                <p class="title-text left">我的题库
                                    <span class="small">(小车)</span>
                                </p>
                                <div class="tab left">
                                    <span class="left" data-course="kemu1" ref="course">科目一</span>
                                    <span class="left ">最优成绩为: <span>${score1}</span></span>
                                </div>
                            </div>

                            <div class="statis-content">
                                <div class="com-mnks-course-statis com-part block-static" data-sp="0.30.0">
                                    <div class="content-wapper cl">
                                        <div id="holder" class="s-circle fl">
                                            <label>${titleCarFirstCount}</label><i></i>
                                        </div>
                                        <div class="s-info fl">
                                            <p class="p1 cl">
                                                <span class="i0 ii"></span>
                                                <span class="n1">做对${userCar1RightCount}题</span>
                                                <span class="n2">占比${rightRate1}%</span>
                                            </p>
                                            <p class="p2 cl">
                                                <span class="i1 ii"></span>
                                                <span class="n1">做错${userCar1WrongCount}题</span>
                                                <span class="n2">占比${wrongRate1}%</span>
                                                <a data-action="login_url" target="iframe2"
                                                   href="/title/carWrong?class1=科目一">查看</a>
                                            </p>
                                            <p class="p3 cl"><span class="i2 ii">

                                            </span>
                                                <span class="n1">未做${weizuo1}题</span>
                                                <span class="n2">占比${weizuoRate1}%</span>
                                                <a target="iframe2" href="/title/carFirstSx">继续做题</a>
                                            </p>
                                        </div>
                                        <div class="s-link fr cl">
                                            <a class="favor fl" data-action="login_url" target="iframe2" rel="nofollow"
                                               href="/title/scCar1">我的收藏</a>
                                                <%--<a class="record fl" data-action="login_url" target="iframe2" rel="nofollow"--%>
                                                <%--href="#">考试记录</a>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="loading "></div>
                            </div>

                        </div>
                    </div>
                    <%--我的信息-科目四--%>
                    <div class="right">
                        <div class="com-member-tiku-statis com-user-page-part" data-sp="0.30">

                            <div class="part-title clearfix">
                                <p class="title-text left">我的题库
                                    <span class="small">(小车)</span>
                                </p>
                                <div class="tab left">
                                    <span class="left " data-course="kemu4">科目四</span>
                                    <span class="left ">最优成绩为: <span>${score4}</span></span>
                                </div>

                            </div>

                            <div class="statis-content">
                                <div class="com-mnks-course-statis com-part block-static" data-sp="0.30.0">
                                    <div class="content-wapper cl">
                                        <div id="holder4" class="s-circle fl">
                                            <label>${titleCarFourthCount}</label><i></i>
                                        </div>
                                        <div class="s-info fl"><p class="p1 cl"><span class="i0 ii">

                                        </span>
                                            <span class="n1">做对${userCar4RightCount}题</span>
                                            <span class="n2">占比${rightRate4}%</span>
                                        </p>
                                            <p class="p2 cl">
                                                <span class="i1 ii"></span>
                                                <span class="n1">做错${userCar4WrongCount}题</span>
                                                <span class="n2">占比${wrongRate4}%</span>
                                                <a data-action="login_url" target="iframe2"
                                                   href="/title/carWrong?class1=科目四">查看</a>
                                            </p>
                                            <p class="p3 cl"><span class="i2 ii"></span>
                                                <span class="n1">未做${weizuo4}题</span>
                                                <span class="n2">占比${weizuoRate4}%</span>
                                                <a arget="iframe2" href="/title/carFourthSx">继续做题</a>
                                            </p>
                                        </div>
                                        <div class="s-link fr cl">
                                            <a class="favor fl" data-action="login_url" target="iframe2" rel="nofollow"
                                               href="/title/scCar4">我的收藏</a>
                                                <%--<a class="record fl" data-action="login_url" target="iframe2" rel="nofollow"--%>
                                                <%--href="#">考试记录</a>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="loading "></div>
                            </div>

                        </div>
                    </div>
                </c:if>


            </div>
        </div>

    </div>

</div>


</body>
</html>

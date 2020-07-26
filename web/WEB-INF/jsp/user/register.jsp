<%--
  Created by IntelliJ IDEA.
  User: cyl
  Date: 2019/12/17
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册新用户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link type="text/css" rel="stylesheet" href="${requestScope.ContextPath}/css/css_v1.css?v=0.03"/>
    <link type="text/css" rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="${requestScope.ContextPath}/css/popwindows.css"/>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/jquery-eiui.js?1576548092" lang="javascript"></script>
    <script src="${requestScope.ContextPath}/js/jquery.placeholder.js" lang="javascript"></script>
    <script src="${requestScope.ContextPath}/gt3sdk/static/gt.js"></script>
    <script src="${requestScope.ContextPath}/js/yzm.js"></script>
    <script src="${requestScope.ContextPath}/js/user/register.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery-2.1.1/jquery.min.js"></script>
</head>
<body>
<div class="head">
    <div class="main">
        <img class="fl" src="${requestScope.ContextPath}/img/login/logo.png" height="45"/>
        <p class="fr">您好，欢迎光临作业车间系统！<a href="/user/login" style="color:#e9474d;">请登录</a></p>
    </div>
</div>

<div class="login—v1" style="background-image: url('${requestScope.ContextPath}/img/pc/login_left.jpg')">
    <article class="content clrfix">
        <blockquote class="login-form">
            <div class="form clrfix">
                <header class="tab-box">
                    <aside class="reg-tab">快速注册</aside>
                    <div>已注册可直接<a href="/user/login">登录</a></div>
                </header>
                <form method="post">
                    <article id="form" class="login-con">
                        <blockquote id="regForm" class="reg-box">


                            <div class="pad10B pad30RL">
                                <div class="input-item clrfix">
                                    <div class="input-box">
                                        <input name="name" id="name" type="text" onkeydown="KeyDown()"
                                               autocomplete="off"
                                               class="inputNumber AppCheck nocheck data" placeholder="请输入姓名">
                                        <div class="jyts-err">
                                            <div><span class="username-err"></span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="pad10B pad30RL">
                                <div class="input-item clrfix">
                                    <div class="input-box">
                                        <input id="password" name="password" type="password" onkeydown="KeyDown()"
                                               autocomplete="off"
                                               class="AppCheck nocheck data" placeholder="请输入密码">
                                        <div class="jyts-err">
                                            <div><span class="password-err"></span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="divUser" style="width: 100%;color: red;font-size:18px;text-align: center">

                            </div>


                            <div class="pad10B pad30RL clrfix codebox">
                                <div class="input-item fl clrfix w-180">
                                    <div class="input-box">
                                        <input name="code" id="code" autocomplete="off" type="text"
                                               onkeydown="KeyDown()"
                                               class="inputNumber AppCheck nocheck data w-120" placeholder="请输入验证码">
                                        <div class="jyts-err">
                                            <div><span class="verifycode-err"></span></div>
                                        </div>
                                    </div>
                                </div>

                            </div>


                            <div style="width: 100%;height: 40px">
                                <div id="GetRegValidateCode" class="fr btn code-btn disable" style="float: left">
                                    <img id="imgObj" alt="验证码" src="/code/getCode">
                                </div>
                                <div>
                                    <input type="button" value="换一张" onclick="changeImg()" style="float: left">
                                </div>
                            </div>

                            <div id="divAll" style="width: 100%;color: red;font-size:18px;text-align: center">

                            </div>


                            <div>
                                <input type="button" class="but" value="立即注册" id="regs" onclick="register()">
                                <%--<div id="reg-btn" class="btn reg-btn disable">立即注册</div>--%>
                            </div>
                        </blockquote>
                    </article>
                </form>
            </div>
        </blockquote>
    </article>
</div>

</body>
</html>

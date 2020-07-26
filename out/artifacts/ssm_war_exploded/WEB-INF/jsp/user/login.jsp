<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">


    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${requestScope.ContextPath}/js/jquery-eiui.js?1576543722" lang="javascript"></script>
    <script src="${requestScope.ContextPath}/js/jquery.placeholder.js" lang="javascript"></script>
    <script src="${requestScope.ContextPath}/gt3sdk/static/gt.js"></script>
    <script src="${requestScope.ContextPath}/js/user/login.js"></script>
    <script src="${requestScope.ContextPath}/js/yzm.js"></script>
    <link type="text/css" rel="stylesheet" href="${requestScope.ContextPath}/css/css_v1.css?v=0.03"/>
    <link type="text/css" rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="${requestScope.ContextPath}/css/popwindows.css"/>


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
                <header class="tab-box clrfix">
                    <aside class="login-tab">快捷登录</aside>
                </header>
                <article class="login-con">
                    <blockquote id="form">
                        <!-- 账号密码登录 -->
                        <form name="ifrm" id="ifrm" method="post">
                            <blockquote id="tab1" class="">

                                <div class="pad10B">
                                    <div class="clrfix">
                                        <div class="input-box">
                                            <input id="name" name="name" type="text" onkeydown="KeyDown()" value=""
                                                   class="inputNumber AppCheck nocheck data" autocomplete="off"
                                                   placeholder="请输入用户名">
                                            <div class="jyts-err">
                                                <div><span class="username-err"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="pad10B">
                                    <div class="input-item clrfix">
                                        <div class="input-box">
                                            <input id="password" name="password" type="password" onkeydown="KeyDown()"
                                                   value=""
                                                   class="AppCheck nocheck data" autocomplete="off" placeholder="请输入密码">
                                        </div>
                                        <div class="jyts-err">
                                            <div><span class="password-err"></span></div>
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
                                    <input type="reset" value="重置">
                                    <input type="button" class="but" id="user-btn1" value="立即登录" onclick="login()">
                                </div>


                            </blockquote>
                        </form>
                        <div class="reg-link">
                            </span><a href="/user/register">免费注册</a>
                        </div>
                    </blockquote>
                </article>
            </div>
        </blockquote>
    </article>
</div>

</body>
</html>

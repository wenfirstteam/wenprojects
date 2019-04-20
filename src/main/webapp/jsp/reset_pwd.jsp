<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="//common-bucket.zhaopin.cn/passport/favicon.ico"  media="screen"/>
    <title>忘记密码 - 汉中人才网</title>
    <style>
        body,div,dl,dt,dd,ul,ol,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,table,th,td{font-family:PingFang SC,Lantinghei SC,Helvetica Neue,Helvetica,Arial,Microsoft YaHei,\\5FAE\8F6F\96C5\9ED1,STHeitiSC-Light,simsun,\\5B8B\4F53,WenQuanYi Zen Hei,WenQuanYi Micro Hei,"sans-serif";margin:0;padding:0; border:0; font-size: 12px;}
        fieldset,img,abbr,acronym{border:none}
        h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:400;}
        em,i{font-style:normal}
        a{text-decoration:none; color:#29a9db;}
        a:link{text-decoration:none;}
        a:visited{text-decoration:none;}
        a:hover{text-decoration:none;}
        a,input:focus{outline:none}
        *{
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .wrap{
            position: relative;
        }

        .header-wrapper{
            border-bottom: 1px solid #E8EAEC;
        }

        .header{
            height: 100px;
            width: 1000px;
            margin: 0 auto;
            position: relative;
        }
        .header .logo{
            height: 100px;
            line-height: 100px;
        }
        .header .logo a{
            display: block;
            width: 128px;
        }
        .header .logo a img{
            vertical-align: middle;
        }
        .header .service-tel{
            position: absolute;
            right: 0;
            top: 42%;
            font-size: 12px;
            color: #666;
        }

        .content{
            padding-bottom: 50px;
        }

        .content .title{
            text-align: center;
            color: #000000;
            font-size: 20px;
            line-height: 90px;
            font-weight: normal;
            letter-spacing: 2px;
        }

        .form-wrapper {
            width: 370px;
            margin: 0 auto;
            color: #000;
        }

        .form-wrapper .ipt-wrapper{
            margin-bottom: 20px;
            display: flex;
            /*font-size:14px;line-height:24px;color:#4a4a4a;*/
            position: relative;
        }

        .form-wrapper .ipt {
            flex: 1;
        }

        .ipt-wrapper .btn-getCode{
            display: inline-block;
            width: 110px;
            line-height: 40px;
            border-left: 1px solid #DCDEE2;

            font-size: 14px;
            color: #1787FB;
            letter-spacing: 0;
            text-align: center;
        }
        .btn-getCode:hover{
            cursor: pointer;
        }



        .form-wrapper label{
            height:40px;
            line-height:40px;
            width:70px;
            text-align:justify;
            display:inline-block;
            overflow:hidden;
            vertical-align:top;
        }

        .form-wrapper .ipt{
            border: 1px solid #ddd;
            padding: 10px;
            height: 20px;
            border-radius: 2px;
        }

        .form-wrapper .code-ipt{
            border: 1px solid #ddd;
            height: 40px;
            display: flex;
            width: 300px;
            flex: 1;
        }

        .code-ipt input {
            border: none;
            flex: 1;
            padding-left: 10px;
        }

        .form-wrapper .confirm-btn{
            width: 300px;
            height: 48px;
            line-height: 48px;
            margin-top: 10px;
            background: #1787FB;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            text-align: center;
            cursor: pointer;
            display: inline-block;
            margin-left: 70px;
        }

        .form-wrapper .confirm-btn:hover{
            cursor: pointer;
        }

        .form .ipt{
            width: 300px;
            height: 40px;
            display: inline-block;
            font-size: 12px;
        }
        .ipt:focus {
            border-color: #1787FB;
        }
        .form-wrapper .line{
            margin-top: 15px;
            text-align: right;
        }

        .message{
            font-size: 12px;
            color: #E95A3F;
            letter-spacing: 0;
            line-height: 12px;
            margin-left: 70px;
        }

        .ipt-icon{
            position: absolute;
            right: 12px;
            top: 12px;
        }
        
        .ipt-warning{
            position: absolute;
            left: 70px;
            bottom: -18px;
            color: #E95A3F;
        }

        @media screen and (max-width: 1000px) {
            .wrap{
                width: 100%;
            }
            .header{
                width: 100%;
            }
        }
        @media screen and (max-width: 480px) {
            .header .logo a{
                display: block;
                width: 100%;
                text-align: center;
            }
            .header .service-tel{
                position: fixed;
                right: 0;
                bottom: 26px;
                font-size: 12px;
                color: #666;
                text-align: center;
                width: 100%;
                top:unset;
            }
            .content .title{
                font-size: 18px;
                height: 50px;
                line-height: 50px;
            }
            .form-wrapper .confirm-btn{
                width: calc(100% - 70px);
            }
        }
        @media screen and (max-width: 370px) {
            .form-wrapper{
                width: 100%;
                padding: 5px;
            }
            .ipt-wrapper .btn-getCode{
                width: unset;
            }
        }
    </style>
</head>
<body>
<div class="wrap">
    <div class="header-wrapper">
        <div class="header">
            <div class="logo">
                <img src="../pic/logo.png" style="width:25.490000000000002%;top:54.02%;height:86.83%;"/>
            </div>
            
        </div>
    </div>
    <div class="content verifiTel">
        <div class="title">找回密码</div>
        <div class="form-wrapper form">
            <form action="/rcw/user/resetPwd.action" method="post" id="verificationOldTel" class="inner_form" data-ts="5xGY" novalidate="novalidate">
                <input type="hidden" id="bkurl" name="bkurl" value="https://i.zhaopin.com/blank?https://www.zhaopin.com/">
                <input type="hidden" id=k name="redirect_uri" value="">

                <div class="ipt-wrapper">
                    <label for="passportName">用 户 名</label>
                    <input class="ipt" id="username" name="username" type="text" placeholder="用户名">
                    <div class="ipt-warning" id="alertMessage_passportName"></div>
                </div>
                <div class="ipt-wrapper">
                    <label for="passportName">邮箱</label>
                    <input class="ipt" id="email" name="email" type="text" placeholder="邮箱">
                    <div class="ipt-warning" id="alertMessage_passportName"></div>
                </div>

			 <div class="ipt-wrapper code-wrapper">
                    <label for="verifiCode">验 证 码</label>
                    <div class="code-ipt">
                        <input class="" id="verifiCode" name="verifiCode" type="text" value="" placeholder="验证码"/>
                        <a href="javascript:;" class="btn btn-getCode" id="sendVerifiCode">获取验证码</a>
                    </div>
                    <div class="ipt-warning" id="alertMessage_verifiCode"></div>
              </div>
                
                <div class="ipt-wrapper">
                    <label for="password">重置密码</label>
                    <input id="password" name="password" type="password" class="ipt" placeholder="新密码"/>
                    <div class="ipt-warning" id="alertMessage_password"></div>
                </div>

                <div class="ipt-wrapper">
                    <label for="passwordConfirm">确认密码</label>
                    <input id="passwordConfirm" type="password" class="ipt" placeholder="确认密码"/>
                    <div class="ipt-warning" id="alertMessage_passwordConfirm"></div>
                </div>

                <div id="alertMessage" class="message"></div>

                <div>
                    <input id="submitbtn" type="submit" class="confirm-btn" value="确认">
                </div>
            </form>
        </div>
    </div></div>
</body>
<script type="text/javascript" src="//common-bucket.zhaopin.cn/passport/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="//common-bucket.zhaopin.cn/passport/js/geetest/gt.js"></script>
<script>
    $(function () {
        $("#verifiCode").bind("focus", function () {
            $(".code-ipt").prop("style", "border-color:#1787FB;");
        })
        $("#verifiCode").bind("blur", function () {
            console.log(this)
            $(".code-ipt").prop("style", "");
        })

        //显示错误提示
        function showErrorMsg ($obj, text) {
            $($obj).addClass('error').html(text).stop(true, true).show().animate({
                opacity : 1,
                right : '0'
            }, 500);
        }

        window.validateMap = {};

        bindValidateEvent();

        function bindValidateEvent() {
            $("#passportName").blur(function () {
                validateMap.passportName = true;
                var passportName = $(this).val($.trim($(this).val())).val();

                if (/^([a-zA-Z]|[0-9])+([\.|\-|\_]([a-zA-Z]|[0-9])+)*@[a-zA-Z0-9]+(\.([a-zA-Z]{2,4})){1,2}$/.test(passportName)) {
                    validateMap.passportName = true;
                    validateMap.passportNameType = "email";
                    showErrorMsg($("#alertMessage_passportName"), "");
                    return;
                }

                if (/^[1][0-9]\d{9}$/.test(passportName)) {
                    validateMap.passportName = true;
                    validateMap.passportNameType = "mobile";
                    showErrorMsg($("#alertMessage_passportName"), "");
                    return;
                }

                validateMap.passportName = false;
                validateMap.passportNameType = "";
                showErrorMsg($("#alertMessage_passportName"), "请输入正确的用户名");
            });

            $("#verifiCode").blur(function() {
                validateMap.verifiCode = false;
                var verifiCode = $(this).val($.trim($(this).val())).val();
                if (verifiCode.length <= 0) {
                    showErrorMsg($("#alertMessage_verifiCode"), "验证码不能为空");
                    return;
                }
                validateMap.verifiCode = true;
                showErrorMsg($("#alertMessage_verifiCode"), "");
            });

            $("#password").blur(function() {
                validateMap.password = false;
                if ($(this).val().length <= 0) {
                    showErrorMsg($("#alertMessage_password"), "密码不能为空");
                    return;
                }
                if (!/^(?![0-9_]+$)(?![a-zA-Z_]+$)[0-9a-zA-Z_]{6,20}$/.test($(this).val())) {
                    showErrorMsg($("#alertMessage_password"), "密码必须是6-20位数字字母组合，可含下划线");
                    return;
                }
                validateMap.password = true;
                showErrorMsg($("#alertMessage_password"), "");
            });

            $("#passwordConfirm").blur(function() {
                validateMap.passwordConfirm = false;
                if ($(this).val().length <= 0) {
                    showErrorMsg($("#alertMessage_passwordConfirm"), "密码不能为空");
                    return;
                }
                if ($(this).val() != $("#password").val()) {
                    showErrorMsg($("#alertMessage_passwordConfirm"), "密码输入不一致");
                    return;
                }
                validateMap.passwordConfirm = true;
                showErrorMsg($("#alertMessage_passwordConfirm"), "");
            });
        }

        $("#submitbtn").click(function () {
            $("#passportName").trigger("blur");
            $("#verifiCode").trigger("blur");
            $("#password").trigger("blur");
            $("#passwordConfirm").trigger("blur");
            if (!validateMap.passportName || !validateMap.verifiCode || !validateMap.password || !validateMap.passwordConfirm) {
                return;
            }

            if(!validateIdPassportName) {
                showErrorMsg($("#alertMessage"), "请重新获取验证码");
                return;
            }

            submit();
        });

        // 表单提交
        function submit() {
            $("#submitbtn").prop("disabled", true);
            $.ajax({
                url : "/forgetPwd",
                type : "POST",
                data : {
                    passportNameType: validateMap.passportNameType,
                    validateId : validateIdPassportName,
                    verifiCode : $("#verifiCode").val(),
                    passportName : $("#passportName").val(),
                    password : $("#password").val(),
                    bkurl : $("#bkurl").val(),
                    redirect_uri : $("#redirect_uri").val()
                },
                success : function(obj) {
                    if (obj.code == 200 || obj.code == 302) {
                        location.href = obj.data;
                    } else {
                        obj && obj.message && showErrorMsg($("#alertMessage"), obj.message);
                    }
                    $("#submitbtn").prop("disabled", false);
                },
                error: function () { $("#submitbtn").prop("disabled", false);}
            });
        }

        var validateIdPassportName;
        function sendVerifiCode(geetest_challenge, geetest_validate, geetest_seccode) {
            var param = {
                passportName: $("#passportName").val(),
                passportNameType: validateMap.passportNameType,
                geetest_challenge: geetest_challenge,
                geetest_validate: geetest_validate,
                geetest_seccode: geetest_seccode,
                validateId: validateId
            };

            if (validateMap.passportNameType == "mobile") {
                param.countryCode = "86";
            }

            $.ajax({
                url: "/forgetPwd/sendVerifiCode",
                data: param,
                type: "POST",
                success: function (obj) {
                    if (obj.code == 200) {
                        smsvalid = false;
                        countsec = initTime + 1;
                        intervaltimer = setInterval(intervalfunc, 1000);
                        validateIdPassportName = obj.data.validateId;
                    } else {
                        obj && obj.message && showErrorMsg($("#alertMessage"), obj.message);
                    }

                    initCaptcha();
                }
            });
        }

        var validateId, captcha;
        function initCaptcha() {
            $.ajax({
                url: "/validate/createValidate",
                data: {
                    type: 20,
                    scene: 101005,
                    clientType: 'n',
                    businessSystem: 1
                },
                dataType: "jsonp",
                success: function (data) {
                    validateId = data.data.validateId;
                    initGeetest({
                        gt: data.data.validate.gt,
                        challenge: data.data.validate.challenge,
                        offline: !data.data.validate.success, // 表示用户后台检测极验服务器是否宕机
                        new_captcha: true, // 用于宕机时表示是新验证码的宕机
                        product: "bind", // 产品形式，包括：float，popup
                        width: "300px"
                    }, function (captchaObj) {
                        captcha = captchaObj;
                        captcha.onSuccess(function () {
                            var result = captchaObj.getValidate();
                            if (!result) {
                                return alert('请完成验证');
                            }
                            var geetest_challenge = result.geetest_challenge;
                            var geetest_validate = result.geetest_validate;
                            var geetest_seccode = result.geetest_seccode;

                            sendVerifiCode(geetest_challenge, geetest_validate, geetest_seccode);
                        });
                    });
                }
            });
        }

        $("#sendVerifiCode").click(function () {
            $("#passportName").trigger("blur");
            if (!validateMap.passportName) {
                return;
            }

            if (!smsvalid) {
                return;
            }
            showErrorMsg($("#alertMessage"), "");
            captcha.verify();
        });

        initCaptcha();
    });

    var smsvalid = true;
    var initTime = 60;
    var countsec = initTime;

    function intervalfunc() {
        if (countsec <= 1) {
            clearInterval(intervaltimer);
            $('#sendVerifiCode').removeClass("code-disabled").html("重新获取");
            smsvalid = true;
            return;
        }
        countsec--;
        $('#sendVerifiCode').addClass("code-disabled").html(countsec + "秒后重发");
    }
</script>
</html>
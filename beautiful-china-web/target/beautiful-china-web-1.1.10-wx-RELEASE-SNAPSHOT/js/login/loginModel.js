/**
 * buhengzhang
 * 弹框的登陆
 */
$(document).ready(function () {
    $("#login-check2").hide();
    //验证邮箱
    $("#nickName").blur(function () {
        var email = $("#nickName").val();
        var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if (email == "") {
            $("#nickname-check").text(nullemail);
            $("#nickname-check").css({"color": "red"});
        } else {
            if (!reg.test(email)) {
                $("#nickname-check").show();
                $("#nickname-check").text(erroremail);
                $("#nickname-check").css({"color": "red"});
            } else {
                $("#nickname-check").hide();
            }
        }
    })
    //登录按钮
    $("#log_in").click(function () {
        //用户名
        var name = $("#nickName").val();
        //密码
        var pwd = $("#password").val();
        //验证用户名是否为空
        if (name == "") {
            $("#nickname-check").show();
            $("#nickname-check").text(nullemail);
            $("#nickname-check").css({"color": "red"});
            return;
        } else {
            $("#nickname-check").hide();
        }
        //验证密码是否为空
        if (pwd == "") {
            $("#pwd-check").show();
            $("#pwd-check").text(nullpwd);
            $("#pwd-check").css({"color": "red"});
            return;
        } else {
            $("#pwd-check").hide();
        }
        //将用户名和密码传到后台进行验证
        var password = $("#password").val();
        //加密
        var key = new RSAKeyPair(
            "22c29d5bda305e5daa0920b86cd410844a7aead043cfc3f78af2166e86e26eb", "",
            "102e05ea9849d82b2630523751c1cd1984e92d3b45bf8d1ba0d67b55b0119eb9"
        );
        var ping = $("#ping").val();
        var newpwd = encryptedString(key, password + ping);
        console.log(newpwd);
        //$("#password").val(newpwd);
        var json = JSON.stringify({email: $("#nickName").val(), password: newpwd});
        $.ajax({
            type: "POST",
            url: "/login/loginByEmail",
            data: json,
            contentType: "application/json",
            dataType: "JSON",
            success: function (msg) {
                if (msg.result === "ok") {
                    var user=msg.data;
                    $("#quitLogin").show();
                    $("#login_link").show();
                    $("#login_link").text(user.nickname);
                    $("#hiddenName").val(user.nickname);
                    $("#userId").val(user.id);
                    $("#dropdown").hide();
                    $("#access_link").hide();
                    $("#loginFirst").modal('hide');
                } else {
                    $("#login-check2").text(msg.msg);
                    $("#login-check2").css({"color": "red"});
                    $("#login-check2").show();
                }
            },
        });
    })
})

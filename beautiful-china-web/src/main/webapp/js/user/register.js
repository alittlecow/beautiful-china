$(document).ready(function () {
    usernameinfo.hide();
    emailinfo.hide();
    //validate验证
    $("#registerform").validate({
        errorClass: "msg_error",
        rules: {
            nickname: {
                required: true,
            },
            email: {
                email: true,
                required: true,
            },
            password1: {
                minlength: 6,
                required: true,
            },
            password2: {
                equalTo: '#password1',
                required: true,
            },
        },
        messages: {
            nickname: {
                required: required_100000,
            },
            email: {
                email: email_100001,
                required: required_100000,
            },
            password1: {
                minlength: minlength_100003,
                required: required_100000,
            },
            password2: {
                equalTo: equalTo_100002,
                required: required_100000,
            },
        },
    });
    $("#username").blur(function () {
        //验证用户名是否存在
        var jsonUsername = JSON.stringify({nickname: username.val()});
        $.ajax({
            type: "POST",
            url: "/register/uniqueUsername",
            data: jsonUsername,
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                if (data.result === "ok") {
                    usernameinfo.show();
                    usernameinfo.text(register_100002);
                    reg_submit.attr("disabled", "disabled");
                    return;
                } else {
                    usernameinfo.hide();
                    reg_submit.removeAttr("disabled");
                }
            }
        })
    })
    $("#email").blur(function () {
        //验证邮箱是否注册
        var jsonEmail = JSON.stringify({email: email.val()});
        $.ajax({
            type: "POST",
            url: "/register/uniqueEmail",
            data: jsonEmail,
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                if (data.result === "ok") {
                    emailinfo.show();
                    emailinfo.text(register_100003);
                    reg_submit.attr("disabled", "disabled");
                } else {
                    emailinfo.hide();
                    reg_submit.removeAttr("disabled");
                }
            }
        })
    })
    //点击按钮验证
    reg_submit.click(function () {
        //validate验证通过
        if ($("#registerform").valid()) {

            //开始加密
            var ping = $("#ping").val();
            var key = new RSAKeyPair(
                "22c29d5bda305e5daa0920b86cd410844a7aead043cfc3f78af2166e86e26eb", "",
                "102e05ea9849d82b2630523751c1cd1984e92d3b45bf8d1ba0d67b55b0119eb9"
            );
            var newpwd = encryptedString(key, password.val() + ping);
            //注册
            var json = JSON.stringify({
                nickname: nickname.val(),
                email: email.val(),
                password: newpwd,
                type: type.val()
            });
            $.ajax({
                type: "POST",
                url: "/register/save",
                data: json,
                contentType: "application/json",
                dataType: "json",
                success: function (msg) {
                    if (msg.result == "ok") {
                        //注册成功
                        $("#Message2").text(register_100000);
                        $("#Message").modal("toggle");
                        $("#Confirm").click(function () {
                            window.location.href = "login";
                        })
                    } else {
                        //注册失败
                        if(msg.msg != ""){
                            $("#Message2").text(msg.msg);
                        }
                        $("#Message2").text(register_100001);
                        $("#Message").modal("toggle");
                    }
                }
            });
        }
    });
});

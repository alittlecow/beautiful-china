$(document).ready(function(){
    //判断是否登录
    var userNickName=$("#hiddenName").val();
    if (userNickName == "") {
        $("#loginFirst").modal();
        return;
    }
    //验证原密码是否正确
    oldPassword.on("blur",function(){
        var ping=$("#ping").val();
        var key = new RSAKeyPair(
            "22c29d5bda305e5daa0920b86cd410844a7aead043cfc3f78af2166e86e26eb", "",
            "102e05ea9849d82b2630523751c1cd1984e92d3b45bf8d1ba0d67b55b0119eb9"
        );
        var newpwd = encryptedString(key, oldPassword.val() + ping);
        var json = JSON.stringify({userId:userId, password:newpwd});
        $.ajax({
            type: "POST",
            url: "/information/passwordVerify",
            data: json,
            contentType: "application/json",
            dataType:"json",
            success: function(data){
                if(data.result=="ok"){
                    oldInfo.hide();
                    chang_submit.removeAttr("disabled");
                }
            }
        });
    });
    //修改的新密码不能与原密码相同
    newPassword.on("blur",function(){
        if(newPassword.val()==oldPassword.val()){
            newInfo.show();
            newInfo.text(changPwd_100003);
            chang_submit.attr("disabled","disabled");
        }else{
            newInfo.hide();
            chang_submit.removeAttr("disabled");
        }
    });
    //validate验证
    $("#changPwdForm").validate({
        errorClass: "msg_error",
        rules : {
            old_password : {
                required : true,
            },
            new_password:{
                minlength : 6,
                required : true,
            },
            confirm_new_password:{
                equalTo : '#new_password',
                required : true,
            },
        },
        messages:{
            old_password : {
                required : required_100000,
            },
            new_password:{
                minlength : minlength_100003,
                required : required_100000,
            },
            confirm_new_password:{
                equalTo : equalTo_100002,
                required : required_100000,
            },
        },
    });
    //点击按钮验证
    chang_submit.click(function(){
        if($("#changPwdForm").valid()){
            var ping=$("#ping").val();
            var key = new RSAKeyPair(
                "22c29d5bda305e5daa0920b86cd410844a7aead043cfc3f78af2166e86e26eb", "",
                "102e05ea9849d82b2630523751c1cd1984e92d3b45bf8d1ba0d67b55b0119eb9"
            );
            var newpwd = encryptedString(key, oldPassword.val() + ping);
            var json = JSON.stringify({userId:userId, password:newpwd});
            $.ajax({
                type: "POST",
                url: "/information/passwordVerify",
                data: json,
                contentType: "application/json",
                dataType:"json",
                success: function(data){
                    if(data.result!="ok"){
                        oldInfo.show();
                        oldInfo.text(changPwd_100002);
                        chang_submit.attr("disabled","disabled");
                        return;
                    }else{
                        oldInfo.hide();
                        chang_submit.removeAttr("disabled");
                        //原密码正确
                        if(newPassword.val()==oldPassword.val()){
                            newInfo.show();
                            newInfo.text(changPwd_100003);
                            chang_submit.attr("disabled","disabled");
                            return;
                        }else{
                            //加密
                            var ping=$("#ping").val();
                            var key = new RSAKeyPair(
                                "22c29d5bda305e5daa0920b86cd410844a7aead043cfc3f78af2166e86e26eb", "",
                                "102e05ea9849d82b2630523751c1cd1984e92d3b45bf8d1ba0d67b55b0119eb9"
                            );
                            var newpwd = encryptedString(key, newPassword.val() + ping);
                            //修改密码
                            var json = JSON.stringify({userId:userId,email:$("#email").val(), password:newpwd})
                            $.ajax({
                                type: "POST",
                                url: "/information/passwordChang",
                                data: json,
                                contentType: "application/json",
                                dataType:"json",
                                success: function(data){
                                    if(data.result=="ok"){
                                        alert(changPwd_100000);
                                        window.location.href="login";
                                    }else{
                                        alert(changPwd_100001);
                                    }
                                }
                            });
                        }
                    }
                }
            });
        }
    });
});
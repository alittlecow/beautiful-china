$(document).ready(function () {
    //codeInfo.hide();
    $("#email-info").hide();
    ////验证code是否重复
    //deptCode.on("blur", function () {
    //    var jsonCode = JSON.stringify({deptCode: deptCode.val()});
    //    $.ajax({
    //        type: "POST",
    //        url: "/suppliersin/uniqueCode",
    //        data: jsonCode,
    //        contentType: "application/json",
    //        dataType: "JSON",
    //        success: function (msg) {
    //            if (msg.result != "ok") {
    //                codeInfo.hide();
    //                sup_submit.removeAttr("disabled");
    //            }
    //        },
    //    });
    //});
    //验证邮箱是否重复
    $("#agentEmail").blur(function () {
        var jsonEmail = JSON.stringify({email: $("#agentEmail").val()});
        $.ajax({
            type: "POST",
            url: "/agentin/uniqueEmail",
            data: jsonEmail,
            contentType: "application/json",
            dataType: "JSON",
            success: function (msg) {
                if (msg.result != "ok") {
                    $("#email-info").hide();
                    $("#registerAgent").removeAttr("disabled");
                }else{
                    $("#email-info").show();
                    $("#email-info").text(uniqueEmail);
                    $("#registerAgent").attr("disabled","disabled");
                }
            },
        });
    });
    //验证表单内容
    $("#agentRegister").validate({
        errorClass: "msg_error",
        rules: {
            agentName: {
                required: true
            },
            connectFirstName: {
                required: true
            },
            agentAddress: {
                required: true
            },
            telephone: {
                required: true
            },
            telephone2: {
                required: true
            },
            connectLastName: {
                required: true
            },
            agentEmail: {
                email: true,
                required: true
            },
            cardNumber: {
                required: true
            },
            description: {
                required: true
            },
            password1: {
                required: true,
                minlength: 6
            },
            password2: {
                required: true,
                equalTo: '#password1',

            },
            agreeRule: {
                required: true,
            }
        },
        errorPlacement: function (error, element) {
            var p = $("<p />").append(error);
            p.appendTo(element.parent());
        },
        messages: {
            agentName: {
                required: notnull
            },
            connectFirstName: {
                required: notnull
            },
            agentAddress: {
                required: notnull
            },
            telephone: {
                required: notnull
            },
            telephone2: {
                required: notnull
            },
            connectLastName: {
                required: notnull
            },
            agentEmail: {
                email: erroremail,
                required: notnull
            },
            cardNumber: {
                required: notnull
            },
            description: {
                required: notnull
            },
            password1: {
                required: notnull,
                minlength: minlength_100003
            },
            agreeRule: {
                required: readAndAgree,
            },
            password2: {
                required: notnull,
                equalTo: passwordNotSame
            },
        },
    });
    $("#readAndAgree").click(function () {
        //showDiv();
        registrationAgreement();
    })
    //插入商家数据
    $("#registerAgent").click(function () {
        if ($("#agentRegister").valid()) {
            //验证邮箱是否重复
            var jsonEmail = JSON.stringify({email: $("#agentEmail").val()});
            $.ajax({
                type: "POST",
                url: "/agentin/uniqueEmail",
                data: jsonEmail,
                contentType: "application/json",
                dataType: "JSON",
                success: function (msg) {
                    if (msg.result === "ok") {
                        $("#email-info").show();
                        $("#email-info").text(uniqueEmail);
                        $("#registerAgent").attr("disabled","disabled");
                    } else {
                        $("#email-info").hide();
                        $("#registerAgent").removeAttr("disabled");
                        //开始加密
                        var ping = $("#ping").val();
                        var key = new RSAKeyPair(
                            "22c29d5bda305e5daa0920b86cd410844a7aead043cfc3f78af2166e86e26eb", "",
                            "102e05ea9849d82b2630523751c1cd1984e92d3b45bf8d1ba0d67b55b0119eb9"
                        );
                        var newpwd = encryptedString(key, $("#password1").val() + ping);
                        //验证通过，添加数据
                        var json = JSON.stringify({
                            agentName: $("#agentName").val(),
                            email: $("#agentEmail").val(),
                            password: newpwd,
                            firstName: $("#connectFirstName").val(),
                            lastName: $("#connectLastName").val(),
                            address: $("#agentAddress").val(),
                            telephone1: $("#telephone").val(),
                            telephone2: $("#telephone2").val(),
                            cardNo: $("#cardNumber").val(),
                            description: $("#description").val()
                        });
                        $.ajax({
                            type: "POST",
                            url: "/agentin/insertAgent",
                            data: json,
                            contentType: "application/json",
                            dataType: "JSON",
                            success: function (msg) {
                                if (msg.result == "ok") {
                                    $("#modal-body2").show();
                                    $("#modal-body3").hide();
                                } else {
                                    $("#modal-body2").hide();
                                    $("#modal-body3").show();
                                }
                                $("#myModal2").modal("toggle");
                            },
                        });
                    }
                }
            });
        }
    });
//点击确认返回首页
    $("#sure1").click(function () {
        window.location.href = '/';
    });

})

////同意用户注册协议
//function agreeAndContinue() {
//    $("#agreeRule").prop("checked", "true");
//}
////获取用户注册协议
//function registrationAgreement() {
//    $.ajax({
//        type: "POST",
//        url: "/suppliersin/getAgreement",
//        data: {groupCode: "BueatifulChina"},
//        dataType: "json",
//        success: function (msg) {
//            var agreement = msg.data;
//            $("#registrationAgreement").html(agreement);
//        },
//    });
//}
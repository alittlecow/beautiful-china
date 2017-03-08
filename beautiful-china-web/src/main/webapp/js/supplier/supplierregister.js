$(document).ready(function () {
    codeInfo.hide();
    emailInfo.hide();
    //验证code是否重复
    deptCode.on("blur", function () {
        var jsonCode = JSON.stringify({deptCode: deptCode.val()});
        $.ajax({
            type: "POST",
            url: "/suppliersin/uniqueCode",
            data: jsonCode,
            contentType: "application/json",
            dataType: "JSON",
            success: function (msg) {
                if (msg.result != "ok") {
                    codeInfo.hide();
                    sup_submit.removeAttr("disabled");
                }
            },
        });
    });
    //验证邮箱是否重复
    supplierEmail.on("blur", function () {
        var jsonEmail = JSON.stringify({supplierEmail: supplierEmail.val()});
        $.ajax({
            type: "POST",
            url: "/suppliersin/uniqueEmail",
            data: jsonEmail,
            contentType: "application/json",
            dataType: "JSON",
            success: function (msg) {
                if (msg.result != "ok") {
                    emailInfo.hide();
                    sup_submit.removeAttr("disabled");
                }
            },
        });
    });
    //验证表单内容
    $("#supplierregister").validate({
        errorClass: "msg_error",
        rules: {
            supplierName: {
                required: true
            },
            supplierAddress: {
                required: true
            },
            telephone: {
                required: true
            },
            telephone2: {
                required: true
            },
            legalPeople: {
                required: true
            },
            license: {
                required: true
            },
            contact: {
                required: true
            },
            supplierEmail: {
                email: true,
                required: true
            },
            website: {
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
            deptCode: {
                required: true,
                maxlength: 15
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
            supplierName: {
                required: notnull
            },
            supplierAddress: {
                required: notnull
            },
            telephone: {
                required: notnull
            },
            telephone2: {
                required: notnull
            },
            legalPeople: {
                required: notnull
            },
            license: {
                required: notnull
            },
            contact: {
                required: notnull
            },
            supplierEmail: {
                email: erroremail,
                required: notnull
            },
            website: {
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
            deptCode: {
                required: notnull
            }
        },
    });
    $("#readAndAgree").click(function () {
        //showDiv();
        registrationAgreement();
    })
    //插入商家数据
    sup_submit.click(function () {
        if ($("#supplierregister").valid()) {
            //验证code是否重复
            var jsonCode = JSON.stringify({deptCode: deptCode.val()});
            $.ajax({
                type: "POST",
                url: "/suppliersin/uniqueCode",
                data: jsonCode,
                contentType: "application/json",
                dataType: "JSON",
                success: function (msg) {
                    if (msg.result == "ok") {
                        codeInfo.show();
                        codeInfo.text(uniqueCode);
                        sup_submit.attr("disabled", "disabled");
                    } else {
                        codeInfo.hide();
                        sup_submit.removeAttr("disabled");
                        //验证邮箱是否重复
                        var jsonEmail = JSON.stringify({supplierEmail: supplierEmail.val()});
                        $.ajax({
                            type: "POST",
                            url: "/suppliersin/uniqueEmail",
                            data: jsonEmail,
                            contentType: "application/json",
                            dataType: "JSON",
                            success: function (msg) {
                                if (msg.result == "ok") {
                                    emailInfo.show();
                                    emailInfo.text(uniqueEmail);
                                    sup_submit.attr("disabled", "disabled");
                                } else {
                                    emailInfo.hide();
                                    sup_submit.removeAttr("disabled");
                                    //开始加密
                                    var ping = $("#ping").val();
                                    var key = new RSAKeyPair(
                                        "22c29d5bda305e5daa0920b86cd410844a7aead043cfc3f78af2166e86e26eb", "",
                                        "102e05ea9849d82b2630523751c1cd1984e92d3b45bf8d1ba0d67b55b0119eb9"
                                    );
                                    var newpwd = encryptedString(key, $("#password1").val() + ping);
                                    alert($("#supplierName").val());
                                    //验证通过，添加数据
                                    var json = JSON.stringify({
                                        supplierName: $("#supplierName").val(),
                                        supplierAddress: $("#supplierAddress").val(),
                                        telephone: $("#telephone").val(),
                                        telephone2: $("#telephone2").val(),
                                        legalPeople: $("#legalPeople").val(),
                                        license: $("#license").val(),
                                        contact: $("#contact").val(),
                                        supplierEmail: $("#supplierEmail").val(),
                                        website: $("#website").val(),
                                        description: $("#description").val(),
                                        password: newpwd,
                                        deptCode: $("#deptCode").val()
                                    });
                                    $.ajax({
                                        type: "POST",
                                        url: "/suppliersin/insertSupplier",
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
                },
            });
        }
    });
//点击确认返回首页
    $("#sure1").click(function () {
        window.location.href = '/';
    });

})

//同意用户注册协议
function agreeAndContinue() {
    $("#agreeRule").prop("checked", "true");
}
//获取用户注册协议
function registrationAgreement() {
    $.ajax({
        type: "POST",
        url: "/suppliersin/getAgreement",
        data: {groupCode: "BueatifulChina"},
        dataType: "json",
        success: function (msg) {
            var agreement = msg.data;
            $("#registrationAgreement").html(agreement);
        },
    });
}
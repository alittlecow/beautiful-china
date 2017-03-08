$(document).ready(function () {

    //$("#saveSuggestion").click(function () {
    //
    //})
})
function insertSug(){
    var userNickName=$("#hiddenName").val();
    if (userNickName == "") {
        //addmsg(loginfirst);
        $("#loginFirst").modal();
        return;
    }
    //验证表单内容
    $("#suggestionsForm").validate({
        errorClass: "msg_error",
        rules: {
            sugCountry: {
                required: true
            },
            sugType: {
                required: true
            },
            sugFirstname: {
                required: true
            },
            sugLastname: {
                required: true
            },
            sugSex: {
                required: true,
                minlength:1
            },
            sugPhone: {
                required: true
            },
            sugEmail: {
                email: true,
                required: true
            },
            sugDesc: {
                required: true
            }
        },
        errorPlacement: function (error, element) {
            var p = $("<p />").append(error);
            p.appendTo(element.parent());
        },
        messages: {
            sugCountry: {
                required: notnull
            },
            sugType: {
                required: notnull
            },
            sugFirstname: {
                required: notnull
            },
            sugLastname: {
                required: notnull
            },
            sugSex: {
                required: notnull
            },
            sugPhone: {
                required: notnull
            },
            sugEmail: {
                email: erroremail,
                required: notnull
            },
            sugDesc: {
                required: notnull
            }
        },
    });

    if($("#suggestionsForm").valid()){
        var json=JSON.stringify({
            userId: $("#userId").val(),
            type:$("#sugType option:selected").val(),
            description:$("#sugDesc").val(),
            phone:$("#sugPhone").val(),
            email:$("#sugEmail").val(),
            firstname:$("#sugFirstname").val(),
            lastname:$("#sugLastname").val(),
            sex: $("#sugSex option:selected").val(),
            nationality:$("#sugCountry").val()
        });
        $.ajax({
            type: "POST",
            url: "/suggestions/insertSuggestions",
            async:false,
            data: json,
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                if (data.result === "ok") {
                    alert("success");
                    $("#suggestionsForm")[0].reset();
                    $("#suggestions").modal('hide');
                } else {
                    alert("failed");
                }
            }
        })
    }
}
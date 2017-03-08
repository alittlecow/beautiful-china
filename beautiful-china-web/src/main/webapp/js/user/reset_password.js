$(document).ready(function(){
    $("#resetForm").validate({
        errorClass: "msg_error",
        rules : {
            password1:{
                minlength : 6,
                required : true,
            },
            password2:{
                equalTo : '#password1',
                required : true,
            },
        },
        messages:{
            password1:{
                minlength : minlength_100003,
                required : required_100000,
            },
            password2:{
                equalTo : equalTo_100002,
                required : required_100000,
            },
        },
    });
    reset_submit.click(function(){
        if($("#resetForm").valid()){
            var ping=$("#ping").val();
            var key = new RSAKeyPair(
                "22c29d5bda305e5daa0920b86cd410844a7aead043cfc3f78af2166e86e26eb", "",
                "102e05ea9849d82b2630523751c1cd1984e92d3b45bf8d1ba0d67b55b0119eb9"
            );
            var newpwd = encryptedString(key, password1.val() + ping);
            var json=JSON.stringify({password:newpwd,email:email});
            $.ajax({
                type: "POST",
                url: "/resetPassword/reset",
                data: json,
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    if (data.result == "ok") {
                        $("#Message2").text(reset_100000);
                        $("#Message").modal("toggle");
                        $("#Confirm").click(function(){
                            window.location.href = "login";
                        })
                    } else {
                        $("#Message2").text(reset_100000);
                        $("#Message").modal("toggle");
                    }
                }
            });
        }
    });
});
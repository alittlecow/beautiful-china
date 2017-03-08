/**
 * buhengzhang
 * header.jsp上的登陆
 */
$(document).ready(function () {

    $("#address").click(function () {
        getCountry();
    });

    //获取session的值
    var name = $("#hiddenName").val();
    if (name == "") {
        $("#login_link").hide();
        $("#quitLogin").hide();
        $("#access_link").show();
    } else {
        $("#quitLogin").show();
        $("#login_link").show();
        $("#login_link").text(name);
        $("#dropdown").hide();
        $("#access_link").hide();
    }
    //验证邮箱
    $("#inputUsernameEmail").blur(function () {
        var email = $("#inputUsernameEmail").val();
        var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if (email == "") {
            $("#email-check").text(nullemail);
            $("#email-check").css({"color": "red"});
        } else {
            if (!reg.test(email)) {
                $("#email-check").show();
                $("#email-check").text(erroremail);
                $("#email-check").css({"color": "red"});
            } else {
                $("#email-check").hide();
            }
        }
    })
    //登录验证
    $("#Sign_in").click(function () {
        var email = $("#inputUsernameEmail").val();
        var password = $("#inputPassword").val();
        if (email == "") {
            $("#email-check").text(nullemail);
            $("#email-check").css({"color": "red"});
            return;
        } else {
            $("#email-check").hide();
        }
        if (password == "") {
            $("#password-check").show();
            $("#password-check").text(nullpwd);
            $("#password-check").css({"color": "red"});
            return;
        } else {
            $("#password-check").hide();
        }
        //加密
        var key = new RSAKeyPair(
            "22c29d5bda305e5daa0920b86cd410844a7aead043cfc3f78af2166e86e26eb", "",
            "102e05ea9849d82b2630523751c1cd1984e92d3b45bf8d1ba0d67b55b0119eb9"
        );
        var ping = $("#ping").val();
        var newpwd = encryptedString(key, password + ping);
        console.log(newpwd);
        //$("#inputPassword").val(newpwd);
        var json = JSON.stringify({email: $("#inputUsernameEmail").val(), password: newpwd});
        $.ajax({
            type: "POST",
            url: "/login/loginByEmail",
            data: json,
            contentType: "application/json",
            dataType: "JSON",
            success: function (msg) {
                if (msg.result === "ok") {
                    window.location.reload();
                } else {
                    $("#login-check").text(msg.msg);
                    $("#login-check").css({"color": "red"});
                    $("#login-check").show();
                }
            },
        });
    })
    //跳转注册界面
    $("#Sign_up").click(function () {
        location.href = "register?type=N";
    })

})
function getProv(code, country) {
    $.ajax({
        type: "GET",
        url: "/GetContry/getProv",
        data: {code: code},
        contentType: "application/json",
        dataType: "JSON",
        success: function (msg) {
            var list = msg.data;
            $("#selecCountry").empty();
            if (list != "") {
                for (var i = 0; i < list.length; i++) {
                    $("#selecCountry").append("<li style='padding-left: 2px;'><a style='color: #080808;' href='javascript:changeCountry(\"" + list[i].nameen + "\",\"" + country + "\",\"" + list[i].longitude + "\");'>" + list[i].nameen + "</a></li>");
                }
            }
        },
    });

}
function getCountry() {
    $.ajax({
        type: "GET",
        url: "/GetContry/getCountry",
        data: {},
        contentType: "application/json",
        dataType: "JSON",
        success: function (msg) {
            var list = msg.data;
            $("#selecCountry").empty();
            if (list != "") {
                for (var i = 0; i < list.length; i++) {
                    $("#selecCountry").append("<li style='padding-left: 2px;'><a style='color: #080808;' href='javascript:getProv(\"" + list[i].code + "\",\"" + list[i].nameen + "\");'>" + list[i].nameen + "</a></li>");
                }
            }
        },
    });
}

function changeCountry(country, prov, longitude) {
    var address=country + "\ ," + prov;
    document.cookie="address="+address;
    document.cookie="longitude="+longitude;
    var exp = new Date();
    exp.setTime(exp.getTime() + 30*60*1000);
    document.cookie = "address" + "="+ escape (address) + ";expires=" + exp.toGMTString();
    document.cookie="longitude" + "="+ escape (longitude) + ";expires=" + exp.toGMTString();
    var arr,reg=new RegExp("(^| )"+"address"+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg)){
        address= unescape(arr[2]);
    }else{
        address= null;
    }
    if(address!=null){
        $("#address").text(country + "\ ," + prov);
        $("#longitudeT").val(longitude);
        $('li.dropdown').removeClass('open');
    }

}
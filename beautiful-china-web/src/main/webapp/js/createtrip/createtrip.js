/**
 * buhengzhang
 * 创建旅游路线
 */

$(document).ready(function () {
    $("#submit-contact").removeAttr("disabled","disabled");
    //时间选择器
    $("#arrive_time").datepicker({
        format: 'yyyy-mm-dd',
        weekStart: 1,
        startDate: '+1d',
        endDate: '+2y',
        autoclose: true,
        todayBtn: 'linked',
    });
    $("#submit-contact").click(function () {
        var userNickName=$("#hiddenName").val();
        if (userNickName == "") {
            //addmsg(loginfirst);
            $("#loginFirst").modal();
            return;
        }
        //旅游人数
        var person = $("#person_contact").val();
        //旅游天数
        var day = $("#los option:selected").val();
        //抵达时间
        var arrivaltime = $("#arrive_time").val();
        //酒店等级
        var hotellevel1 = $("input[name='hotel']:checked").val();
        //选择城市
        var tripcity = [];
        $('input[name="city"]:checked').each(function () {
            tripcity.push($(this).val());
        });
        //名字
        var name = $("#name_contact").val();
        //性别
        var sex = $("#sex option:selected").val();
        //邮箱
        var email = $("#email_contact").val();
        //电话
        var phone = $("#phone_contact").val();
        //验证码
        var code = $("#verify_contact").val();
        //判断是否为空
        if (person == "") {
            addmsg(nullperson);
            return;
        } else {
            $("#check-all").hide();
        }
        if (day == "") {
            addmsg(nullday);
            return;
        } else {
            $("#check-all").hide();
        }
        if (arrivaltime == "") {
            addmsg(nullarrivetime);
            return;
        } else {
            $("#check-all").hide();
        }
        if ($("input[name='hotel']:checked").size() != 0) {
            $("#check-all").hide();
        } else {
            addmsg(nullhotellevel);
            return;
        }
        if (tripcity == "") {
            addmsg(nullcity);
            return;
        } else {
            $("#check-all").hide();
        }
        if (name == "") {
            addmsg(nullname);
            return;
        } else {
            $("#check-all").hide();
        }
        if (sex == "") {
            addmsg(nullsex);
            return;
        } else {
            $("#check-all").hide();
        }
        if (email == "") {
            addmsg(nullemail);
            return;
        } else {
            $("#check-all").hide();
        }
        if (phone == "") {
            addmsg(nullphone);
            return;
        } else {
            $("#check-all").hide();
        }
        if (code == "") {
            addmsg(nullcode);
            return;
        } else {
            $("#check-all").hide();
        }
        //邮箱正则验算
        var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if (!reg.test(email)) {
            addmsg(erroremail);
            return;
        } else {
            $("#check-all").hide();
        }
        //简化酒店等级
        var hotellevel = 0;
        if (hotellevel1 == "5 star Hotel Chains") {
            hotellevel = 5;
        }
        if (hotellevel1 == "4 star Best Value") {
            hotellevel = 4;
        }
        if (hotellevel1 == "3 star Recommended") {
            hotellevel = 3;
        }

        var json = JSON.stringify({
            name: name,
            sex: sex,
            email: email,
            phone: phone,
            person: person,
            arrivalTime: arrivaltime,
            hotelLevel: hotellevel,
            otherRequirement: $("#message_contact").val(),
            day: day,
            citylist: tripcity,
            code: code
        });
        $.ajax({
            type: "POST",
            url: "/createtrip/insertCustomline",
            data: json,
            contentType: "application/json",
            dataType: "JSON",
            success: function (msg) {
                addmsg(msg.msg);
                $("#submit-contact").attr("disabled","disabled");
            }
        });
    });

    $("#changecode").click(function () {
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    })
})
function addmsg(message) {
    $("#check-all").show();
    $("#check-all").text(message);
    $("#check-all").css({"color": "red"});
}

//时间戳
//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
function chgUrl(url) {
    var timestamp = (new Date()).valueOf();
    url = url.substring(0, 17);
    if ((url.indexOf("&") >= 0)) {
        url = url + "×tamp=" + timestamp;
    } else {
        url = url + "?timestamp=" + timestamp;
    }
    return url;
}

$(document).ready(function () {
    //先验证是否已登录
    var userNickName = $("#hiddenName").val();
    if (userNickName == "") {
        $("#loginFirst").modal();
    }
    rating_btn.click(function () {
        if (userNickName == "") {
            loginModal.modal();
            return;
        }
        //取满意度的值
        var nameAllLevel = $("[name=allLevel]");
        var nameRoutingLevel = $("[name=routingLevel]");
        var nameHotelLevel = $("[name=hotelLevel]");
        var nameTrafficLevel = $("[name=trafficLevel]");
        var allLevel = "";
        var routingLevel = "";
        var hotelLevel = "";
        var trafficLevel = "";
        for (var i = 0; i < 3; i++) {
            if (nameAllLevel[i].checked) {
                allLevel = nameAllLevel[i].value;
            }
            if (nameRoutingLevel[i].checked) {
                routingLevel = nameRoutingLevel[i].value;
            }
            if (nameHotelLevel[i].checked) {
                hotelLevel = nameHotelLevel[i].value;
            }
            if (nameTrafficLevel[i].checked) {
                trafficLevel = nameTrafficLevel[i].value;
            }
        }
        //取对象的值
        var nameTarget = $("[name=target]");
        var target = "";
        for (var i = 0; i < nameTarget.length; i++) {
            if (nameTarget[i].checked) {
                target = nameTarget[i].value;
            }
        }
        //验证单选框是否为空
        if (target == "") {
            info.show();
            info.text(rating_100002);
            return;
        } else if (allLevel == "" || routingLevel == "" || hotelLevel == "" || trafficLevel == "") {
            info.show();
            info.text(rating_100003);
            return;
        } else {
            info.hide();
            //验证成功后添加到数据库
            var json = JSON.stringify({
                target: target, targetId: targetId, userId: userId, allLevel: allLevel,
                allContent: allContent.val(), routingLevel: routingLevel, routingContent: routingContent.val(),
                hotelLevel: hotelLevel, hotelContent: hotelContent.val(), trafficLevel: trafficLevel,
                trafficContent: trafficContent.val(), orderNo: orderNo
            });
            $.ajax({
                type: "POST",
                url: "/rating/save",
                data: json,
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    if (data.result == "ok") {
                        $("#ratingMessage2").text("success");
                        $("#ratingMessage").modal("toggle");
                    } else {
                        $("#ratingMessage2").text("failed");
                        $("#ratingMessage").modal("toggle");
                    }
                }
            });
        }
    });
    $("#ratingConfirm").click(function(){
        window.location.href = "information?userId=" + userId;
    })
});
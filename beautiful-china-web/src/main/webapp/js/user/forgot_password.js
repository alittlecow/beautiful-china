$(document).ready(function(){
    forget_email.on("blur",function(){
        if(forget_email.val()==""){
            infoshow(required_100000);
        }else if(!forget_email.val().match(reg)){
            infoshow(email_100001);
        }else if(forget_email.val().match(reg)){
            infohide();
        }
    });
    send_submit.click(function(){
        if(forget_email.val()==""){
            infoshow(required_100000);
            return;
        }else if(!forget_email.val().match(reg)){
            infoshow(email_100001);
            return;
        }else{
            var jsonEmail=JSON.stringify({email:forget_email.val()});//email.val()转成json格式
            $.ajax({
                type: "POST",
                url: "/register/uniqueEmail",
                data: jsonEmail,
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    if (data.result == "fail") {
                        infoshow(forget_100002);
                        return;
                    }else{
                        infohide();
                        //验证通过
                        var json=JSON.stringify({email:forget_email.val()});
                        $.ajax({
                            type: "POST",
                            url: "forget/sendEmail",
                            data: json,
                            contentType: "application/json",
                            dataType: "json",
                            success: function (data) {
                                if(data.result=="ok"){
                                    $("#Message2").text(forget_100000);
                                    $("#Message").modal("toggle");
                                }else{
                                    $("#Message2").text(forget_100001);
                                    $("#Message").modal("toggle");
                                }
                            }
                        });
                    }
                }
            });
        }
    });
});
/**
 * 信息显示：info-信息框,msg-信息内容,btn-按钮
 * @param info
 * @param msg
 * @param btn
 */
function infoshow(msg){
    forgetInfo.show();
    forgetInfo.text(msg);
    send_submit.attr("disabled","disabled");
}
/**
 * 信息隐藏：info-信息框,btn-按钮
 * @param info
 * @param btn
 */
function infohide(){
    forgetInfo.hide();
    send_submit.removeAttr("disabled");
}
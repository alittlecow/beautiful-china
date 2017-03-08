$(document).ready(function(){
   $("#payForm").validate({
       errorClass: "msg_error",
       rules: {
           policy_terms:{
               required: true,
           },
       },
       errorPlacement: function (error, element) {
           var p = $("<p />").append(error);
           p.appendTo(element.parent());
       },
       messages: {
           policy_terms:{
               required: agreePolicy,
           },
       }
   });
    $("#book").on('click', function () {
        //验证用户是否登录
        var userId = $("#userId").val();
        if (userId == "") {
            $("#loginFirst").modal();
            return;
        }
        if ($("#payForm").valid()) {
            pay();
        }
    });



});

function pay() {

    //TODO:paypal支付接口

    //订单号
    var orderNo = $("#orderNo").val();
    //用户id
    var userId = $("userId").val();
    //支付ajax
    $.ajax({
        type: "POST",
        url: "/payment/pay?orderNo=" + orderNo,
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            if(msg.result=='ok'){
                $("#modal-body2").show();
                $("#modal-body3").hide();
            }
            $("#myModal2").modal("toggle");
        }
    });

}
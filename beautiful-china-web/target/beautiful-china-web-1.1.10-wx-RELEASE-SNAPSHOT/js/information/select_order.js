$(document).ready(function(){
    var page = $("#page").val();//首次进入页面的页数
    if(page==1){
        var json = JSON.stringify({pageNumber:page, userId:userId});
        getOrders(json);
    }
    /*$("#sure1").click(function(){
        var pageNumber=$("#pageNumber").val();
        $.ajax({
            type: "POST",
            url: "/information/deleteOrder",
            data: {
                orderNo:orderNo_tmp
            },
            dataType: "text",
            success:function(data){
                if(data=="ok"){
                    alert("success");
                    var json = JSON.stringify({pageNumber:pageNumber, userId:userId});
                    successAjax(json);
                }else{
                    alert("fail");
                }
            }
        });
    });*/
    //取消订单
    $("#sure1").click(function(){
        var pageNumber=$("#pageNumber").val();
        $.ajax({
            type: "POST",
            url: "/information/cancelOrder",
            data: {
                orderNo:orderNo_tmp
            },
            dataType: "text",
            success:function(data){
                if(data=="ok"){
                    alert(bookings_100012);
                    var json = JSON.stringify({pageNumber:pageNumber, userId:userId});
                    getOrders(json);
                }else{
                    alert(bookings_100013);
                }
            }
        });
    });
});
/**
 * 删除订单
 * @param orderNo
 */
/*function deleteOrder(orderNo){
    orderNo_tmp=orderNo;
    $("#myModal2").modal("toggle");
}*/
/**
 * 取消订单
 * @param orderNo
 */
function cancelOrder(orderNo){
    var userNickName = $("#hiddenName").val();
    if (userNickName == "") {
        $("#loginFirst").modal();
        return;
    }
    orderNo_tmp=orderNo;
    $("#myModal2").modal("toggle");
}
/**
 * 根据订单的状态,显示需要的按钮和状态
 */
function getState(){
    //"订单状态:N：待付款 P:付款成功 SS:供应商确认 SC:供应商取消,订单关闭 TS:退单完成，订单关闭 MP:订单修改,支付未完成 S:行程结束"
    //如果订单状态为待付款,去付款按钮变为显示状态,取消订单变为显示状态
    $(".to_pay_N").show();
    $(".cancel_order_N").show();

    //订单状态为P,SS,S的时候,支付成功按钮显示出来
    $(".pay_success_SS").show();
    $(".pay_success_P").show();

    $(".wait_refund_SC").show();//状态为SC,显示等待退款
    $(".order_closed_TS").show();//状态为TS,"订单关闭"按钮显示
    $(".to_evaluate_S_F").show();//状态为S,评价状态为F时显示"去评价"按钮
    $(".have_evaluation_T").show();//评价状态为T的时候,显示:"已评价"按钮
    $(".print_orders_SS").show();//商家确认后,"打印订单按钮"显示
    $(".print_orders_P").show();//付款成功,"打印订单按钮"显示
    $(".print_invoice_S").show();//行程结束,显示打印发票按钮
}
/**
 * 页码显示
 */
function getPages() {
    var pageAll=$("#pageAll").val();
    if(pageAll==0){
        $('#visible-pages-example').hide();
        $("#content").text(empty_100000);
        $("#content").attr("align", "center");
    }else{
        $('#visible-pages-example').show();
        var visiblePage=7;
        if(pageAll<7){
            visiblePage=pageAll;
        }
        //重新加载
        $('#visible-pages-example').empty();
        $('#visible-pages-example').removeData("twbs-pagination");
        $('#visible-pages-example').unbind("page");

        $('#visible-pages-example').twbsPagination({
            totalPages: pageAll,
            visiblePages: visiblePage,
            version: '1.1',
            onPageClick: function (event, pageNumber) {
                var json = JSON.stringify({pageNumber:pageNumber, userId:userId});
                $.ajax({
                    type: "POST",
                    url: "/information/getOrders",
                    data: json,
                    contentType: "application/json",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.data == "0") {
                            $('#visible-pages-example').hide();
                            $("#content").text(empty_100000);
                            $("#content").attr("align", "center");
                        } else {
                            var ordersConditions = msg.data;//获取对象
                            var data = {
                                list: ordersConditions.listBO
                            };
                            var html = template('test', data);
                            document.getElementById("content").innerHTML = html;
                            var data2 = {
                                pageNumber: ordersConditions.pageNumber,
                                pageAll: ordersConditions.pageAll,
                            };
                            var html2 = template('test2', data2);
                            document.getElementById("content2").innerHTML = html2;
                            getState();
                        }
                    }
                });
            }
        });
    }
}
/**
 * 获取订单
 * @param json
 */
function getOrders(json){
    $.ajax({
        type: "POST",
        url: "/information/getOrders",
        data: json,
        contentType: "application/json",
        dataType: "json",
        success: function (msg) {
            if(msg.result == 'ok'){
                if (msg.data == "0") {
                    $('#visible-pages-example').hide();
                    $("#content").text(empty_100000);
                    $("#content").attr("align", "center");
                } else {
                    var ordersConditions = msg.data;//获取对象
                    var data = {
                        list: ordersConditions.listBO
                    };
                    var html = template('test', data);
                    document.getElementById("content").innerHTML = html;
                    var data2 = {
                        pageNumber: ordersConditions.pageNumber,
                        pageAll: ordersConditions.pageAll,
                    };
                    var html2 = template('test2', data2);
                    document.getElementById("content2").innerHTML = html2;
                    getPages();
                }
            }
        }
    });
}


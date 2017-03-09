//全局变量定义
//下单成功后返回的订单号码
var url;
$(document).ready(function () {


    $("#book2").on('click', function () {
        //验证用户是否登录
        userId = $("#userId").val();
        if (userId == "") {
            $("#loginFirst").modal();
            return;
        }
        if ($("#orderForm").valid()) {
            order();
        }
    });
    $("#sure1").on("click",function(){
       //跳转到支付页面
       window.location.href = "/payment?orderNo=" + orderNo + url;
    })

});
/**
 * 添加联系人信息
 */
function addContact(obj){
    // 联系人信息
    var contact = obj.value;
    //全名
    var fullName = contact.split("^_^")[0];
    //性别
    var sex = contact.split("^_^")[1];
    //国籍
    var nationality = contact.split("^_^")[2];
    //邮箱
    var email = contact.split("^_^")[3];
    //地址
    var address = contact.split("^_^")[4];
    //护照
    var passport = contact.split("^_^")[5];
    //电话
    var tel = contact.split("^_^")[6];
    //var type = contact.split("^_^")[7];//旅客类型
    $("#fullname_booking").val(fullName);
    $("#telephone_booking").val(tel);
    $("#nationality_booking").val(nationality);
    //$("#sex_booking").val(sex);
   // $("#sex_booking").attr("value",sex);
    $("#sex_booking").val(sex);

    //$("#sex_booking").get(0).value = sex;
    $("#passport_booking").val(passport);
    //$("#type_booking").val(type);
    $("#address_booking").val(address);
    $("#email_booking").val(email);
    $("#email_booking_2").val(email);

}

//旅客对象
function passenger(fullName,email, sex, nationality, passport, phone, type,childType) {
    this.fullName = fullName;
    this.email = email;
    this.sex = sex;
    this.nationality = nationality;
    this.passport = passport;
    this.phone = phone;
    this.type = type;
    this.childType= childType;
}
//订单付款明细对象
function orderDetail(type,valueId,upGrade,price,totalPrice){
    this.type=type;
    this.valueId=valueId;
    this.upGrade=upGrade;
    this.price=price;
    this.totalPrice=totalPrice;

}
function getAllOrderDetail(){
    var orderDetails = new Array();
    //保存付款详情条数
    var count=0;
    //总人数
    var total_person = $("#total_person").text();
    //自身价格
    var x_price=$("#tourPrice").text();
    var tourId=$("#tourId").val();
    orderDetails[count++] = new orderDetail("X",tourId,"N",x_price,total_person*x_price);

    //获取增值服务价格
    var options = document.getElementsByName("option");
    for(var i=0; i<options.length;i++){
        var price=options[i].value.split("-")[0];
        var valueId=options[i].value.split("-")[1];
        orderDetails[count++] = new orderDetail("O",valueId,"N",price,total_person*price);
    }
    //TODO:酒店和税金
    return orderDetails;
}
//订单信息对象
function orderInfo(userId, contact, tel, email, tourId, adults, children, total) {
    this.userId = userId;
    this.contact = contact;
    this.tel = tel;
    this.email = email;
    this.tourId = tourId;
    this.adults = adults;
    this.children = children;
    this.total = total;
}

//下订单
function order() {
    //用户id
    userId = $("#userId").val();
    //联系人
    var contact = $("#fullname_booking").val();
    //联系电话
    var tel = $("#telephone_booking").val();
    //邮箱
    var email = $("#email_booking").val();
    //线路id
    var tourId = $("#tourId").val();
    //成人数
    var adults = $("#adults").text();
    //儿童数量
    var children = $("#children").text();
    //订单总额
    var total = $("#total").html();
    //订单日期
    var date = $("#date").val();
    //跳转支付页面的url
    url = "&adults=" + adults + "&children=" + children + "&total=" + total;
    //封装json参数
    var orderVO = new orderInfo(userId, contact, tel, email, tourId, adults, children, total);
    //旅客列表
    var passengerVOList = getAllPassenger();
    //订单付款明细列表
    var orderDetailVOList=getAllOrderDetail();
    //json对象
    var jsonObject = {orderVO: orderVO, passengerVOList: passengerVOList,
        orderDetailVOList:orderDetailVOList};
    var jsonString = JSON.stringify(jsonObject);
    $.ajax({
        type: "POST",
        data: jsonString,
        url: "/orderInfo/create?date=" + date,
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            if (msg.result == 'ok') {
                orderNo = msg.data;
                //页面跳转bootstrap弹出框不显示
                $("#modal-body2").show();
                $("#modal-body3").hide();
            }
            else {
                $("#modal-body2").hide();
                $("#modal-body3").show();
            }
            $("#myModal2").modal("toggle");

        }
    });
}

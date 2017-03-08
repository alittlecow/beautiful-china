//用于接受团购日期和价格的全局变量
var endtimes = new Array();
var prices = new Array();
var remains = new Array();
var warnings = new Array();
//获取线路id
var tourId = $("#tourId").val();

$(document).ready(function () {
    //线路明细
    $.ajax({
        type: "GET",
        url: "/toursdetail/SelectToursDetail?tourId=" + tourId,
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            //将读取的json数据写入
            //标题
            var tourDetails = msg.data;

            //按照day的顺序从小到大排列
            //加载线路明细
            for (var i = 0; i < tourDetails.length; i++) {
                var html = "<div> <div> <h4><span>" + theDay + tourDetails[i].day + "</span>&nbsp;&nbsp;&nbsp;" + tourDetails[i].title +
                    "</h4> </div> <div>" +
                    "<div class='tourContent'><br/>" + tourDetails[i].content + "</div><br/><br/><hr> " +
                    " <div ><b>" + destinations + "&nbsp;&nbsp;</b><br/><br/>" + tourDetails[i].destination + "<br/><br/><hr>" +
                    "<b>" + transport + "&nbsp;&nbsp;</b>" + tourDetails[i].transport + "<br/><br/><hr></div> " +

                    "<div> <b>" + hotel + "&nbsp;&nbsp;</b><br/><br/>" + tourDetails[i].hotel + "<br/><br/><hr>" +
                    "<b>" + meals + "&nbsp;&nbsp;</b>" + tourDetails[i].meals + "</div> </div> </div><br/><br/>"

                //将封装好的div添加到tourBox中
                var div = $("<div></div>").html(html).addClass("dayTourList");
                $("div.dayTourBox").append(div);
            }
        }

    });
    //线路配置
    $.ajax({
        type: "GET",
        url: "/toursdetail/selectTourConfigById?tourId=" + tourId,
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            //接收后台数据
            var toursConfigBO = msg.data;
            //type类型为include
            for (i = 0; i < toursConfigBO.length; i++) {
                var type = toursConfigBO[i].type;
                if (type == "include") {
                    var includes = toursConfigBO[i].content;
                    var inlcude = includes.split("(;)");
                    //分成两栏
                    for (x = 0; x < inlcude.length - 1; x++) {
                        var includelist = $("<li></li>").text(inlcude[x]);
                        if (x % 2 == 0) {
                            $("#includeList_left").append(includelist);
                        }
                        else {
                            $("#includeList_right").append(includelist);
                        }
                    }
                }
                //type类型为exclude
                if (type == "exclude") {
                    var excludes = toursConfigBO[i].content;
                    //分成两栏
                    var exclude = excludes.split("(;)");
                    for (y = 0; y < exclude.length - 1; y++) {
                        var excludeList = $("<li></li>").text(exclude[y]);
                        if (y % 2 == 0) {
                            $("#excludeList_left").append(excludeList);
                        }
                        else {
                            $("#excludeList_right").append(excludeList);
                        }
                    }
                }
                //type类型为term
                if (type == "term") {
                    var terms = toursConfigBO[i].content;
                    //分成两栏
                    var term = terms.split("(;)");
                    for (y = 0; y < term.length - 1; y++) {
                        var termList = $("<li></li>").text(term[y]);
                        $("#term").append(termList);
                    }

                }
                //type类型为important
                if (type == "important") {
                    var importants = toursConfigBO[i].content;
                    //分成两栏
                    var important = importants.split("(;)");
                    for (y = 0; y < important.length - 1; y++) {
                        var importantList = $("<li></li>").text(important[y]);
                        $("#important").append(importantList);
                    }
                }
                //type类型为triphint
                if (type == "triphint") {
                    var triphints = toursConfigBO[i].content;
                    //分成两栏
                    var triphint = triphints.split("(;)");
                    for (y = 0; y < triphint.length - 1; y++) {
                        var tripintList = $("<li></li>").text(triphint[y]);
                        $("#triphint").append(tripintList);
                    }

                }
            }
        }
    });

    //加载出团信息
    $.ajax({
        type: "GET",
        url: "/toursdetail/selectBookingInfoById?tourId=" + tourId,
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            var tourBookingBOList = msg.data;
            var startCity = tourBookingBOList[0].startCity;
            var advanceDays = tourBookingBOList[0].advanceDays;
            //加载出发城市
            $("#startCity").text(startCity);
            //加载提前天数
            $("#advanceDays").text(advanceDays);
            for (i = 0; i < tourBookingBOList.length; i++) {
                endtimes[i] = getDate(tourBookingBOList[i].endTimes);
                prices[i] = tourBookingBOList[i].price;
                remains[i] = tourBookingBOList[i].remain;
                warnings[i] = tourBookingBOList[i].warning;
            }
            $('input.date-pick').datepicker({
                format: 'yyyy-mm-dd',
                weekStart: 0,
                autoclose: true
            });
            //写入最近日期
            $("#price").text(prices[0]);
            document.getElementById("date-pick").value = tourBookingBOList[0].endTimes.split(" ")[0];
            initprice();
            adults_num()

        }
    });
});

//字符串转日期格式，strDate要转为日期格式的字符串
function getDate(strDate) {
    var st = strDate;
    var a = st.split(" ");
    var b = a[0].split("-");
    var c = a[1].split(":");
    var date = new Date(b[0], b[1], b[2], c[0], c[1], c[2]);
    return date;
}

//返回当前日期价格
function initprice() {
    var date = document.getElementById("date-pick").value;
    $.ajax({
        type: "GET",
        url: "/toursdetail/getBookingInfo?tourId=" + tourId + "&date=" + date,
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            //将读取的json数据写入
            //标题
            var tourBookingBO = msg.data;
            var price = tourBookingBO.price;
            $("#price").text(price);
            //价格变动动 更新总价格
            total_cost();
        }
    });
}
//计算总人数
function all_num() {
    var adults_num = document.getElementById("adults").value;
    //将字符串转换成数值
    adults_num = parseInt(adults_num);
    var children_num = document.getElementById("children").value;
    children_num = parseInt(children_num);
    var all_num = adults_num + children_num;
    $("#amount_all").text(all_num);
}

//增值服务价格
function option_price(){
    var options=document.getElementsByName("options");
    var total=0;
    for(var i=0; i<options.length;i++){
        total=parseFloat(total);
        var optionPrice=options[i].value.split("-")[0];
        total+=parseFloat(optionPrice);
    }
    return total;
}
//计算总价格
function total_cost() {
    //增值服务总价格
    var optionPrice=option_price();
    var num = $("#amount_all").html();
    num = parseFloat(num);
    var price = $("#price").html();
    price = parseFloat(price);
    var all_cost = num *(price+parseFloat(optionPrice)) ;
    $("#total_cost").text(all_cost);
}
//同步成人人数
function adults_num() {
    num = document.getElementById("adults").value;
    $("#adults_quantity").text(num);
    all_num();
    total_cost();

}
//同步儿童数量
function children_num() {
    num = document.getElementById("children").value;
    $("#children_quantity").text(num);
    all_num();
    total_cost();
}

//跳转到支付页面
function payment() {
    //登录验证
    var userNickName = $("#hiddenName").val();
    if (userNickName == "") {
        $("#loginFirst").modal();
        return;
    }

    //POST提交
    var postForm = document.createElement("form");//表单对象
    postForm.method="post" ;
    //隐藏显示该form表单
    postForm.style="display: none" ;
    postForm.action = '/orderInfo' ;//订单信息页面
    //线路id
    var tourId = $("#tourId").val();
    var tourIdInput = document.createElement("input");// tourId input
    tourIdInput.setAttribute("name","tourId");
    tourIdInput.setAttribute("value",tourId);
    postForm.appendChild(tourIdInput);
    //成人数量
    var adults = $("#adults_quantity").html();
    var adultsInput = document.createElement("input");// adults input
    adultsInput.setAttribute("name","adults");
    adultsInput.setAttribute("value",adults);
    postForm.appendChild(adultsInput);
    //儿童数量
    var children = $("#children_quantity").html();
    var childrenInput = document.createElement("input");// children input
    childrenInput.setAttribute("name","children");
    childrenInput.setAttribute("value",children);
    postForm.appendChild(childrenInput);

    //总量
    var total = $("#total_cost").html();
    var totalInput = document.createElement("input");// total input
    totalInput.setAttribute("name","total");
    totalInput.setAttribute("value",total);
    postForm.appendChild(totalInput);

    //日期
    var date = document.getElementById("date-pick").value;
    var dateInput = document.createElement("input");// date input
    dateInput.setAttribute("name","date");
    dateInput.setAttribute("value",date);
    postForm.appendChild(dateInput);

    //增值服务价格
    var optionPrice=option_price();
    var optionPriceInput = document.createElement("input");// optionPrice input
    optionPriceInput.setAttribute("name","optionPrice");
    optionPriceInput.setAttribute("value",optionPrice);
    postForm.appendChild(optionPriceInput);

    //线路单价
    var tourPrice=$("#price").html();
    var tourPriceInput = document.createElement("input");// tourPrice input
    tourPriceInput.setAttribute("name","tourPrice");
    tourPriceInput.setAttribute("value",tourPrice);
    postForm.appendChild(tourPriceInput);
    //库存数量验证
    var num = parseInt(children) + parseInt(adults);

    var options=document.getElementsByName("options");
    for(var i=0; i<options.length;i++){
        var optionIdInput = document.createElement("input");// optionId input
        optionIdInput.setAttribute("name","optionId");
        optionIdInput.setAttribute("value",options[i].value);
        postForm.appendChild(optionIdInput);
        var optionNameInput = document.createElement("input");// optionNameInput input
        optionNameInput.setAttribute("name","optionName");
        optionNameInput.setAttribute("value",options[i].options[options[i].selectedIndex].text);
        postForm.appendChild(optionNameInput);
    }
    $.ajax({
        type: "GET",
        url: "/toursdetail/getBookingInfo?tourId=" + tourId + "&date=" + date,
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            //将读取的json数据写入
            //标题
            var tourBookingBO = msg.data;
            var inventory = tourBookingBO.inventory;
            if (inventory < num) {
                alert(payment_100006);
                return;
            }
            var types = new Array();
            for (var i = 0; i < adults; i++) {
                types[i] = adults;
            }
            //跳转到订单信息页面
            document.body.appendChild(postForm) ;
            postForm.submit() ;
            document.body.removeChild(postForm) ;
        }
    });


}



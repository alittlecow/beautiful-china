$(document).ready(function(){
    //获取线路id
    var tourId = $("#tourId").val();
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
                    "<b>" + transport + "&nbsp;&nbsp;</b><br/><br/>" + tourDetails[i].transport + "<br/><br/><hr></div> " +

                    "<div> <b>" + hotel + "&nbsp;&nbsp;</b><br/><br/>" + tourDetails[i].hotel + "<br/><br/><hr>" +
                    "<b>" + meals + "&nbsp;&nbsp;</b><br/><br/>" + tourDetails[i].meals + "</div> </div> </div>"
                //将封装好的div添加到tourBox中
                var div = $("<div></div>").html(html).addClass("dayTourList");
                $("div.dayTourBox").append(div);
            }
        }

    });
});

function printText(){
    $("#printText").printArea();
}

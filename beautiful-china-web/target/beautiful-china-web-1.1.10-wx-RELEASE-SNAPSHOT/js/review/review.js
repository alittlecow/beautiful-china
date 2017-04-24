$(document).ready(function () {
    var tourId = $("#tourId").val();
    //第一页评论
    getReview(1, "getReviewByPage");
    //评论条数获取
    $.ajax({
        type: "GET",
        data: {tourId: tourId},
        url: "/toursdetail/getAllReviewCount",
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            var list = msg.data;
            $("#all_reviews").text("AllReviews(" + list[0] + ")");
            $("#good_reviews").text("GoodReviews(" + list[1] + ")");
            $("#mid_reviews").text("MidReviews(" + list[2] + ")");
            $("#bad_reviews").text("BadReviews(" + list[3] + ")");
        }
    })
})
//换页查询
function changePage(id, pageNumber) {
    if (id == 1) {

        getReviewByPage(id, pageNumber, "getReviewByPage");
    } else if (id == 2) {

        //好评
        getReviewByPage(id, pageNumber, "getGoodReviewByPage");
    } else if (id == 3) {

        //中评
        getReviewByPage(id, pageNumber, "getMidReviewByPage");
    } else if (id == 4) {

        //差评
        getReviewByPage(id, pageNumber, "getBadReviewByPage");
    }

}

function changeReview(id) {
    if (id == 1) {
        $("#allReviewLi").addClass("active");
        $("#goodReviewLi").removeClass("active");
        $("#midReviewLi").removeClass("active");
        $("#badReviewLi").removeClass("active");
        //总评
        getReview(1, "getReviewByPage");
    } else if (id == 2) {
        $("#goodReviewLi").addClass("active");
        $("#allReviewLi").removeClass("active");
        $("#midReviewLi").removeClass("active");
        $("#badReviewLi").removeClass("active");
        //好评
        getReview(2, "getGoodReviewByPage");
    } else if (id == 3) {
        $("#goodReviewLi").removeClass("active");
        $("#midReviewLi").addClass("active");
        $("#allReviewLi").removeClass("active");
        $("#badReviewLi").removeClass("active");
        //中评
        getReview(3, "getMidReviewByPage");
    } else if (id == 4) {
        $("#goodReviewLi").removeClass("active");
        $("#midReviewLi").removeClass("active");
        $("#allReviewLi").removeClass("active");
        $("#badReviewLi").addClass("active");
        //差评
        getReview(4, "getBadReviewByPage");
    }
}
//评论公共方法
function getReview(id, path) {
    getReviewByPage(id, 1, path);
}
function getReviewByPage(id, pageNumber, path) {
    var tourId = $("#tourId").val();
    $.ajax({
        type: "GET",
        data: {pageNumber: pageNumber, tourId: tourId},
        url: "/toursdetail/" + path,
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            var list = msg.data;
            var reviewlist = list[0];
            var pageList = list[1];
            $("#reviewcontent").empty();
            if (reviewlist == "") {
                $("#page").empty();
                $("#reviewcontent").append("<div class='row' align='middle'> <h5>" + nullreviewcount + "</h5></div>");
            } else {
                for (var i = 0; i < reviewlist.length; i++) {
                    if (reviewlist[i].allContent == "") {
                        reviewlist[i].allContent = nullreviewcount;
                    }
                    if (reviewlist[i].routingContent == "") {
                        reviewlist[i].routingContent = nullreviewcount;
                    }
                    if (reviewlist[i].hotelContent == "") {
                        reviewlist[i].hotelContent = nullreviewcount;
                    }
                    if (reviewlist[i].trafficContent == "") {
                        reviewlist[i].trafficContent = nullreviewcount;
                    }
                    $("#reviewcontent").append("<div class='row'>" +
                        "<div class='col-md-2 col-sm-2'>" + reviewlist[i].nickname + "</div><div class='col-md-10 col-sm-10'>" +
                        "<div  class='col-md-12 col-sm-12' style='background-color: #F3F3F3'><div class='col-md-3 col-sm-3'>总评: &nbsp;&nbsp;" + reviewlist[i].allLevel + "</div>" +
                        " <div class='col-md-3 col-sm-3' >线路:&nbsp;&nbsp;" + reviewlist[i].routingLevel + "</div>" +
                        " <div class='col-md-3 col-sm-3'>酒店:&nbsp;&nbsp;" + reviewlist[i].hotelLevel + "</div>" +
                        "  <div class='col-md-3 col-sm-3'>交通:&nbsp;&nbsp;" + reviewlist[i].trafficLevel + "</div></div>" +
                        "  <div class='col-md-12 col-sm-12' style='word-wrap: break-word'>" + reviewlist[i].allContent + "</div>" +
                        " </div></div><hr></div>"
                    );

                }
                var totalPage = pageList.totalPageCount;
                var pageNum = pageList.pageNow;
                loadPage(id, totalPage, pageNum); //加载页码信息
            }
        }
    })
}
//页码显示
function loadPage(id, totalPage, pageNum) {
    $("#page").empty();
    var pageHtml = "";
    // 上一页
    if (pageNum == 1) {
        pageHtml += "<ul class='pagination'><li><a>prev</a></li>";
    } else {
        pageHtml += "<ul class='pagination'><li><a style='cursor:pointer' onclick='changePage(" + id + ","
            + (pageNum - 1) + ")'>prev</a></li>"
    }
    //根据总页数确定页码数组
    if (totalPage <= 10) {
        //循环出html
        for (var i = 1; i <= totalPage; i++) {
            //判断是否当前页
            if (pageNum == i) {
                pageHtml = pageHtml + "<li class='active'><a>" + i + "</a></li>"
            } else {
                pageHtml = pageHtml + "<li><a  style='cursor:pointer' onclick='changePage(" + id + "," + i + ")' >"
                    + i + "</a></li>"
            }
        }
        //如果当前页码小于10
    } else {
        //判断当前
        if (pageNum <= 4) {
            //循环出html
            for (var i = 1; i <= 10; i++) {
                //判断是否当前页
                if (pageNum == i) {
                    pageHtml = pageHtml + "<li class='active'><a>" + i + "</a></li>"
                } else {
                    pageHtml = pageHtml + "<li><a  style='cursor:pointer' onclick='changePage(" + id + "," + i
                        + ")'>" + i + "</a></li>"
                }
            }
            pageHtml = pageHtml + "<li><a>...</a></li>"
            //如果当前页接近总页码
        } else if (totalPage - pageNum <= 4) {
            pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changePage(" + id + "," + 1 + ")'>" + 1
                + ";</a></li>";
            pageHtml = pageHtml + "<li><a>...</a></li>"
            //获取两者的差值
            var sub = totalPage - pageNum;
            //往前循环
            for (var i = pageNum - (8 - sub); i <= pageNum; i++) {
                if (pageNum == i) {
                    pageHtml = pageHtml + "<li><a>" + i + "</a></li>"
                } else {
                    pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changePage(" + id + "," + i
                        + ")'>" + i + "</a></li>"
                }
            }
            //往后循环
            for (var i = pageNum + 1; i <= totalPage; i++) {
                pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changePage(" + id + "," + i + ")'>"
                    + i + "</a></li>"
            }
        } else {
            pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changePage(" + id + "," + 1 + ")'>" + 1
                + "</a></li>";
            pageHtml = pageHtml + "<li><a>...</a></li>"
            //往前循环
            for (var i = pageNum - 4; i < pageNum; i++) {
                if (i == 1) {
                    continue;
                }
                pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changePage(" + id + "," + i + ")'>"
                    + i + "</a></li>"
            }
            //当前页
            pageHtml = pageHtml + "<li class='active'><a>" + pageNum + "</a></li>"
            //往后循环
            for (var i = pageNum + 1; i <= pageNum + 4; i++) {
                pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changePage(" + id + "," + i + ")'>"
                    + i + "</a></li>"
            }
        }
    }
    // 下一页
    if (pageNum == totalPage) {
        pageHtml += "<li><a>next</a></li></ul>"
    } else {
        pageHtml += "<li><a  style='cursor:pointer' onclick='changePage(" + id + ","
            + (pageNum + 1) + ")'>next</a></li></ul>"
    }
    $("#page").html(pageHtml);
}
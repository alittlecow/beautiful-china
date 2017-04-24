/**
 * buhengzhang
 * toursdetail界面的问题列表
 */
$(document).ready(function () {
    getQuestion();
    //问题弹出框
    $("#add_question").click(function () {
        var id = $("#hiddenId").val();
        var userNickName=$("#hiddenName").val();
        if (userNickName == "") {
            $("#loginFirst").modal();
            return;
        }
        $("#addQuestionModal").modal();
    })
    //提交问题
    $("#submint_question").click(function () {
        //登录者ID
        var id = $("#hiddenId").val();
        var userNickName=$("#hiddenName").val();
        if (userNickName == "") {
            $("#loginFirst").modal();
            return;
        }
        var content = $("#question_contact").val();
        if (content == "") {
            $("#question_con_check").show();
            $("#question_con_check").text(nullquestion);
            $("#question_con_check").css({"color": "red"});
            return;
        } else {
            $("#question_con_check").hide();
        }
        var json = JSON.stringify({content: content, userId: id, tourId: tourId});
        $.ajax({
            type: "POST",
            url: "/question/insert",
            data: json,
            contentType: "application/json",
            dataType: "JSON",
            success: function (msg) {
                //$("#question_con_check").css({"color": "red"});
                getQuestionByPage(0);
                $("#question_con_check").show();
                $("#question_con_check").text(msg.msg);
                $("#addQuestionModal").modal('hide');
            }
        });
    })
});
//获取问题
function getQuestion() {
    var pageNumber = 1;
    getQuestionByPage(pageNumber);
}
function loadQuestionPage(totalPage, pageNum) {
    var pageHtml = "";
    // 上一页
    if (pageNum == 1) {
        pageHtml += "<ul class='pagination'><li><a>prev</a></li>";
    } else {
        pageHtml += "<ul class='pagination'><li><a style='cursor:pointer' onclick='changeQuestionPage("
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
                pageHtml = pageHtml + "<li><a  style='cursor:pointer' onclick='changeQuestionPage(" + i + ")' >"
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
                    pageHtml = pageHtml + "<li><a  style='cursor:pointer' onclick='changeQuestionPage(" + i
                        + ")'>" + i + "</a></li>"
                }
            }
            pageHtml = pageHtml + "<li><a>...</a></li>"
            //如果当前页接近总页码
        } else if (totalPage - pageNum <= 4) {
            pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changeQuestionPage(" + 1 + ")'>" + 1
                + ";</a></li>";
            pageHtml = pageHtml + "<li><a>...</a></li>"
            //获取两者的差值
            var sub = totalPage - pageNum;
            //往前循环
            for (var i = pageNum - (8 - sub); i <= pageNum; i++) {
                if (pageNum == i) {
                    pageHtml = pageHtml + "<li><a>" + i + "</a></li>"
                } else {
                    pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changeQuestionPage(" + i
                        + ")'>" + i + "</a></li>"
                }
            }
            //往后循环
            for (var i = pageNum + 1; i <= totalPage; i++) {
                pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changeQuestionPage(" + i + ")'>"
                    + i + "</a></li>"
            }
        } else {
            pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changeQuestionPage(" + 1 + ")'>" + 1
                + "</a></li>";
            pageHtml = pageHtml + "<li><a>...</a></li>"
            //往前循环
            for (var i = pageNum - 4; i < pageNum; i++) {
                if (i == 1) {
                    continue;
                }
                pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changeQuestionPage(" + i + ")'>"
                    + i + "</a></li>"
            }
            //当前页
            pageHtml = pageHtml + "<li class='active'><a>" + pageNum + "</a></li>"
            //往后循环
            for (var i = pageNum + 1; i <= pageNum + 4; i++) {
                pageHtml = pageHtml + "<li><a style='cursor:pointer' onclick='changeQuestionPage(" + i + ")'>"
                    + i + "</a></li>"
            }
        }
    }
    // 下一页
    if (pageNum == totalPage) {
        pageHtml += "<li><a>next</a></li></ul>"
    } else {
        pageHtml += "<li><a  style='cursor:pointer' onclick='changeQuestionPage("
            + (pageNum + 1) + ")'>next</a></li></ul>"
    }
    $("#questionPage").html(pageHtml);
}

//换页查询
function changeQuestionPage(pageNumber) {
    getQuestionByPage(pageNumber);

}
//问题分页查询
function getQuestionByPage(pageNumber) {
    var tourId = $("#tourId").val();
    $.ajax({
        type: "GET",
        data: {pageNumber: pageNumber, tourId: tourId},
        url: "/toursdetail/getQuestionByPage",
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            var list = msg.data;
            var questionlist = list[0];
            var pageList = list[1];
            $("#questionAll").empty();
            if (questionlist == "") {
                $("#questionAll").append("<div class='row' align='middle'> <h5>" + nullquestioncount + "</h5></div>");
            } else {
                var html = "";
                for (var i = 0; i < questionlist.length; i++) {
                    var answers = "";
                    for (var j = 0, len = questionlist[i].answerList.length; j < len; j++) {
                        var time = (questionlist[i].answerList)[j].time;
                        var answerTime = time.substring(0, time.lastIndexOf(":"));
                        answers += "# " + answerTime + "</br>" + (questionlist[i].answerList)[j].content + "<hr>";
                    }
                    html = html + "<div class='row'><div class='col-md-2 col-sm-2'>" + questionTitle + "</div><div class='col-md-10 col-sm-10' style='word-wrap: break-word'>" + questionlist[i].content + "</div>" +
                        "<div class='col-md-12 col-sm-12' align='right'><small>" + questionlist[i].time + "</small></div>" +
                        "<div class='col-md-2 col-sm-2'>" + answerTitle + "</div><div class='col-md-10 col-sm-10' style='word-wrap: break-word'>" + answers + "</div>" +
                        "<input type='hidden' id='question_status" + questionlist[i].id + "' value='" + questionlist[i].status + "'><div style='display: none' id='answer_p_" + questionlist[i].id + "'><hr>" +
                        "<textarea id='answer_con_" + questionlist[i].id + "' rows='5' name='message_contact' class='form-control' placeholder='Write your answer'style='height:200px;'></textarea>" +
                        "<div class='col-md-12 col-sm-12' align='right'><button id='insert_answer_" + questionlist[i].id + "' class='btn btn-info'>Answer</button></div></div>" +
                        "<div id='anwser_con_check" + questionlist[i].id + "'></div>" +
                        "<div align='right'><button id='answer_" + questionlist[i].id + "' onclick='javascript:answer(" + questionlist[i].id + "," + pageNumber + ");'class='btn btn-info'>Answer</button></div>" +
                        "<div id='anwser_status_check" + questionlist[i].id + "'></div></div><hr>";
                }
                $("#questionAll").html(html);
                var totalPage = pageList.totalPageCount;
                var pageNum = pageList.pageNow;
                loadQuestionPage(totalPage, pageNum); //加载页码信息
            }
        }
    })
}

function answer(id, pageNumber) {
    //问题状态
    var status = $("#question_status" + id).val();
    if (status == "C") {
        $("#anwser_status_check" + id).show();
        $("#anwser_status_check" + id).text(nullstatus);
        $("#anwser_status_check" + id).css({"color": "red"});
        return;
    } else {
        $("#anwser_status_check" + id).hide();
    }
    //判断是否登录
    var userId = $("#hiddenId").val();
    var userNickName=$("#hiddenName").val();
    if (userNickName == "") {
        //addmsg(loginfirst);
        $("#loginFirst").modal();
        return;
    }
    $("#answer_p_" + id).css("display", "block");
    $("#answer_" + id).hide();
    $("#insert_answer_" + id).click(function () {
        var type = $("#hiddenType").val();
        var answerContent = $("#answer_con_" + id).val();
        if (answerContent == "") {
            $("#anwser_con_check" + id).show();
            $("#anwser_con_check" + id).text(nullanswer);
            $("#anwser_con_check" + id).css({"color": "red"});
            return;
        }
        var json = JSON.stringify({questionId: id, content: answerContent, type: type, userId: userId});
        $.ajax({
            type: "POST",
            url: "/answer/insert",
            data: json,
            contentType: "application/json",
            dataType: "JSON",
            success: function (msg) {
                $("#anwser_con_check" + id).show();
                // $("#anwser_con_check" + id).text(msg.msg);
                // $("#anwser_con_check" + id).css({"color": "red"});
                //$("#anwser_con_check" + id).text(answerContent);
                getQuestionByPage(pageNumber);
            }
        });
        $("#answer_p_" + id).css("display", "none");
        $("#answer_" + id).show();
    })
}
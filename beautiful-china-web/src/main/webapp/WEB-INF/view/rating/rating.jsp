<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/1/21
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BEAUTIFUL CHINA</title>
    <%@include file="/common/head.jsp" %>
    <%--<%@include file="/common/script.jsp" %>--%>
    <style>
        .rating_label {
            font-size: 15px;
            font-weight: bold;
        }

        #msg_info {
            color: red;
            font-style: italic;
        }

        .btn_full {
            width: 200px;
            height: 50px;
        }
    </style>
</head>
<body>
<%@include file="/common/header.jsp" %>
<%@include file="/common/loginModel.jsp" %>
<%--<script src="/js/common/bootstrap.js"></script>--%>
<section class="login" id="hero">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                <div id="login">

                    <%--Evaluation object--%>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <label class="rating_label"><spring:message code="rating_100007"/></label>
                        </div>
                        <div class="col-md-5" align="right">
                            <input type="radio" name="target" value="T"><spring:message
                                code="rating_100008"/>
                        </div>
                    </div>
                    <hr>
                    <%--Overall satisfaction--%>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <label class="rating_label"><spring:message code="rating_100009"/></label>
                        </div>
                        <div class="col-md-5" align="right">
                            &nbsp;&nbsp;<input type="radio" name="allLevel" value="1"><spring:message
                                code="rating_100004"/>
                            &nbsp;&nbsp;<input type="radio" name="allLevel" value="2"><spring:message
                                code="rating_100005"/>
                            &nbsp;&nbsp;<input type="radio" name="allLevel" value="3"><spring:message
                                code="rating_100006"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                            <textarea id="allContent" rows="8" cols="80"
                                      placeholder="<spring:message code="rating_100013"/>"></textarea></div>
                    </div>
                    <hr>
                    <%--Routing satisfaction--%>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <label class="rating_label"><spring:message code="rating_100010"/></label>
                        </div>
                        <div class="col-md-5" align="right">
                            &nbsp;&nbsp;<input type="radio" name="routingLevel" value="1"><spring:message
                                code="rating_100004"/>
                            &nbsp;&nbsp;<input type="radio" name="routingLevel" value="2"><spring:message
                                code="rating_100005"/>
                            &nbsp;&nbsp;<input type="radio" name="routingLevel" value="3"><spring:message
                                code="rating_100006"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                        <textarea id="routingContent" rows="8" cols="80"
                                  placeholder="<spring:message code="rating_100014"/>"></textarea></div>
                    </div>
                    <hr>
                    <%--Hotel satisfaction--%>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <label class="rating_label"><spring:message code="rating_100011"/></label>
                        </div>
                        <div class="col-md-5" align="right">
                            &nbsp;&nbsp;<input type="radio" name="hotelLevel" value="1"><spring:message
                                code="rating_100004"/>
                            &nbsp;&nbsp;<input type="radio" name="hotelLevel" value="2"><spring:message
                                code="rating_100005"/>
                            &nbsp;&nbsp;<input type="radio" name="hotelLevel" value="3"><spring:message
                                code="rating_100006"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                        <textarea id="hotelContent" rows="8" cols="80"
                                  placeholder="<spring:message code="rating_100015"/>"></textarea></div>
                    </div>
                    <hr>
                    <%--Traffic satisfaction--%>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <label class="rating_label"><spring:message code="rating_100012"/></label>
                        </div>
                        <div class="col-md-5" align="right">
                            &nbsp;&nbsp;<input type="radio" name="trafficLevel" value="1"><spring:message
                                code="rating_100004"/>
                            &nbsp;&nbsp;<input type="radio" name="trafficLevel" value="2"><spring:message
                                code="rating_100005"/>
                            &nbsp;&nbsp;<input type="radio" name="trafficLevel" value="3"><spring:message
                                code="rating_100006"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                            <textarea id="trafficContent" rows="8" cols="80"
                                      placeholder="<spring:message code="rating_100016"/>"></textarea></div>
                    </div>
                    <hr>
                    <%--按钮与信息框--%>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-md-1"></div><div align="left" class="row"><span id="msg_info"></span></div>
                        </div>
                        <div class="col-md-6" align="right">
                            <div class="col-md-11">
                            <input class="btn_full" type="button" id="rating_btn"
                                   value="<spring:message code="bookings_100008"/>">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- 确认信息模态框（Modal） -->
<div class="modal fade" id="ratingMessage" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog" style="margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    <spring:message code="bookings_100016"/>
                </h4>
            </div>
            <div class="modal-body" id="ratingMessage2">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal" id="ratingConfirm">
                    <spring:message code="bookings_100014"/>
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<input type="hidden" id="userId" value="${userId}">
<input type="hidden" id="orderNo" value="${orderNo}">
<input type="hidden" id="targetId" value="${tourId}">
<%@include file="/common/footer.jsp" %>
</body>
<script src="/js/rating/rating.js"></script>
<script>
    var userId = $("#userId").val();
    var targetId = $("#targetId").val();
    var orderNo = $("#orderNo").val();
    var allContent = $("#allContent");
    var routingContent = $("#routingContent");
    var hotelContent = $("#hotelContent");
    var trafficContent = $("#trafficContent");
    var info = $("#msg_info");
    var rating_btn = $("#rating_btn");
    var loginModal = $("#loginFirst");
    var rating_100002 = "<spring:message code="rating_100002"/>";
    var rating_100003 = "<spring:message code="rating_100003"/>";
    var rating_100000 = "<spring:message code="rating_100000"/>";
    var rating_100001 = "<spring:message code="rating_100001"/>";
    var rating_100017 = "<spring:message code="rating_100017"/>";
</script>
</html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html> <!--<![endif]-->
<head>
    <%@ include file="/common/head.jsp"%>
    <link href="/css/admin.css" rel="stylesheet">
    <link href="/css/jquery.switch.css" rel="stylesheet">
    <title>BEAUTIFUL CHINA</title>
    <!-- Common scripts -->
    <style>
        label.msg_error{
            font-size:11px;
            color:red;
        }
        span.font_4{
            text-align: center;
        }
        a.btn_zy{
            border: 2px solid red;
            border-radius: 3px;
            color: red;
            cursor: pointer;
            display: block;
            font-family: inherit;
            font-size: 12px;
            font-weight: bold;
            margin: 10px;
            outline: medium none;
            text-align: center;
            text-transform: uppercase;
            transition: all 0.3s ease 0s;
            padding-top: 5px;
            width: 65%;
            height: 35px;
        }
        .info_booking li{float:left;list-style:none;margin-left:10px;}
    </style>

</head>
<body>

<!-- Header================================================== -->
<%@ include file="/common/header.jsp"%>

<section class="parallax-window" data-parallax="scroll" data-image-src="img/admin_top.jpg" data-natural-width="1400" data-natural-height="470">

</section><!-- End section -->

<div id="position">
    <div class="container">
        <ul>
            <li><a href="#"><spring:message code="information_100004"/></a></li>
            <li><spring:message code="information_100005"/></li>
        </ul>
    </div>
</div><!-- End Position -->

<div class="margin_60 container">
    <div id="tabs" class="tabs">
        <nav>
            <ul>
                <li><a href="#section-1" class="icon-booking"><span><spring:message code="bookings_100000"/></span></a></li>
                <li><a href="#section-3" class="icon-settings"><span><spring:message code="settings_100000"/></span></a></li>
                <li><a href="#section-4" class="icon-profile"><span><spring:message code="profile"/></span></a></li>
            </ul>
        </nav>
        <div class="content">

            <section id="section-1">
                <%--个人订单内容--%>
                <div id="content"></div>
                <%--页码显示--%>
                <div class="text-center">
                    <ul id="visible-pages-example"></ul>
                </div>
                <%--隐藏值内容--%>
                <div id="content2"></div>
            </section><!-- End section 1 -->

            <section id="section-3">
                <div class="row">
                    <div class="col-md-6 col-sm-6 add_bottom_30">
                        <h4><spring:message code="settings_100001"/></h4>
                        <form  id="changPwdForm">
                            <div class="form-group">
                                <label><spring:message code="settings_100002"/></label>
                                <input class="form-control" name="old_password" id="old_password" type="password">
                                <label id="old-info" class="msg_error"></label>
                            </div>
                            <div class="form-group">
                                <label><spring:message code="settings_100003"/></label>
                                <input class="form-control" name="new_password" id="new_password" type="password">
                                <label id="new-info" class="msg_error"></label>
                            </div>
                            <div class="form-group">
                                <label><spring:message code="settings_100004"/></label>
                                <input class="form-control" name="confirm_new_password" id="confirm_new_password" type="password">
                            </div>
                            <input type="button" class="btn_1 green" id="update_password" value="<spring:message code="settings_100005"/>">
                        </form>
                    </div>
                </div><!-- End row -->

                <!-- End row -->
            </section><!-- End section 3 -->
            <script src="/js/information/information.js"></script>
            <script>
                var nullnickname = "<spring:message code="login_100002"/>";
                var nullsex = "<spring:message code="createtrip_100006"/>";
                var nullUsername = "<spring:message code="information_100002"/>";
                var nullPassport = "<spring:message code="information_100003"/>";
                var female ="<spring:message code="female"/>";
                var male ="<spring:message code="male"/>";

                var firstName = "<spring:message code="firstName"/>";
                var lastName = "<spring:message code="lastName"/>";
                var gender = "<spring:message code="sex"/>";
                var nationality = "<spring:message code="nationality"/>";
                var email = "<spring:message code="Email"/>";
                var address = "<spring:message code="Address"/>";
                var passport = "<spring:message code="passport"/>";
                var phone = "<spring:message code="Phone"/>";
                var sexMsg = "<spring:message code="SexMsg"/>";
                var male = "<spring:message code="male"/>";
                var femaile = "<spring:message code="male"/>";
                var edit = "<spring:message code="edit"/>";
                var del = "<spring:message code="delete"/>";

            </script>
            <input type="hidden" id="hiddenId" value="${sessionScope.user.id}">
            <input type="hidden" id="hiddenSex" value="${sessionScope.user.sex}">
            <section id="section-4">
                <div class="row">
                    <div class="col-md-6 col-sm-9">
                        <h4><spring:message code="yourprofile"/></h4>
                        <ul id="profile_summary">
                            <li><spring:message code="userName"/> <span id="userNameSpan"></span></li>
                            <%--<li><spring:message code=""/> <span id="userLastNameSpan"></span></li>--%>
                            <li><spring:message code="nickName"/> <span id="userNickSpan"></span></li>
                            <li><spring:message code="sex"/> <span id="userSexSpan"></span></li>
                            <li><spring:message code="Email"/><span id="userEmailSpan"></span></li>
                            <li><spring:message code="passport"/><span id="userPortSpan"></span></li>
                            <li><spring:message code="regtime"/><span id="userTimeSpan"></span></li>
                        </ul>
                    </div>
                </div><!-- End row -->

                <div class="row">
                    <div class="col-md-12">
                        <h4><spring:message code="editprofile"/></h4>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <label><spring:message code="firstName"/></label>
                            <input class="form-control" name="firstName" id="firstName" type="text" value="${sessionScope.user.firstName}">
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <label><spring:message code="lastName"/></label>
                            <input class="form-control" name="lastName" id="lastName" type="text" value="${sessionScope.user.lastName}">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label><spring:message code="nickName"/></label>
                            <input class="form-control" name="nickName" id="nickName" type="text" value="${sessionScope.user.nickname}">
                        </div>
                    </div>
                </div><!-- End row -->


                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label><spring:message code="sex"/></label>
                            <select name="sexInfo" id="sexInfo" class="form-control">
                                <option selected value="">-<spring:message code="SexMsg"/>-</option>
                                <option value="F"><spring:message code="female"/></option>
                                <option value="M"><spring:message code="male"/></option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label><spring:message code="passport"/></label>
                            <input class="form-control" name="passport" id="passport" type="text" value="${sessionScope.user.nickname}">
                        </div>
                    </div>
                </div><!-- End row -->

                <button class="btn_1 green" id="updateProfile"><spring:message code="updateProfile"/>
                </button>
                <div id="check-info" style="color: red"></div>
                <hr>
                <div style="margin:30px 0px 30px 0px;">
                <button class="btn_1 green" data-toggle="modal"
                            data-target="#saveContact" id="addBtn">
                        <spring:message code="addMoreContact"/>
                    </button>
                </div>
            </section><!-- End section 4 -->

        </div><!-- End content -->
    </div><!-- End tabs -->
</div><!-- end container -->

<!-- 确认信息模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    <spring:message code="bookings_100016"/>
                </h4>
            </div>
            <div class="modal-body" id="modal-body2">
                <spring:message code="bookings_100011"/>
            </div>
            <div class="modal-footer">

                <button id="sure1" type="button" class="btn btn-success" data-dismiss="modal">
                    <spring:message code="bookings_100014"/>
                </button>
                <button id="cancle1" type="button" class="btn btn-danger"  data-dismiss="modal">
                    <spring:message code="bookings_100015"/>
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 按钮触发模态框 -->




<!-- 模态框（Modal） -->
<div class="modal fade" id="saveContact" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel4" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:15%; width:750px;height:800px;">
        <div class="modal-content">
            <div style="min-height: 16.42857143px;padding: 35px 35px 0px 35px;">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h3 class="modal-title" id="myModalLabel4">
                    <spring:message code="addContact"/>
                </h3>
            </div>
            <div class="modal-body">
                <form  id="saveContactForm">
                    <input type="hidden" name="userId" value="${sessionScope.user.id}"/>
                    <input  name="id" type="hidden"/>
                    <div class="col-md-12 col-sm-12 h6"  style="margin-top:5%;">
                        <div class="col-md-3 col-sm-3 h6">
                            <div class="form-group">
                                <label><spring:message code="firstName"/></label>
                                <input class="form-control"  name="firstName" type="text" >
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 h6">
                            <div class="form-group">
                                <label><spring:message code="lastName"/></label>
                                <input class="form-control"  name="lastName"  type="text" >
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 h6">
                            <div class="form-group">
                                <label><spring:message code="Sex"/></label>
                                <select class="form-control" name="sex">
                                    <option value="">-<spring:message code="SexMsg"/>-</option>
                                    <option value="F"><spring:message code="female"/></option>
                                    <option value="M"><spring:message code="male"/></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 h6">
                            <div class="form-group">
                                <label><spring:message code="nationality"/></label>
                                <input class="form-control"  name="nationality"  type="text">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 h6">
                            <div class="form-group">
                                <label><spring:message code="Email"/></label>
                                <input class="form-control"  name="email"  type="text">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 h6">
                            <div class="form-group">
                                <label><spring:message code="Address"/></label>
                                <input class="form-control"  name="address"  type="text" >
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 h6">
                            <div class="form-group">
                                <label><spring:message code="passport"/></label>
                                <input class="form-control"  name="passport"  type="text" >
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 h6">
                            <div class="form-group">
                                <label><spring:message code="Phone"/></label>
                                <input class="form-control"  name="tel"  type="text" >
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    <spring:message code="close"/>

                </button>
                <button type="button" id="saveBtn" class="btn btn-primary">
                    <spring:message code="save"/>
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="updateContact" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel3" aria-hidden="true">
        <div class="modal-dialog" style="margin-top:15%; width:750px;height:800px;">
            <div class="modal-content">
                <div style="min-height: 16.42857143px;padding: 35px 35px 0px 35px;">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h3 class="modal-title" id="myModalLabel3">
                        <spring:message code="editContact"/>
                    </h3>
                </div>
                <div class="modal-body">
                    <form id="updateContactForm">
                        <input type="hidden" name="userId" value="${sessionScope.user.id}"/>
                        <input id="editId" name="id" type="hidden"/>
                        <div class="col-md-12 col-sm-12 h6"  style="margin-top:5%;">
                            <div class="col-md-3 col-sm-3 h6">
                                <div class="form-group">
                                    <label><spring:message code="firstName"/></label>
                                    <input class="form-control" id="editFirstName" name="editFirstName" type="text" >
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3 h6">
                                <div class="form-group">
                                    <label><spring:message code="lastName"/></label>
                                    <input class="form-control" id="editLastName" name="editLastName"  type="text" >
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3 h6">
                                <div class="form-group">
                                    <label><spring:message code="Sex"/></label>
                                    <select class="form-control" id="editSex" name="editSex">
                                        <option value="">-<spring:message code="SexMsg"/>-</option>
                                        <option value="F"><spring:message code="female"/></option>
                                        <option value="M"><spring:message code="male"/></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3 h6">
                                <div class="form-group">
                                    <label><spring:message code="nationality"/></label>
                                    <input class="form-control" id="editNationality" name="editNationality"  type="text">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 h6">
                                <div class="form-group">
                                    <label><spring:message code="Email"/></label>
                                    <input class="form-control" id="editEmail" name="editEmail"  type="text">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 h6">
                                <div class="form-group">
                                    <label><spring:message code="Address"/></label>
                                    <input class="form-control" id="editAddress" name="editAddress"  type="text" >
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 h6">
                                <div class="form-group">
                                    <label><spring:message code="passport"/></label>
                                    <input class="form-control" id="editPassport" name="editPassport"  type="text" >
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 h6">
                                <div class="form-group">
                                    <label><spring:message code="Phone"/></label>
                                    <input class="form-control" id="editTel" name="editTel"  type="text" >
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                <spring:message code="close"/>

                            </button>
                            <input type="button" id="editBtn" class="btn btn-primary" value="<spring:message code="save"/>"/>
                        </div>
                    </form>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
<!-- footer -->
<%@include file="/common/footer.jsp" %>
<%--登录后传值过来--%>
<%--<input type="hidden" id="userId" value="${userId}">--%>
<input type="hidden" id="page" value="${page}">
<!-- Specific scripts -->
<script src="/js/common/security.js"></script>
<script src="/js/common/jquery.validate.js"></script>
<script src="/js/information/chang_password.js"></script>
<script src="/js/common/tabs.js"></script>
<script>new CBPFWTabs( document.getElementById( 'tabs' ) );</script>
<script>
    //错误信息内容
    var changPwd_100002 = "<spring:message code="changPwd_100002"/>";
    var changPwd_100003 = "<spring:message code="changPwd_100003"/>";
    var changPwd_100000 = "<spring:message code="changPwd_100000"/>";
    var changPwd_100001 = "<spring:message code="changPwd_100001"/>";
    var rating_100017   = "<spring:message code="rating_100017"/>";
    var bookings_100012 = "<spring:message code="bookings_100012"/>";
    var bookings_100013 = "<spring:message code="bookings_100013"/>";
    var required_100000  = "<spring:message code="required_100000"/>";
    var equalTo_100002   = "<spring:message code="equalTo_100002"/>";
    var minlength_100003 = "<spring:message code="minlength_100003"/>";
    var empty_100000 = "<spring:message code="empty_100000"/>"
    //ID选择器
    var oldPassword  = $("#old_password");
    var newPassword  = $("#new_password");
    var oldInfo      = $("#old-info");
    var newInfo      = $("#new-info");
    var userName     = $("#hiddenName");//header.jsp的登录名
    var userId       = $("#hiddenId").val();
    var chang_submit = $("#update_password");
    var orderNo_tmp  = 0;//订单号全局变量
    $('.wishlist_close_admin').on('click', function(c){
        $(this).parent().parent().parent().fadeOut('slow', function(c){
        });
    });
</script>
    <script id="test" type="text/html">
        {{each list as userOrder i}}
        <input type="hidden" class="tour_id" value="{{userOrder.tourId}}">
        <div class="strip_booking">
            <div class="row">
                <table border="1" width="100%" height="150">
                    <tr height="30" style="background-color: lightgray">
                        <td colspan="6">
                            &nbsp;&nbsp;&nbsp;&nbsp;<label><spring:message code="bookings_100001"/>:</label>{{userOrder.placedtime}}&nbsp;&nbsp;&nbsp;&nbsp;
                            <label><spring:message code="bookings_100002"/>:</label>{{userOrder.orderNo}}
                        </td>
                    </tr>
                    <tr align="center">
                        <td width="120">
                            <a href="toursdetail/{{userOrder.tourId}}"><img src="{{userOrder.imageUrl}}" width="100" height="100"></a>
                        </td>
                        <td width="400">
                            <a href="toursdetail/{{userOrder.tourId}}" style="color:black;font-size: 18px">{{userOrder.title}}</a>
                        </td>
                        <td width="100">
                            {{userOrder.contact}}
                        </td>
                        <td width="100" style="color: gray">
                            <spring:message code="bookings_100003"/> $ {{userOrder.total}}
                        </td>
                        <td width="150" style="color: gray">
                            <%--"订单状态:N：待付款 P:付款成功 SS:供应商确认 SC:供应商取消,订单关闭 TS:退单完成，订单关闭 MP:订单修改,支付未完成 S:行程结束"--%>
                             <%--T代表true已评价 F代表false未评价--%>
                            <%--去付款--%>
                                <div class="to_pay_{{userOrder.state}}" hidden="hidden">
                                    <a class="btn_1" href="/payment?orderNo={{userOrder.orderNo}}&total={{userOrder.total}}"><spring:message code="bookings_100005"/></a>
                                </div>
                            <%--订单已经支付成功--%>
                                <div class="pay_success_{{userOrder.state}}" hidden="hidden">
                                    <spring:message code="bookings_100006"/>
                                </div>
                            <%--打印发票按钮--%>
                                <div class="print_invoice_{{userOrder.state}}" hidden="hidden">
                                    <a class="btn_1" href="#"><spring:message code="bookings_print_invoice"/></a>
                                </div>
                            <%--等待退款--%>
                                <div class="wait_refund_{{userOrder.state}}" hidden="hidden">
                                    <spring:message code="bookings_wait_refund"/>
                                </div>
                            <%--订单处于关闭状态--%>
                                <div class="order_closed_{{userOrder.state}}" hidden="hidden">
                                    <spring:message code="bookings_100017"/>
                                </div>
                        </td>
                        <td width="150" style="color: gray">
                            <div class="to_evaluate_{{userOrder.state}}_{{userOrder.evaState}}" hidden="hidden"><%--去评价--%>
                                <%--<spring:message code="bookings_100007"/>--%>
                                <a class="btn_1" href="rating?orderNo={{userOrder.orderNo}}&userId={{userOrder.userId}}&tourId={{userOrder.tourId}}"><spring:message code="bookings_100008"/></a>
                            </div>
                            <div class="have_evaluation_{{userOrder.evaState}}" hidden="hidden"><%--已经评价--%>
                                <spring:message code="bookings_100009"/>
                            </div>
                            <div class="cancel_order_{{userOrder.state}}" hidden="hidden"><%--去取消订单--%>
                                <%--javascript:deleteOrder('{{userOrder.orderNo}}')--%>
                                <a href="javascript:cancelOrder('{{userOrder.orderNo}}')"><spring:message code="bookings_100010"/></a>
                            </div>
                            <div class="print_orders_{{userOrder.state}}" hidden="hidden"><%--已经评价--%>
                                <a class="btn_1" href="toursdetail/{{userOrder.tourId}}?isPrint=true" target="_black"><spring:message code="bookings_print_orders"/></a>
                            </div>
                        </td>
                    </tr>
                </table>

            </div><!-- End row -->
        </div><!-- End strip booking -->
        {{/each}}
    </script>
<script id="test2" type="text/html">
    <input id="pageNumber" type="hidden" value="{{pageNumber}}">
    <input id="pageAll" type="hidden" value="{{pageAll}}">
</script>
<script>
    var notnull = "<spring:message code="required_100000"/>";
</script>
<%--分页与查询--%>
<script src="/js/common/template.js"></script>
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="/js/paging/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="/js/information/select_order.js" type="text/javascript"></script>
</body>
</html>
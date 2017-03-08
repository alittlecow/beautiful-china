<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html> <!--<![endif]-->
<head>

    <%@ include file="/common/head.jsp" %>

    <title>BEAUTIFUL CHINA</title>

</head>
<style>
    label.msg_error {
        font-size: 12px;
        color: red;
    }
</style>
<body>

<!-- header -->
<%@include file="/common/header.jsp" %>

<!--订单号 -->
<input type="hidden" id="orderNo" value="${param.orderNo}">
<!--获取session中用户id-->
<input id="userId" type="hidden" value="${sessionScope.user.id}"/>
<section id="hero_2">
    <div class="intro_title animated fadeInDown">
        <h1><spring:message code="PlaceYourOrder"/></h1>

        <div class="bs-wizard">

            <div class="col-xs-4 bs-wizard-step complete">
                <div class="text-center bs-wizard-stepnum"><spring:message code="contactInformation"/></div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a href="/#" class="bs-wizard-dot"></a>
            </div>

            <div class="col-xs-4 bs-wizard-step complete">
                <div class="text-center bs-wizard-stepnum"><spring:message code="PaymentInformation"/></div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a href="/#" class="bs-wizard-dot"></a>
            </div>

            <div class="col-xs-4 bs-wizard-step disabled">
                <div class="text-center bs-wizard-stepnum"><spring:message code="finish"/>!</div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a href="/#" class="bs-wizard-dot"></a>
            </div>

        </div>
        <!-- End bs-wizard -->
    </div>
    <!-- End intro-title -->
</section>
<!-- End Section hero_2 -->

<div id="position">
    <div class="container">
        <ul>
            <li><a href="/#"><spring:message code="Home"/></a></li>
            <li><a href="/#"><spring:message code="Category"/></a></li>
            <li><spring:message code="PageActive"/></li>
        </ul>
    </div>
</div>
<!-- End position -->

<div class="container margin_60">
    <div class="row">
        <div class="col-md-8">
            <div class="form_title">
                <h3><strong>3</strong><spring:message code="BillingAddress"/></h3>

            </div>
            <div class="step">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label><spring:message code="Country"/></label>
                            <select class="form-control" name="country" id="country">
                                <option value="" selected><spring:message code="SelectYourCountry"/></option>
                                <option value="Europe"><spring:message code="Europe"/></option>
                                <option value="United states"><spring:message code="UnitedStates"/></option>
                                <option value="Asia"><spring:message code="Asia"/></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label><spring:message code="StreetLine1"/></label>
                            <input type="text" id="street_1" name="street_1" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label><spring:message code="StreetLine2"/></label>
                            <input type="text" id="street_2" name="street_2" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label><spring:message code="City"/></label>
                            <input type="text" id="city_booking" name="city_booking" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label><spring:message code="state"/></label>
                            <input type="text" id="state_booking" name="state_booking" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label><spring:message code="PostalCode"/></label>
                            <input type="text" id="postal_code" name="postal_code" class="form-control">
                        </div>
                    </div>
                </div>
                <!--End row -->
                <!--paypal支付接口 -->
                <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                    <!-- 按钮的类型// _xclick：立即购买按钮适用于购买单件物品-->
                    <input type="hidden" name="cmd" value="_xclick">
                    <!-- 收款人账户// -->
                    <input type="hidden" name="business" value="pengxyc_s@163.com">
                    <!-- 购买商品的名称// -->
                    <input type="hidden" name="item_name" value="Beautifu-China">
                    <!-- 购买商品的价格// -->
                    <input type="hidden" name="amount" value="${param.total}">
                    <!--订单号-->
                    <input type="hidden" name="item_number" value="${param.orderNo}">
                    <!-- 交易币种// -->
                    <input type="hidden" name="currency_code" value="USD">
                    <!-- 用于设置目标客户国家所在地// -->
                    <input type="hidden" name="lc" value="US">
                    <!-- 自定义的参数-->
                    <%--<input type="hidden" name="item_number" value="">--%>
                    <input type="hidden" name="rm" value="2">
                    <!--这里告诉paypal付款的通信url,即当客户付款后调用这个url通知系统-->
                    <input type="hidden" name="return"
                           value="http://ec2-52-196-61-182.ap-northeast-1.compute.amazonaws.com">
                    <!--IPN handler -->
                    <input type="hidden" name="notify_url"
                           value="http://ec2-52-196-61-182.ap-northeast-1.compute.amazonaws.com/paypal/ipn">
                    <!--支付的图片-->
                    <input type="image"
                           src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif"
                           border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                    <img alt="" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif"
                         width="1" height="1">

                </form>
            </div>
            <!--End step -->

            <form id="payForm">
                <div id="policy">
                    <h4><spring:message code="CancellationPolicy"/></h4>

                    <div class="form-group">
                        <label><input type="checkbox" name="policy_terms" id="policy_terms">&nbsp;&nbsp;<spring:message
                                code="acceptPolicy"/></label>
                    </div>
                    <input type="button" id="book" class="btn_1 green medium"
                           value="<spring:message code="BOOKNOW"/>"/>

                </div>
            </form>
        </div>
        <!-- 确认信息模态框（Modal） -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">X
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            <spring:message code="bookings_100016"/>
                        </h4>
                    </div>
                    <div class="modal-body" id="modal-body2" style="font-size: 15px;">
                        <spring:message code="payment_100007"/>
                    </div>
                    <div class="modal-body" id="modal-body3" style="font-size: 15px;">
                        <spring:message code="payment_100008"/>
                    </div>
                    <div class="modal-footer">
                        <button id="sure1" type="button" class="btn btn-success" data-dismiss="modal">
                            <spring:message code="bookings_100014"/>
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <aside class="col-md-4">
            <div class="box_style_1">
                <h3 class="inner">- <spring:message code="Summary"/> -</h3>
                <table class="table table_summary">
                    <tbody>
                    <tr>
                        <td>
                            <spring:message code="Adults"/>
                        </td>
                        <td class="text-right" id="adults">${param.adults}</td>
                    </tr>
                    <tr>
                        <td>
                            <spring:message code="Children"/>
                        </td>
                        <td class="text-right" id="children">${param.children}</td>
                    </tr>
                    <tr>
                        <td>
                            <spring:message code="DedicatedTourGuide"/>
                        </td>
                        <td class="text-right">
                            $0
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <spring:message code="Insurance"/>
                        </td>
                        <td class="text-right">
                            $${param.total}
                        </td>
                    </tr>
                    <tr class="total">
                        <td>
                            <spring:message code="TotalCost"/>
                        </td>
                        <td class="text-right">
                            $<span id="total">${param.total}</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="box_style_4">
                <i class="icon_set_1_icon-57"></i>
                <h4><spring:message code="Need"/> <span><spring:message code="Help"/>?</span></h4>
                <a href="javascript:void(0) " class="phone">+45 423 445 99</a>
                <small><spring:message code="Hours"/></small>
            </div>
        </aside>

    </div>
    <!--End row -->
</div>
<!--End container -->
<!-- footer -->
<%@include file="/common/footer.jsp" %>

<%--<!-- Common scripts -->--%>
<%--<%@include file="/common/script.jsp" %>--%>

<!-- Specific scripts -->
<script src="/js/common/icheck.js"></script>

<script src="/js/pay/payment.js"></script>

<script src="/js/common/jquery.validate.js"></script>

<script>
    var agreePolicy = "<spring:message code="agreePolicy"/>";
</script>
</body>
</html>
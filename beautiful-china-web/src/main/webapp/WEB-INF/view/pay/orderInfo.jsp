<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<%@ page language="java" pageEncoding="UTF-8" %>
<!--[if gt IE 9]><!-->
<html> <!--<![endif]-->
<head>



    <title>BEAUTIFUL CHINA</title>

</head>
<% //封装参数
    int a = Integer.parseInt(request.getParameter("adults") != null ? request.getParameter("adults") : "0");
    int b = Integer.parseInt(request.getParameter("children") != null ? request.getParameter("children") : "0");
    int count = a + b;
    //初始化旅客id
    int id = 1;
%>
<style>
    label.msg_error {
        font-size: 12px;
        color: red;
    }
    span.adult {
        font-size: 14px;
        background: #60b7ff;
        padding: 2px;
    }

    span.child {
        font-size: 14px;
        background: #ffb947;
        padding: 2px;
    }
</style>
<!-- header -->
<%@ include file="/common/head.jsp" %>
<%@include file="/common/header.jsp" %>

<script src="/js/pay/orderinfo.js"></script>
<script src="/js/common/icheck.js"></script>
<script src="/js/common/jquery.validate.js"></script>
<script>
    var agreePolicy = "<spring:message code="agreePolicy"/>";
    var notnull = "<spring:message code="required_100000"/>";
    var error_tel_en = "<spring:message code="payment_100001"/>";
    var error_ensure_email = "<spring:message code="payment_100002"/>";
    var orderSuccess = "<spring:message code="payment_100003"/>";
    var orderFail = "<spring:message code="payment_100004"/>";
    var nonlogin = "<spring:message code="payment_100005"/>";
</script>

<script>
    $(document).ready(function () {
        //根据人数动态生成验证条件
        $("#orderForm").validate({
            errorClass: "msg_error",
            rules: {
                policy_terms: {
                    required: true,
                },
                fullname_booking: {
                    required: true,
                },
                telephone_booking: {
                    required: true
                },
                email_booking: {
                    required: true,
                    email: true
                },
                email_booking_2: {
                    required: true,
                    equalTo: "#email_booking"
                },
                <%
                    for(int i = 1; i <= count; i++) {
                %>
                fullName<%=i%>: {
                    required: true
                },
                email<%=i%>: {
                    required: true,
                    email: true
                },
                sex<%=i%>: {
                    required: true
                },
                phone<%=i%>: {
                    required: true
                },
                nationality<%=i%>: {
                    required: true
                },
                passport<%=i%>: {
                    required: true
                },
                childAge<%=i%>: {
                    required: true
                },

                <%
                    }
                %>
            },
            errorPlacement: function (error, element) {
                var p = $("<p />").append(error);
                p.appendTo(element.parent());
            },
            messages: {
                policy_terms: {
                    required: "需要同意相关协议",
                },
                fullname_booking: {
                    required: "不能为空",
                },
                telephone_booking: {
                    required: "不能为空"
                },
                email_booking: {
                    email: "邮箱格式错误",
                    required: "不能为空"

                },
                email_booking_2: {
                    required: "不能为空",
                    email: "邮箱格式错误",
                    equalTo: "邮箱重复校验错误"
                },
                <%
                    for(int i = 1; i <= count; i++) {
                %>
                fullName<%=i%>: {
                    required: "不能为空"
                },
                email<%=i%>: {
                    email: "邮箱格式错误",
                    required: "不能为空"
                },
                sex<%=i%>: {
                    required: "不能为空"
                },
                phone<%=i%>: {
                    required: "不能为空"
                },
                nationality<%=i%>: {
                    required: "不能为空"
                },
                passport<%=i%>: {
                    required: "不能为空"
                },
                childAge<%=i%>: {
                    required: "不能为空"
                },
                <%
                    }
                %>
            }
        });

    });
    //获取所有旅客信息
    function getAllPassenger() {
        var passengers = new Array();
        for (var i = 1; i <=<%=count%>; i++) {
            var fullName = $('#fullName' + i).val();
            var email = $("#email" + i).val();
            var sex = $("#sex" + i).val();
            var phone = $("#phone" + i).val();
            var nationality = $("#nationality" + i).val();
            var passport = $("#passport" + i).val();
            var type = $("#type" + i).val();
            var childType = $("#childAge" + i).val();
            passengers[i - 1] = new passenger(fullName, email, sex, nationality, passport, phone, type, childType);
        }
        return passengers;
    }
</script>
<body>



<!--tourid -->
<input type="hidden" id="tourId" value="${param.tourId}">
<input type="hidden" id="date" value="${param.date}">

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

            <div class="col-xs-4 bs-wizard-step disabled">
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
            <form id="orderForm">

                <div><!--联系人信息 -->
                    <div class="form_title">
                        <h3><strong>1</strong><spring:message code="contactInformation"/></h3>

                    </div>

                    <div class="step">
                        <c:if test="${requestScope.contactVOList != null}">
                            <div class="row">
                                <!--获取常用联系人 -->
                                <div class="col-md-6 col-sm-6">
                                    <label><spring:message code="frequentContacts"/></label><br>
                                    <select class="form-control" onchange="addContact(this);">
                                        <option selected="selected" value=""><spring:message
                                                code="selectContact"/></option>
                                        <c:forEach items="${contactVOList}" var="c">
                                            <option value="${c.firstName} ${c.lastName}^_^${c.sex}^_^${c.nationality}^_^${c.email}^_^${c.address}^_^${c.passport}^_^${c.tel}^_^${c.type}">
                                                    ${c.firstName} ${c.lastName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </c:if>

                        <div class="row">

                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><spring:message code="FullName"/></label>
                                    <input type="text" class="form-control" id="fullname_booking"
                                           name="fullname_booking">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><spring:message code="Telephone"/></label>
                                    <input type="text" id="telephone_booking" name="telephone_booking"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><spring:message code="nationality"/></label>
                                    <input type="text" id="nationality_booking" name="nationality_booking"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <label><spring:message code="Sex"/></label>
                                <select name="sex_booking" id="sex_booking" class="form-control">
                                    <option selected value=""><spring:message code="SexMsg"/></option>
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><spring:message code="passport"/> </label>
                                    <input type="text" id="passport_booking" name="passport_booking"
                                           class="form-control">
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><spring:message code="Address"/></label>
                                    <input type="text" id="address_booking" name="address_booking" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><spring:message code="Email"/></label>
                                    <input type="email" id="email_booking" name="email_booking" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><spring:message code="ConfirmEmail"/></label>
                                    <input type="email" id="email_booking_2" name="email_booking_2"
                                           class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End step -->
                </div>
                <!--联系人信息end -->
                <!--旅客信息 -->
                <div class="form_title">
                    <h3><strong>2</strong><spring:message code="PassengerInformation"/></h3>

                </div>
                <div class="step" style="border: 1px darkgray solid; ">
                    <!--生成成人信息表单-->
                    <c:forEach begin="1" end="${param.adults}">
                        <%
                            if (id != 1) {//第一行不加横线
                        %>
                        <hr>
                        <%
                            }
                        %>
                        <input type="hidden" id="type<%=id%>" name="type<%=id%>" value="adults"/>

                        <div class="row">

                            <div class="col-md-3 col-sm-6">
                                <div class="form-group">
                                    <h4><spring:message code="passenger"/> &nbsp;&nbsp;<%=id%>
                                    </h4>

                                    <div>
                                        <span class="adult"><spring:message code="adult"/> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><spring:message code="FullName"/></label>
                                    <input type="text" id="fullName<%=id%>" name="fullName<%=id%>" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="Email"/></label>
                                    <input type="text" id="email<%=id%>" name="email<%=id%>" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="Sex"/></label>
                                    <select name="sex<%=id%>" id="sex<%=id%>" class="form-control">
                                        <option selected value=""><spring:message code="SexMsg"/></option>
                                        <option value="M">M</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="Phone"/></label>
                                    <input type="text" name="phone<%=id%>" id="phone<%=id%>" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="nationality"/> </label>
                                    <input type="text" id="nationality<%=id%>" name="nationality<%=id%>"
                                           class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="passport"/> </label>
                                    <input type="text" id="passport<%=id%>" name="passport<%=id++%>"
                                           class="form-control">
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!--生成儿童信息表单-->
                    <c:forEach begin="1" end="${param.children}">
                        <%
                            if (id != 1) {//第一行不加横线
                        %>
                        <hr>
                        <%
                            }
                        %>
                        <input type="hidden" name="type<%=id%>" id="type<%=id%>" value="children"/>

                        <div class="row">
                            <div class="col-md-3 col-sm-6">
                                <div class="form-group">
                                    <h4><spring:message code="passenger"/> &nbsp;&nbsp;<%=id%>
                                    </h4>

                                    <div>
                                        <span class="child"><spring:message code="child"/></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><spring:message code="FullName"/></label>
                                    <input type="text" id="fullName<%=id%>" name="fullName<%=id%>" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="Email"/></label>
                                    <input type="text" id="email<%=id%>" name="email<%=id%>" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="ChildrenAge"/> </label>
                                    <select name="childAge<%=id%>" id="childAge<%=id%>" class="form-control">
                                        <option selected value=""><spring:message code="selcetChildAge"/></option>
                                        <option value="A"><spring:message code="0-2yearsold"/></option>
                                        <option value="B"><spring:message code="2-12yearsold"/></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="Sex"/></label>
                                    <select name="sex<%=id%>" id="sex<%=id%>" class="form-control">
                                        <option selected value=""><spring:message code="SexMsg"/></option>
                                        <option value="M">M</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="Phone"/></label>
                                    <input type="text" id="phone<%=id%>" name="phone<%=id%>" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="nationality"/></label>
                                    <input type="text" id="nationality<%=id%>" name="nationality<%=id%>"
                                           class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="passport"/> </label>
                                    <input type="text" id="passport<%=id%>" name="passport<%=id++%>"
                                           class="form-control">
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!--End step -->
                <!--旅客息 end -->
                <div id="policy">
                    <h4><spring:message code="CancellationPolicy"/></h4>

                    <div class="form-group">
                        <label><input type="checkbox" name="policy_terms" id="policy_terms">&nbsp;&nbsp;<spring:message
                                code="acceptPolicy"/></label>
                    </div>
                    <input type="button" id="book2" class="btn_1 green medium"
                           value="<spring:message code="submitOrder"/>"/>
                </div>
            </form>
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
                            <spring:message code="hotel"/>
                        </td>
                        <td class="text-right" id="hotel">${param.children+param.adults}x$0</td>
                    </tr>
                    <%
                        //Option的名字和价格
                        String[] optionNames = request.getParameterValues("optionName");
                        if (optionNames != null) {
                            for (int i = 0; i < optionNames.length; i++) {
                                //String option = new String(optionNames[i].getBytes("iso-8859-1"), "utf-8");
                                String option = optionNames[i];
                                String optionName = option.split("--")[0];
                                String optionPrice = option.split("--")[1];
                    %>
                    <tr>
                        <td><%=optionName%>
                        </td>
                        <td class="text-right">${param.children+param.adults}x$<%=optionPrice%>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    <!--接受线路详情页面传递过来的增值服务valueid和price -->
                    <c:forEach items="${paramValues.optionId}" var="optionId">
                        <input type="hidden" name="option" value="${optionId}">
                    </c:forEach>
                    <tr>
                        <td>
                            <spring:message code="TotalAmount"/>
                        </td>
                        <td class="text-right" id="TotalAmount">
                            <span id="total_person">${param.children+param.adults}
                            </span>x$<span id="tourPrice">${param.tourPrice}</span>
                        </td>
                    </tr>
                    <tr class="total">
                        <td>
                            <spring:message code="TotalCost"/>
                        </td>
                        <td class="text-right">$<span id="total">${param.total}</span></td>
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
<!-- 确认信息模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="margin-top: 5%;">
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
                <spring:message code="payment_100003"/>
            </div>
            <div class="modal-body" id="modal-body3" style="font-size: 15px;">
                <spring:message code="payment_100004"/>
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
<!--End container -->
<!-- footer -->
<%@include file="/common/footer.jsp" %>

<%--<!-- Common scripts -->--%>
<%--<%@include file="/common/script.jsp" %>--%>
<!-- Specific scripts -->

</body>
</html>
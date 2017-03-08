<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->
<head>

    <%@ include file="/common/head.jsp"%>
    <title>BEAUTIFUL CHINA</title>

    <!-- CSS -->
    <!-- Common scripts -->
    <style>
        label.msg_error{
            font-size:11px;
            color:red;
        }
    </style>
</head>
<body>

<!-- Header================================================== -->
<%@ include file="/common/header.jsp"%>

<section id="hero" class="login">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                <div id="login">
                    <div class="text-center"><img src="/img/logo_black.png" alt="" data-retina="true" ></div>
                    <hr>
                    <form method="post" id="registerform">
                        <input type="hidden" value="N" name="type" id="type"/>
                        <div class="form-group">
                            <label><spring:message code="nickName"/></label>
                            <input type="text" class=" form-control" id="nickname" name="nickname" placeholder="<spring:message code="nickName"/>">
                            <label class="msg_error" id="user-info"></label>
                        </div>
                        <div class="form-group">
                            <label><spring:message code="register_100005"/></label>
                            <input type="email" class=" form-control" id="email" name="email" placeholder="<spring:message code="register_100005"/>">
                            <label class="msg_error" id="email-info"></label>
                        </div>
                        <div class="form-group">
                            <label><spring:message code="register_100006"/></label>
                            <input type="password" class=" form-control" id="password1" name="password1" placeholder="<spring:message code="register_100006"/>">
                        </div>
                        <div class="form-group">
                            <label><spring:message code="register_100007"/></label>
                            <input type="password" class=" form-control" id="password2" name="password2" placeholder="<spring:message code="register_100007"/>">
                        </div>
                        <input type="button" id="register" class="btn_full" value="<spring:message code="register_100008"/>" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 确认信息模态框（Modal） -->
<div class="modal fade" id="Message" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog" style="margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">X
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    <spring:message code="bookings_100016"/>
                </h4>
            </div>
            <div class="modal-body" id="Message2">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal" id="Confirm">
                    <spring:message code="bookings_100014"/>
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<!-- footer -->
<%@include file="/common/footer.jsp" %>

<!-- Specific scripts -->
<script src="/js/common/security.js"></script>
<script src="/js/common/jquery.validate.js"></script>
<script src="/js/user/register.js"></script>
<script>
    //错误提示信息内容
    var register_100002 = "<spring:message code="register_100002"/>";
    var register_100003 = "<spring:message code="register_100003"/>";
    var register_100000 = "<spring:message code="register_100000"/>";
    var register_100001 = "<spring:message code="register_100001"/>";
    var required_100000 = "<spring:message code="required_100000"/>";
    var email_100001    = "<spring:message code="email_100001"/>";
    var equalTo_100002  = "<spring:message code="equalTo_100002"/>";
    var minlength_100003= "<spring:message code="minlength_100003"/>";
    //ID选择器
    var nickname      = $("#nickname");
    var usernameinfo = $("#user-info");
    var email         = $("#email");
    var type          = $("#type");
    var emailinfo    = $("#email-info");
    var password     = $("#password1");
    var reg_submit   = $("#register");
</script>
</body>
</html>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html> <!--<![endif]-->
<head>
    <%@ include file="/common/head.jsp" %>
    <title>BEAUTIFUL CHINA</title>
</head>
<body>

<!-- Header================================================== -->
<%@ include file="/common/header.jsp" %>
<section id="hero" class="login">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                <div id="login">
                    <div class="text-center"><img src="/img/logo_black.png" alt="" data-retina="true"></div>
                    <hr>
                    <form id="loginForm">
                        <fieldset>
                            <div class="form-group">
                                <div id="login-check2" class="clearfix"></div>
                                <label><spring:message code="Email"/></label>
                                <input type="text" class=" form-control " id="nickName" name="nickName"
                                       placeholder="<spring:message code="Email"/>" required>
                            </div>
                            <div id="nickname-check" class="clearfix"></div>
                            <div class="form-group">
                                <label><spring:message code="Password"/></label>
                                <input type="password" class=" form-control" id="password" name="password"
                                       placeholder="<spring:message code="Password"/>">
                            </div>
                            <div id="pwd-check" class="clearfix"></div>
                            <p class="small">
                                <a href="forget"><spring:message code="ForgotPwd"/></a>
                            </p>
                            <input type="button" class="btn_full" id="log_in" value="<spring:message code="Login"/>">
                            <a href="register" class="btn_full_outline"><spring:message code="Register"/></a>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer -->
<%@include file="/common/footer.jsp" %>
<script>
    var nullname = "<spring:message code="login_100002"/>";
</script>
<script src="/js/login/login.js"></script>

</body>
</html>
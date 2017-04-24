<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/1/18
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%@include file="/common/head.jsp" %>
  <title>BEAUTIFUL CHINA</title>

  <%--<%@include file="/common/script.jsp" %>--%>
  <style>
    label.msg_error{
      font-size:11px;
      color:red;
    }
  </style>
</head>
<body>

<!-- Header================================================== -->
<%@include file="/common/header.jsp" %>

<section class="login" id="hero">
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
        <div id="login">
          <div class="text-center"><img src="img/logo_black.png" alt="" data-retina="true" ></div>
          <hr>
          <h3><spring:message code="forget_100003"/></h3>
          <div style="color: gray"><spring:message code="forget_100004"/></div><br>
          <form id="sendForm">
            <div class="form-group">
              <label><spring:message code="forget_100005"/></label>
              <input class="form-control" placeholder="<spring:message code="register_100005"/>" id="forget_email" name="forget_email">
              <label id="forget-info" class="msg_error"></label>
            </div>
            <input type="button" id="send_email" value="<spring:message code="forget_100006"/>" class="btn_full"><br>
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

<%@include file="/common/footer.jsp" %>
<script src="js/user/forgot_password.js"></script>
<script>
  var forget_100002   = "<spring:message code="forget_100002"/>";
  var required_100000 = "<spring:message code="required_100000"/>";
  var email_100001    = "<spring:message code="email_100001"/>";
  var forget_100000   = "<spring:message code="forget_100000"/>";
  var forget_100001   = "<spring:message code="forget_100001"/>";

  var forget_email=$("#forget_email");
  var forgetInfo  =$("#forget-info");
  var send_submit =$("#send_email");
  var reg         =/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
</script>
</body>
</html>

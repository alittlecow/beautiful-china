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

  <style>
    label.msg_error{font-size:11px;color:red;}
    .form-control{width:300px;height:35px;}
    .btn_full{width:300px;height:40px;}
  </style>
</head>
<body>

<!-- Header================================================== -->
<%@include file="/common/header.jsp" %>
<section class="login" id="hero">
  <div class="container">
    <div class="row">
      <div id="login">
        <h3><spring:message code="reset_100002"/></h3>
        <div style="color: gray"><spring:message code="reset_100003"/></div>
        <div align="center">
          <table><tr><td>
                <form id="resetForm">
                  <div style="width: 300px;height: 80px"></div>
                  <div class="form-group">
                    <label><spring:message code="reset_100004"/></label>
                    <input id="password1" name="password1" type="password" class="form-control">
                  </div>
                  <div class="form-group">
                    <label><spring:message code="register_100007"/></label>
                    <input id="password2" name="password2" type="password" class="form-control">
                  </div>
                  <input type="button" value="<spring:message code="reset_100005"/>" id="reset_submit" class="btn_full">
                </form>
              </td></tr></table>
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
<input type="hidden" id="email" value="${email}">
<%@include file="/common/footer.jsp" %>
<script src="js/common/jquery.validate.js"></script>
<script src="js/common/security.js"></script>
<script src="js/user/reset_password.js"></script>
<script>
  var reset_100000     = "<spring:message code="reset_100000"/>";
  var reset_100001     = "<spring:message code="reset_100001"/>";
  var required_100000  = "<spring:message code="required_100000"/>";
  var equalTo_100002   = "<spring:message code="equalTo_100002"/>";
  var minlength_100003 = "<spring:message code="minlength_100003"/>";

  var password1   = $("#password1");
  var reset_submit= $("#reset_submit");
  var email   = $("#email").val();
</script>
</body>
</html>

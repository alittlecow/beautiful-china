<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->
<head>
    <base target="_self">
    <%@ include file="/common/head.jsp" %>
    <title>CITY TOURS - City tours and travel site template by Ansonika</title>

    <!-- CSS -->
    <!-- Common scripts -->
    <style>
        label.msg_error {
            font-size: 11px;
            color: red;
        }

        input::-webkit-input-placeholder {
            /* WebKit browsers */
            line-height: 1em;
        }

        label.title {
            font-size: 15px;
            font-style: italic;
        }

        span.agentIn {
            color: red;
            font-size: 25px;
            font-weight: bold;
            font-style: italic;
        }

        input:-moz-placeholder {
            /* Mozilla Firefox 4 to 18 */
            line-height: 1em;
        }

        input::-moz-placeholder {
            /* Mozilla Firefox 19+ */
            line-height: 1em;
        }

        input:-ms-input-placeholder {
            /* Internet Explorer 10+ */
            line-height: 1em;
        }

        @media only screen
        and (min-device-width: 320px)
        and (max-device-width: 1024px) {
            select:focus,
            textarea:focus,
            input:focus {
                font-size: 16px !important;
            }

            input::-webkit-input-placeholder {
                font-size: 14px;
            }

            textarea::-webkit-input-placeholder {
                font-size: 14px;
            }
        }

    </style>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Header================================================== -->
<%@ include file="/common/header.jsp" %>
<section id="hero" class="login">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-4 col-sm-offset-2">
                <div id="login">
                        <div class="text-center"><img src="/img/logo_black.png" alt="" data-retina="true"><span
                            class="agentIn"><spring:message code="agentIn"/></span></div>
                    <hr>
                    <form id="agentRegister">
                        <div class="col-md-12 col-sm-12 ">
                            <div class="col-md-12 col-sm-12 ">
                                <label class="title">1. <spring:message code="completeInfor"/></label><br>
                            </div>
                            <br>

                            <div class="col-md-6 col-sm-12 ">
                                <div class="form-group">
                                    <label><spring:message code="agentName"/></label>
                                    <input type="text" class=" form-control" id="agentName" name="agentName"
                                           placeholder="<spring:message code="agentName"/>">
                                </div>
                                <%--<div class="form-group">--%>
                                    <%--<label><spring:message code="supplierNameFr"/></label>--%>
                                    <%--<input type="text" class=" form-control" id="supplierNameFr" name="supplierNameFr"--%>
                                           <%--placeholder="<spring:message code="supplierNameFr"/>">--%>
                                <%--</div>--%>
                                <div class="form-group">
                                    <label><spring:message code="contactsFirstName"/></label>
                                    <input type="text" class=" form-control" id="connectFirstName" name="connectFirstName"
                                           placeholder="<spring:message code="contactsFirstName"/>">

                                </div>
                                <div class="form-group">
                                    <label><spring:message code="telephone"/></label>
                                    <input type="text" class=" form-control" id="telephone" name="telephone"
                                           placeholder="<spring:message code="telephone"/>">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="telephone2"/></label>
                                    <input type="text" class=" form-control" id="telephone2" name="telephone2"
                                           placeholder="<spring:message code="telephone2"/>">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12 ">
                                <div class="form-group">
                                    <label><spring:message code="agentAddress"/></label>
                                    <input type="text" class=" form-control" id="agentAddress" name="agentAddress"
                                           placeholder="<spring:message code="agentAddress"/>">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="contactsLastName"/></label>
                                    <input type="text" class=" form-control" id="connectLastName" name="connectLastName"
                                           placeholder="<spring:message code="contactsLastName"/>">
                                </div>
                                <%--<div class="form-group">--%>
                                    <%--<label><spring:message code="suppliercontact"/></label>--%>
                                    <%--<input type="text" class=" form-control" id="contact" name="contact"--%>
                                           <%--placeholder="<spring:message code="suppliercontact"/>">--%>
                                <%--</div>--%>
                                <div class="form-group">
                                    <label><spring:message code="Email"/></label>
                                    <input type="email" class=" form-control" id="agentEmail" name="agentEmail"
                                           placeholder="<spring:message code="Email"/>">
                                    <label class="msg_error" id="email-info"></label>
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="cardNumber"/></label>
                                    <input type="text" class=" form-control" id="cardNumber" name="cardNumber"
                                           placeholder="<spring:message code="cardNumber"/>">
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label><spring:message code="agentDescription"/></label>
                                <textarea rows="5" id="description" name="description" class="form-control"
                                          placeholder="<spring:message code="agentDescription"/>"
                                          style="height:200px;"></textarea>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 ">
                                <label class="title">2. <spring:message code="loginInfo"></spring:message> </label><br>
                            </div>
                            <br>

                            <div class="col-md-6 col-sm-12 ">
                                <%--<div class="form-group">--%>
                                    <%--<label><spring:message code="deptCode"/></label>--%>
                                    <%--<input type="text" class=" form-control" id="deptCode" name="deptCode"--%>
                                           <%--placeholder="<spring:message code="deptCode"/>">--%>
                                    <%--<label class="msg_error" id="code-info"></label>--%>
                                <%--</div>--%>
                                <div class="form-group">
                                    <label><spring:message code="Password"/></label>
                                    <input type="password" class=" form-control" id="password1" name="password1"
                                           placeholder="<spring:message code="Password"/>">
                                </div>
                                <div class="form-group">
                                    <label><spring:message code="confirmPassword"/></label>
                                    <input type="password" class=" form-control" id="password2" name="password2"
                                           placeholder="<spring:message code="confirmPassword"/>">
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="checkbox" id="agreeRule" name="agreeRule" height="13px"
                                       style="vertical-align:text-top;margin-top: 0 ">&nbsp; <spring:message
                                    code="iread"/> <a href="javascript:void(0);" data-toggle="modal"  data-target="#agreement" id="readAndAgree">"<spring:message
                                    code="agreement"/>"</a>
                            </div>
                        </div>

                        <div align="right">
                            <input type="button" id="registerAgent" class="btn_1"
                                   value="<spring:message code="submit"/>"/>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 模态框（Modal） -->
<div class="modal fade" id="agreement" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"  style="margin-top: 6%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 align="center" class="modal-title">
                    <spring:message code="agreement"/>
                </h4>
            </div>
            <div class="modal-body">
                <div id="registrationAgreement" style="overflow: auto;height: 350px;">
                </div>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="agreeAndContinue();">
                    <spring:message code="agreeandContinue"/>
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
<!-- 确认信息模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
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
            <div class="modal-body" id="modal-body2">
                <spring:message code="question_answer_100004"/>
            </div>
            <div class="modal-body" id="modal-body3">
                <spring:message code="question_answer_100005"/>
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
<!-- /.modal -->
<!-- footer -->
<%@include file="/common/footer.jsp" %>

<!-- Specific scripts -->
<script src="/js/common/security.js"></script>
<script src="/js/common/jquery.validate.js"></script>
<script src="/js/agentin/agentin.js"></script>
<script>
    var notnull = "<spring:message code="required_100000"/>";
    var readAndAgree = "<spring:message code="readAndAgree"/>";
    var passwordNotSame = "<spring:message code="equalTo_100002"/>"
    var uniqueCode = "<spring:message code="suppliersin_10001"/>";
    var minlength_100003 = "<spring:message code="minlength_100003"/>";
    var uniqueEmail = "<spring:message code="register_100003"/>";
</script>

</body>
</html>
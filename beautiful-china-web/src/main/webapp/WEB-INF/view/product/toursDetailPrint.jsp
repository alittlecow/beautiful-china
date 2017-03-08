<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html> <!--<![endif]-->
<head>
    <title>BEAUTIFUL CHINA</title>
    <%@ include file="/common/head.jsp" %>
    <!-- CSS -->
    <link href="/css/toursdetail/date_time_picker.css" rel="stylesheet">
    <link href="/css/slider-pro.min.css" rel="stylesheet">

    <%--<%@include file="/common/script.jsp" %>--%>

    <script>

        var theDay = "<spring:message code="day"/>";
        var ticket_remain = "<spring:message code="remain"/>";
        var destinations = "<spring:message code="Destinations"/>";
        var hotel = "<spring:message code="hotel"/>";
        var transport = "<spring:message code="transport"/>";
        var meals = "<spring:message code="meals"/>";
        var payment_100006 = "<spring:message code="payment_100006"/>";
    </script>
</head>
<style>
    body {
        font-size: 14px;
    }

    b {
        font-size: 16px;
    }
</style>
<body>
<!-- 获取来着请求中的线路id -->
<input type="hidden" value="${tourId}" id="tourId">


        <div style="padding:20px 0 50px  20px" >
            <div class="row">
                <div class="col-md-3 col-md-offset-9"><button type="button" class="btn btn-primary btn-lg" onclick="printText()"><spring:message code="print"/></button></div>
            </div>
            <div id="printText">
                <h3><spring:message code="Description"/></h3><br/>
                <div class="dayTourBox">
                </div>
            </div>

        </div>

<script>


</script>
<!-- Specific scripts -->
<script src="/js/common/icheck.js"></script>
<script>
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-grey',
        radioClass: 'iradio_square-grey'
    });
</script>

<!-- Date and time pickers -->
<script src="/js/toursdetail/toursDetailPrint.js"></script>
<script src="/js/common/bootstrap.js"></script>
<script src="/js/common/jquery.PrintArea.js"></script>
</body>
</html>

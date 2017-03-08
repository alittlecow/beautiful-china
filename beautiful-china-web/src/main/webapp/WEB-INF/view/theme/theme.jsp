<%@ page import="com.beautifulchina.destination.bo.DestinationBO" %>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->

<head>
    <%@ include file="/common/head.jsp" %>
    <%@ page import="com.beautifulchina.theme.bo.ThemeBO" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.io.PrintWriter" %>
    <title>BEAUTIFUL CHINA - ${theme.title}</title>

    <!-- REVOLUTION SLIDER CSS -->
    <link href="/rs-plugin/css/settings.css" rel="stylesheet">
    <link href="/css/extralayers.css" rel="stylesheet">
    <%--下面三个文件是分页功能必须引用的--%>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="/js/paging/jquery.twbsPagination.js" type="text/javascript"></script>
    <script src="/js/product/theme.js" type="text/javascript"></script>

</head>

<body>

<!-- Header================================================== -->
<%@ include file="/common/header.jsp" %>

<!-- Slider -->
<div class="tp-banner-container">
    <div class="tp-banner">
        <ul>

            <li data-transition="fade" id="photoOne">
                <!-- MAIN IMAGE -->
                <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${theme.photoOne}>
            </li>
            <!-- SLIDE  -->
            <li data-transition="fade" id="photoTwo">
                <!-- MAIN IMAGE -->
                <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${theme.photoTwo}>
            </li>

            <li data-transition="fade" id="photoThree">
                <!-- MAIN IMAGE -->
                <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${theme.photoThree}>
            </li>

            <li data-transition="fade" id="photoFour">
                <!-- MAIN IMAGE -->
                <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${theme.photoFour}>
            </li>

        </ul>
        <div class="tp-bannertimer tp-bottom"></div>
    </div>
</div>

<div class="container margin_60">
    <div class="col-md-12 col-sm-12">
        <div style="padding: 0 15px 0 15px;background-color: inherit">
            <h1>${theme.title} </h1>
            <hr>
            <p class="lead" style="line-height: normal">${theme.desc}

            </p>
        </div>
        <br>
        <br>
        <br>
    </div>

    <div class="col-md-12 col-sm-12" id="allTours">
        <!-- 循环输入6条线路的图片,标题,价格 -->
        <%--<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.1s">--%>
        <%--<div class="tour_container">--%>
        <%--<div class="img_container">--%>
        <%--<a href="/toursdetail/${tour.tourId}">--%>
        <%--<img src="${tour.image}" class="img-responsive"  width="358" height="258" alt="">--%>
        <%--<div class="ribbon popular"></div>--%>
        <%--<div class="short_info">--%>
        <%--<span class="price"><sup>$</sup>--%>
        <%--<fmt:formatNumber value="${tour.price}"/>--%>
        <%--</span>--%>
        <%--</div>--%>
        <%--</a>--%>
        <%--</div>--%>
        <%--<div class="tour_title">--%>
        <%--<h3><strong>${tour.title}</strong> tour</h3>--%>
        <%--</div>--%>
        <%--</div><!-- End box tour -->--%>
        <%--</div><!-- End col-md-4 -->--%>
    </div>
    <!-- End row -->
</div>
<input value="${total}" id="total" type="text" hidden="hidden">
<input value="${theme.id}" id="themeId" type="text" hidden="hidden">


<div id="content-wrapper">
    <div class="inner clearfix">
        <section id="main-content">
            <div class="text-center">
                <ul id="visible-pages-example"></ul>
            </div>
        </section>
    </div>
</div>
<!-- footer -->
<%@include file="/common/footer.jsp" %>
<!-- Common scripts -->


<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script src="/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script src="/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script src="/js/common/revolution_func.js"></script>
</body>

</html>
<%@ page import="com.beautifulchina.destination.bo.DestinationBO" %>
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
    <%@page import="com.beautifulchina.destination.bo.DestinationBO"%>
    <%@ page import="java.io.PrintWriter" %>
    <title>BEAUTIFUL CHINA</title>

    <!-- REVOLUTION SLIDER CSS -->
    <link href="/rs-plugin/css/settings.css" rel="stylesheet">
    <link href="/css/extralayers.css" rel="stylesheet">

    <%--下面三个文件是分页功能必须引用的--%>
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="/js/paging/jquery.twbsPagination.js" type="text/javascript"></script>
    <script src="/js/product/destination.js" type="text/javascript"></script>



</head>

<body>

    <!-- Header================================================== -->
    <%@ include file="/common/header.jsp"%>

    <!-- Slider -->
    <div class="tp-banner-container">
        <div class="tp-banner">
            <ul>

                <li data-transition="fade" id="photoOne">
                     <!-- MAIN IMAGE -->
                    <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${destination.photoOne} >
                </li>
                <!-- SLIDE  -->
                <li data-transition="fade" id="photoTwo">
                    <!-- MAIN IMAGE -->
                    <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${destination.photoTwo} >
                </li>

                <li data-transition="fade"  id="photoThree">
                    <!-- MAIN IMAGE -->
                    <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${destination.photoThree}>
                </li>

                <li data-transition="fade"  id="photoFour">
                    <!-- MAIN IMAGE -->
                    <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${destination.photoFour} >
                </li>

            </ul>
            <div class="tp-bannertimer tp-bottom"></div>
        </div>
    </div>
    <!-- End Slider -->
    <div class="container margin_60">

        <div style="padding: 0 15px 0 15px;background-color: inherit">
            <h1>${destination.title} </h1><hr>
            <p class="lead" style="line-height: normal">${destination.desc}
            </p>
        </div>
        <br><br><br>
        <div class="row" id="allTours">



    </div><!-- End row -->
    </div>
    <input value="${total}" id="total" type="text" hidden="hidden">
    <input value="${destination.cityId}" id="cityId" type="text" hidden="hidden">

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
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

    <!-- REVOLUTION SLIDER CSS -->
    <link href="/rs-plugin/css/settings.css" rel="stylesheet">
    <link href="/css/extralayers.css" rel="stylesheet">



</head>

<body>

<!-- Header================================================== -->
<%@ include file="/common/header.jsp"%>

        <!-- Slider -->
        <div class="tp-banner-container">
            <div class="tp-banner">
                <ul>
                    <c:forEach var="banner" items="${bannerList}">
                    <li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Intro Slide">
                        <img src="img/slides_bg/dummy.png" alt="slidebg1" data-lazyload="${banner.image}" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                    </li>
                    </c:forEach>
                    <%--<li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Intro Slide">
                        <img src="img/slides_bg/dummy.png" alt="slidebg1" data-lazyload="img/slides_bg/slide_2.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                    </li>
                    <li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Intro Slide">
                        <img src="img/slides_bg/dummy.png" alt="slidebg1" data-lazyload="img/slides_bg/slide_3.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                    </li>
                    <li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Intro Slide">
                        <img src="img/slides_bg/dummy.png" alt="slidebg1" data-lazyload="img/slides_bg/slide_4.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                    </li>--%>
                </ul>
                <div class="tp-bannertimer tp-bottom"></div>
            </div>
        </div>
        <!-- End Slider -->

        <div class="container margin_60">

            <div class="main_title">
                <h2> <span>Most</span> Popular</h2>
                <p>What are China's most popular lines, waiting for start your trip</p>
            </div>

            <div class="row">
                <!-- 循环输入6条线路的图片,标题,价格 -->
                <c:forEach var="tour" items="${tourList}" varStatus="status">
                    <div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.${status.count}s">
                        <div class="tour_container">
                            <div class="img_container">
                                <a href="/toursdetail/${tour.tourId}">
                                    <img src="${tour.image}" class="img-responsive"  width="358" height="258" alt="">
                                    <div class="ribbon popular"></div>
                                    <div class="short_info">
                                        <span class="price"><sup>$</sup>
                                            <fmt:formatNumber value="${tour.price}"/>
                                        </span>
                                    </div>
                                </a>
                            </div>
                            <div class="tour_title">
                                <h3><strong>${tour.title}
                            </div>
                        </div><!-- End box tour -->
                    </div><!-- End col-md-4 -->
                </c:forEach>

            </div><!-- End row -->
            <p class="text-center add_bottom_30">
                <a href="/toursList" class="btn_1 medium"><i class="icon-eye-7"></i>View all tours</a>
            </p>

            <hr>

            <div class="main_title">
                <h2> <span></span> Themes</h2>
                <p>With Chinese characteristics in the theme</p>
            </div>

            <div class="row">
                <c:forEach var="theme" items="${themeList}" varStatus="status">
                    <div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.${status.count}s">
                        <div class="tour_container">
                            <div class="img_container">
                                <a href="/theme/detail?id=${theme.id}">
                                    <img src="${theme.image}" class="img-responsive"  width="358" height="258" alt="">
                                </a>
                            </div>
                            <div class="tour_title">
                                <h3><strong>${theme.title}
                                    <%--<div class="rating">--%>
                                    <%--<i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile"></i><small>(75)</small>--%>
                                    <%--</div><!-- end rating -->--%>
                                    <%--<div class="wishlist">--%>
                                    <%--<a class="tooltip_flip tooltip-effect-1" href="javascript:void(0);">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>--%>
                                    <%--</div><!-- End wish list-->--%>
                            </div>
                        </div><!-- End box tour -->
                    </div><!-- End col-md-4 -->
                </c:forEach>
                <%--<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.2s">--%>
                    <%--<div class="hotel_container">--%>
                        <%--<div class="img_container">--%>
                            <%--<a href="single_hotel.html">--%>
                                <%--<img src="img/hotel_2.jpg"  width="800" height="533" class="img-responsive" alt="">--%>
                                <%--<div class="ribbon top_rated"></div>--%>
                                <%--<div class="score"><span>9.0</span>Superb</div>--%>
                                <%--<div class="short_info hotel">--%>
                                    <%--From/Per night<span class="price"><sup>$</sup>45</span>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</div>--%>
                        <%--<div class="hotel_title">--%>
                            <%--<h3><strong>Mariott</strong> Hotel</h3>--%>
                            <%--<div class="rating">--%>
                                <%--<i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star-empty"></i>--%>
                            <%--</div><!-- end rating -->--%>
                            <%--<div class="wishlist">--%>
                                <%--<a class="tooltip_flip tooltip-effect-1" href="#">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>--%>
                            <%--</div><!-- End wish list-->--%>
                        <%--</div>--%>
                    <%--</div><!-- End box -->--%>
                <%--</div><!-- End col-md-4 -->--%>

                <%--<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.3s">--%>
                    <%--<div class="hotel_container">--%>
                        <%--<div class="img_container">--%>
                            <%--<a href="single_hotel.html">--%>
                                <%--<img src="img/hotel_3.jpg"  width="800" height="533" class="img-responsive" alt="">--%>
                                <%--<div class="ribbon top_rated"></div>--%>
                                <%--<div class="score"><span>9.5</span>Superb</div>--%>
                                <%--<div class="short_info hotel">--%>
                                    <%--From/Per night<span class="price"><sup>$</sup>39</span>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</div>--%>
                        <%--<div class="hotel_title">--%>
                            <%--<h3><strong>Lumiere</strong> Hotel</h3>--%>
                            <%--<div class="rating">--%>
                                <%--<i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star-empty"></i>--%>
                            <%--</div><!-- end rating -->--%>
                            <%--<div class="wishlist">--%>
                                <%--<a class="tooltip_flip tooltip-effect-1" href="#">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>--%>
                            <%--</div><!-- End wish list-->--%>
                        <%--</div>--%>
                    <%--</div><!-- End box -->--%>
                <%--</div><!-- End col-md-4 -->--%>

                <%--<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.4s">--%>
                    <%--<div class="hotel_container">--%>
                        <%--<div class="img_container">--%>
                            <%--<a href="single_hotel.html">--%>
                                <%--<img src="img/hotel_4.jpg" width="800" height="533" class="img-responsive" alt="">--%>
                                <%--<div class="ribbon popular"></div>--%>
                                <%--<div class="score"><span>7.5</span>Good</div>--%>
                                <%--<div class="short_info hotel">--%>
                                    <%--From/Per night<span class="price"><sup>$</sup>45</span>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</div>--%>
                        <%--<div class="hotel_title">--%>
                            <%--<h3><strong>Novelle</strong> Hotel</h3>--%>
                            <%--<div class="rating">--%>
                                <%--<i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star-empty"></i>--%>
                            <%--</div><!-- end rating -->--%>
                            <%--<div class="wishlist">--%>
                                <%--<a class="tooltip_flip tooltip-effect-1" href="javascript:void(0);">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>--%>
                            <%--</div><!-- End wish list-->--%>
                        <%--</div>--%>
                    <%--</div><!-- End box -->--%>
                <%--</div><!-- End col-md-4 -->--%>

                <%--<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.5s">--%>
                    <%--<div class="hotel_container">--%>
                        <%--<div class="img_container">--%>
                            <%--<a href="single_hotel.html">--%>
                                <%--<img src="img/hotel_5.jpg"  width="800" height="533" class="img-responsive" alt="">--%>
                                <%--<div class="ribbon top_rated"></div>--%>
                                <%--<div class="score"><span>8.0</span>Good</div>--%>
                                <%--<div class="short_info hotel">--%>
                                    <%--From/Per night<span class="price"><sup>$</sup>39</span>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</div>--%>
                        <%--<div class="hotel_title">--%>
                            <%--<h3><strong>Louvre</strong> Hotel</h3>--%>
                            <%--<div class="rating">--%>
                                <%--<i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star-empty"></i>--%>
                            <%--</div><!-- end rating -->--%>
                            <%--<div class="wishlist">--%>
                                <%--<a class="tooltip_flip tooltip-effect-1" href="#">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>--%>
                            <%--</div><!-- End wish list-->--%>
                        <%--</div>--%>
                    <%--</div><!-- End box -->--%>
                <%--</div><!-- End col-md-4 -->--%>

                <%--<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.6s">--%>
                    <%--<div class="hotel_container">--%>
                        <%--<div class="img_container">--%>
                            <%--<a href="single_hotel.html">--%>
                                <%--<img src="img/hotel_6.jpg" width="800" height="533" class="img-responsive" alt="">--%>
                                <%--<div class="ribbon popular"></div>--%>
                                <%--<div class="score"><span>8.5</span>Superb</div>--%>
                                <%--<div class="short_info hotel">--%>
                                    <%--From/Per night<span class="price"><sup>$</sup>45</span>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</div>--%>
                        <%--<div class="hotel_title">--%>
                            <%--<h3><strong>Concorde</strong> Hotel</h3>--%>
                            <%--<div class="rating">--%>
                                <%--<i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star-empty"></i>--%>
                            <%--</div><!-- end rating -->--%>
                            <%--<div class="wishlist">--%>
                                <%--<a class="tooltip_flip tooltip-effect-1" href="javascript:void(0);">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>--%>
                            <%--</div><!-- End wish list-->--%>
                        <%--</div>--%>
                    <%--</div><!-- End box -->--%>
                <%--</div><!-- End col-md-4 -->--%>

            </div><!-- End row -->
            <%--<p class="text-center nopadding">--%>
                <%--<a href="all_hotels_list.html" class="btn_1 medium"><i class="icon-eye-7"></i>View all themes </a>--%>
            <%--</p>--%>
        </div><!-- End container -->

        <div class="white_bg">
            <div class="container margin_60">

                <div class="main_title">
                    <h2> <span></span> <spring:message code="Cities"/> </h2>
                    <p><spring:message code="CitiesIntro"/> </p>
                </div>

                <div class="row">
                    <c:forEach var="city" items="${indexCityVOList}" varStatus="status">
                        <div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.${status.count}s">
                            <div class="tour_container">
                                <div class="img_container">
                                    <%--<!-- url加密-->--%>
                                    <%--<script src="/js/common/base64.js"></script>--%>
                                    <%--<script language="javascript">--%>
                                        <%--document.write('<a href="/city/detail?id='+hex_md5(${city.id})+'"><img src="${city.image}" class="img-responsive"  width="358" height="258" alt=""> </a>');--%>
                                    <%--</script>--%>
                                    <a href="/city/detail?id=${city.id}">
                                        <img src="${city.image}" class="img-responsive"  width="358" height="258" alt="">
                                    </a>
                                </div>
                                <div class="tour_title">
                                    <h3><strong>${city.name} </h3>

                                </div>
                            </div><!-- End box cities -->
                        </div><!-- End col-md-4 -->
                    </c:forEach>
                </div>
                <p class="text-center add_bottom_30">
                    <a href="/geoMap" class="btn_1 medium"><i class="icon-eye-7"></i>View all cities</a>
                </p>
                <%--<div class="main_title">--%>
                    <%--<h2>Other <span>Popular</span> tours</h2>--%>
                    <%--<p>--%>
                        <%--Quisque at tortor a libero posuere laoreet vitae sed arcu. Curabitur consequat.--%>
                    <%--</p>--%>
                <%--</div>--%>
                <%--<div class="row add_bottom_45">--%>
                    <%--<div class="col-md-4 other_tours">--%>
                        <%--<ul>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-3"></i>Tour Eiffel<span class="other_tours_price">$42</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-30"></i>Shopping tour<span class="other_tours_price">$35</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-44"></i>Versailles tour<span class="other_tours_price">$20</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-3"></i>Montparnasse skyline<span class="other_tours_price">$26</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-44"></i>Pompidue<span class="other_tours_price">$26</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-3"></i>Senna River tour<span class="other_tours_price">$32</span></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-4 other_tours">--%>
                        <%--<ul>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-1"></i>Notredame<span class="other_tours_price">$48</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-4"></i>Lafaiette<span class="other_tours_price">$55</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-30"></i>Trocadero<span class="other_tours_price">$76</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-3"></i>Open Bus tour<span class="other_tours_price">$55</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-30"></i>Louvre museum<span class="other_tours_price">$24</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-3"></i>Madlene Cathedral<span class="other_tours_price">$24</span></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-4 other_tours">--%>
                        <%--<ul>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-37"></i>Montparnasse<span class="other_tours_price">$36</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-1"></i>D'Orsey museum<span class="other_tours_price">$28</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-50"></i>Gioconda Louvre musuem<span class="other_tours_price">$44</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-44"></i>Tour Eiffel<span class="other_tours_price">$56</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-50"></i>Ladefanse<span class="other_tours_price">$16</span></a>--%>
                            <%--</li>--%>
                            <%--<li><a href="#"><i class="icon_set_1_icon-44"></i>Notredame<span class="other_tours_price">$26</span></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                <%--</div><!-- End row -->--%>

                <%--<div class="banner colored">--%>
                    <%--<h4>Discover our Top tours <span>from $34</span></h4>--%>
                    <%--<p>--%>
                        <%--Lorem ipsum dolor sit amet, vix erat audiam ei. Cum doctus civibus efficiantur in.--%>
                    <%--</p>--%>
                    <%--<a href="single_tour.html" class="btn_1 white">Read more</a>--%>
                <%--</div>--%>



                <%--<div align="middle"><h2><span><spring:message code="Firsttour"/></span> <spring:message code="trips"/></h2></div>--%>
                <%--<div class="row">--%>
                    <%--<div class="col-md-3 col-sm-6 text-center">--%>
                        <%--<p>--%>
                            <%--<a href="#"><img src="img/bus.jpg" alt="Pic" class="img-responsive"></a>--%>
                        <%--</p>--%>
                        <%--<h4><span>Sightseen tour</span> booking</h4>--%>
                        <%--<p>--%>
                            <%--Lorem ipsum dolor sit amet, vix erat audiam ei. Cum doctus civibus efficiantur in. Nec id tempor imperdiet deterruisset, doctus volumus explicari qui ex.--%>
                        <%--</p>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-3 col-sm-6 text-center">--%>
                        <%--<p>--%>
                            <%--<a href="#"><img src="img/transfer.jpg" alt="Pic" class="img-responsive"></a>--%>
                        <%--</p>--%>
                        <%--<h4><span>Transfer</span> booking</h4>--%>
                        <%--<p>--%>
                            <%--Lorem ipsum dolor sit amet, vix erat audiam ei. Cum doctus civibus efficiantur in. Nec id tempor imperdiet deterruisset, doctus volumus explicari qui ex.--%>
                        <%--</p>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-3 col-sm-6 text-center">--%>
                        <%--<p>--%>
                            <%--<a href="#"><img src="img/guide.jpg" alt="Pic" class="img-responsive"></a>--%>
                        <%--</p>--%>
                        <%--<h4><span>Tour guide</span> booking</h4>--%>
                        <%--<p>--%>
                            <%--Lorem ipsum dolor sit amet, vix erat audiam ei. Cum doctus civibus efficiantur in. Nec id tempor imperdiet deterruisset, doctus volumus explicari qui ex.--%>
                        <%--</p>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-3 col-sm-6 text-center">--%>
                        <%--<p>--%>
                            <%--<a href="#"><img src="img/hotel.jpg" alt="Pic" class="img-responsive"></a>--%>
                        <%--</p>--%>
                        <%--<h4><span>Hotel</span> booking</h4>--%>
                        <%--<p>--%>
                            <%--Lorem ipsum dolor sit amet, vix erat audiam ei. Cum doctus civibus efficiantur in. Nec id tempor imperdiet deterruisset, doctus volumus explicari qui ex.--%>
                        <%--</p>--%>
                    <%--</div>--%>
                <%--</div><!-- End row -->--%>
                <div class="row">
                    <!-- 循环输入6条线路的图片,标题,价格 -->
                    <%--<c:forEach var="tour" items="${tourListFirst}" varStatus="status">--%>
                        <%--<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.${status.count}s">--%>
                            <%--<div class="tour_container">--%>
                                <%--<div class="img_container">--%>
                                    <%--<a href="/toursdetail/${tour.tourId}">--%>
                                        <%--<img src="${tour.image}" class="img-responsive"  width="358" height="258" alt="">--%>
                                        <%--&lt;%&ndash;<div class="ribbon popular"></div>&ndash;%&gt;--%>
                                        <%--<div class="short_info">--%>
                                        <%--<span class="price"><sup>$</sup>--%>
                                            <%--<fmt:formatNumber value="${tour.price}"/>--%>
                                        <%--</span>--%>
                                        <%--</div>--%>
                                    <%--</a>--%>
                                <%--</div>--%>
                                <%--<div class="tour_title">--%>
                                    <%--<h3><strong>${tour.title}</strong> tour</h3>--%>
                                        <%--&lt;%&ndash;<div class="rating">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile"></i><small>(75)</small>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</div><!-- end rating -->&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<div class="wishlist">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<a class="tooltip_flip tooltip-effect-1" href="javascript:void(0);">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</div><!-- End wish list-->&ndash;%&gt;--%>
                                <%--</div>--%>
                            <%--</div><!-- End box tour -->--%>
                        <%--</div><!-- End col-md-4 -->--%>
                    <%--</c:forEach>--%>

                </div>
            </div><!-- End container -->
        </div><!-- End white_bg -->

        <section class="promo_full">
            <div class="promo_full_wp magnific">
                <div>
                    <h3>BELONG ANYWHERE</h3>
                    <p>
                        Lorem ipsum dolor sit amet, vix erat audiam ei. Cum doctus civibus efficiantur in. Nec id tempor imperdiet deterruisset, doctus volumus explicari qui ex.
                    </p>
                    <a href="https://www.youtube.com/watch?v=Zz5cu72Gv5Y" class="video"><i class="icon-play-circled2-1"></i></a>
                </div>
            </div>
        </section><!-- End section -->

        <div class="container margin_60">

            <div class="main_title">
                <h2>Some <span>good</span> reasons</h2>
                <%--<p>--%>
                    <%--Quisque at tortor a libero posuere laoreet vitae sed arcu. Curabitur consequat.--%>
                <%--</p>--%>
            </div>

            <div class="row">

                <div class="col-md-4 wow zoomIn" data-wow-delay="0.2s">
                    <div class="feature_home">
                        <i class="icon_set_1_icon-41"></i>
                        <h3><span>+120</span> Premium tours</h3>
                        <p>
                            <spring:message code="content1"/>
                        </p>
                        <a href="about.html" class="btn_1 outline">Read more</a>
                    </div>
                </div>

                <div class="col-md-4 wow zoomIn" data-wow-delay="0.4s">
                    <div class="feature_home">
                        <i class="icon_set_1_icon-30"></i>
                        <h3><span>+1000</span> <spring:message code="Customers"/></h3>
                        <p>
                            <spring:message code="content2"/> </p>
                        <a href="about.html" class="btn_1 outline">Read more</a>
                    </div>
                </div>

                <div class="col-md-4 wow zoomIn" data-wow-delay="0.6s">
                    <div class="feature_home">
                        <i class="icon_set_1_icon-57"></i>
                        <h3><span>H24 </span> <spring:message code="Support"/> </h3>
                        <p>
                            <spring:message code="content3"/></p>
                        <a href="about.html" class="btn_1 outline">Read more</a>
                    </div>
                </div>

            </div><!--End row -->

            <hr>

            <div class="row">
                <div class="col-md-8 col-sm-6 hidden-xs">
                    <img src="img/laptop.jpg" alt="Laptop" class="img-responsive laptop">
                </div>
                <div class="col-md-4 col-sm-6">
                    <h3><span> <spring:message code="Getstarted"/></span><spring:message code="withus"/></h3>
                    <p>
                        <spring:message code="content4"/></p>
                    <ul class="list_order">
                        <li><span>1</span><spring:message code="selecttour"/></li>
                        <li><span>2</span><spring:message code="bugticket"/></li>
                        <li><span>3</span><spring:message code="Pick"/></li>
                    </ul>
                    <a href="/toursList" class="btn_1"><spring:message code="Startnow"/></a>
                </div>
            </div><!-- End row -->

        </div><!-- End container -->
        <!-- footer -->
        <%@include file="/common/footer.jsp" %>

        <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
        <script src="rs-plugin/js/jquery.themepunch.tools.min.js"></script>
        <script src="rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
        <script src="js/common/revolution_func.js"></script>

    </body>

</html>

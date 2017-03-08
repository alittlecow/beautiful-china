<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html> <!--<![endif]-->
<head>
    <%@ include file="/common/head.jsp"%>
    <title>BEAUTIFUL CHINA - <spring:message code="AboutUs"/></title>

</head>
<body>
    <!-- Header================================================== -->
    <%@ include file="/common/header.jsp"%>

<section class="parallax-window" data-parallax="scroll" data-image-src="img/header_bg.jpg" data-natural-width="1400" data-natural-height="470">

</section><!-- End Section -->

<div id="position">
    <div class="container">
        <ul>
            <li><a href="#"><spring:message code="information_100004"/></a></li>

           <li><a href="#"><spring:message code="about_100000"/></a></li>
            <!--  <li>Page active</li>-->
        </ul>
    </div>
</div><!-- End Position -->

<div class="container margin_60">

    <div class="main_title">
        <h2><spring:message code="Some"/> <span><spring:message code="good"/> </span><spring:message code="reasons"/></h2>
        <%--<p>Quisque at tortor a libero posuere laoreet vitae sed arcu. Curabitur consequat.</p>--%>
    </div>

    <div class="row">
        <div class="col-md-6 wow fadeIn" data-wow-delay="0.1s">
            <div class="feature">
                <i class="icon_set_1_icon-30"></i>
                <h3><span>+ 1000</span> <spring:message code="Customers"/></h3>
                <p>
                    <spring:message code="content2"/></p>
            </div>
        </div>
        <div class="col-md-6 wow fadeIn" data-wow-delay="0.2s">
            <div class="feature">
                <i class="icon_set_1_icon-41"></i>
                <h3><span>+120</span> Premium tours</h3>
                <p>
                    <spring:message code="content1"/> </p>
            </div>
        </div>
    </div><!-- End row -->
    <div class="row">
        <div class="col-md-6 wow fadeIn" data-wow-delay="0.3s">
            <div class="feature">
                <i class="icon_set_1_icon-57"></i>
                <h3><span>H24</span> <spring:message code="Support"/></h3>
                <p>
                    <spring:message code="content3"/></p>
            </div>
        </div>
        <div class="col-md-6 wow fadeIn" data-wow-delay="0.4s">
            <div class="feature">
                <i class="icon_set_1_icon-61"></i>
                <h3><span>10 Languages</span> available</h3>
                <p>
                    <spring:message code="content5"/></p>
            </div>
        </div>
    </div><!-- End row -->
    <div class="row">
        <div class="col-md-6 wow fadeIn" data-wow-delay="0.5s">
            <div class="feature">
                <i class="icon_set_1_icon-13"></i>
                <h3><span><spring:message code="Accesibility"/></span> <spring:message code="managment"/></h3>
                <p>
                    <spring:message code="content6"/></p>
            </div>
        </div>
        <div class="col-md-6 wow fadeIn" data-wow-delay="0.6s">
            <div class="feature">
                <i class="icon_set_1_icon-22"></i>
                <h3><span>Pet</span> allowed</h3>
                <p>
                    <spring:message code="content7"/></p>
            </div>
        </div>
    </div><!-- End row -->
    <hr>
    <div class="row">
        <div class="col-md-6 col-sm-6">
            <h4><spring:message code="Regularwork"/></h4>
            <p><spring:message code="content8"/></p>
            <div class="general_icons">
                <ul>
                    <li><i class="icon_set_1_icon-59"></i><spring:message code="Breakfast"/></li>
                    <li><i class="icon_set_1_icon-8"></i><spring:message code="Dinner"/></li>
                    <li><i class="icon_set_1_icon-32"></i><spring:message code="Photo"/></li>
                    <li><i class="icon_set_1_icon-50"></i><spring:message code="Personal"/></li>
                </ul>
            </div>
        </div>
        <div class="col-md-6 col-sm-6">
            <h4><spring:message code="selfservice"/></h4>
            <p><spring:message code="content9"/></p>
            <div class="general_icons">
                <ul>
                    <li><i class="icon_set_1_icon-98"></i><spring:message code="Audioguide"/></li>
                    <li><i class="icon_set_1_icon-27"></i>Parking</li>
                    <li><i class="icon_set_1_icon-36"></i><spring:message code="Exchange"/></li>
                    <li><i class="icon_set_1_icon-63"></i>Mobile</li>
                </ul>
            </div>
        </div>
    </div><!-- End row -->
</div><!-- End container -->

<div class="container-fluid">
    <div class="row">
        <!--
       <div class="col-md-6 nopadding features-intro-img">
           <div class="features-bg">
               <div class="features-img"></div>
           </div>
       </div>

       <div class="col-md-6 nopadding">
           <div class="features-content">
               <h3>"Ex vero mediocrem"</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a lorem quis neque interdum consequat ut sed sem. Duis quis tempor nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
               <p><a href="#" class=" btn_1 white">Read more</a></p>
           </div>
       </div>
       -->
    </div>
</div><!-- End container-fluid  -->

<div class="container margin_60">

    <div class="main_title">
        <h2><spring:message code="What"/> <span><spring:message code="customers"/> </span><spring:message code="says"/></h2>
        <%--<p>Quisque at tortor a libero posuere laoreet vitae sed arcu. Curabitur consequat.</p>--%>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="review_strip">
                <img src="img/avatar1.jpg" alt="" class="img-circle">
                <h4>Jhon Doe</h4>
                <p>
                    <spring:message code="content10"/>
                </p>
                <div class="rating">
                    <i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class=" icon-star-empty"></i><i class=" icon-star-empty"></i>
                </div>
            </div><!-- End review strip -->
        </div>

        <div class="col-md-6">
            <div class="review_strip">
                <img src="img/avatar2.jpg" alt="" class="img-circle">
                <h4>Frank Rosso</h4>
                <p>
                    <spring:message code="content11"/></p>
                <div class="rating">
                    <i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class=" icon-star-empty"></i><i class=" icon-star-empty"></i>
                </div>
            </div><!-- End review strip -->
        </div>
    </div><!-- End row -->
    <div class="row">
        <div class="col-md-6">
            <div class="review_strip">
                <img src="img/avatar3.jpg" alt="" class="img-circle">
                <h4>Marc twain</h4>
                <p>
                    <spring:message code="content12"/></p>
                <div class="rating">
                    <i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class=" icon-star-empty"></i><i class=" icon-star-empty"></i>
                </div>
            </div><!-- End review strip -->
        </div>

        <div class="col-md-6">
            <div class="review_strip">
                <img src="img/avatar1.jpg" alt="" class="img-circle">
                <h4>Peter Gabriel</h4>
                <p>
                    <spring:message code="content13"/></p>
                <div class="rating">
                    <i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class=" icon-star-empty"></i><i class=" icon-star-empty"></i>
                </div>
            </div><!-- End review strip -->
        </div>
    </div><!-- End row -->

</div><!-- End Container -->

    <!-- footer -->
    <%@include file="/common/footer.jsp" %>

<%--<!-- Common scripts -->--%>
    <%--<%@include file="/common/script.jsp" %>--%>

</body>
</html>
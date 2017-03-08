<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html> <!--<![endif]-->
<head>
    <%@ include file="/common/head.jsp" %>
    <title>BEAUTIFUL CHINA - <spring:message code="CreateMyTrip"/></title>
    <!-- Common scripts -->
    <%@ include file="/common/script.jsp" %>
    <link href="/css/date_time_picker.css" rel="stylesheet">
    <link href="/css/slider-pro.min.css" rel="stylesheet">
</head>
<body>

<!--[if lte IE 8]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a>.</p>
<![endif]-->

<div class="layer"></div>
<!-- Mobile menu overlay mask -->

<!-- Header================================================== -->
<%@ include file="/common/header.jsp" %>
<script>
    var nullperson = "<spring:message code="createtrip_100001"/>";
    var nullday = "<spring:message code="createtrip_100002"/>";
    var nullarrivetime = "<spring:message code="createtrip_100003"/>";
    var nullhotellevel = "<spring:message code="createtrip_100004"/>";
    var nullname = "<spring:message code="createtrip_100005"/>";
    var nullsex = "<spring:message code="createtrip_100006"/>";
    var nullcity = "<spring:message code="createtrip_100007"/>";
    var nullphone = "<spring:message code="createtrip_100008"/>";
    var nullcode = "<spring:message code="createtrip_100011"/>";
    var loginfirst = "<spring:message code="question_answer_100000"/>";
</script>
<section class="parallax-window" data-parallax="scroll" data-image-src="/img/header_bg.jpg" data-natural-width="1400"
         data-natural-height="470">
    <div class="parallax-content-1">
        <div class="animated fadeInDown">
            <%--<h1>Contact us</h1>--%>

            <%--<p>Ridiculus sociosqu cursus neque cursus curae ante scelerisque vehicula.</p>--%>
        </div>
    </div>
</section>
<!-- End Section -->

<div id="position">
    <div class="container">
        <ul>
            <li><a href="/createtrip"><spring:message code="CreateMyTrip"/></a></li>
        </ul>
    </div>
</div>
<!-- End Position -->

<div class="container margin_60">
    <div class="row">
        <div class="col-md-8 col-sm-8">
            <div class="form_title">
                <h3><strong><i class="icon-pencil"></i></strong><spring:message code="FillForm"/></h3>
            </div>
            <div class="step">
                <form method="post" id="contactform">
                    <table class="table">
                        <tr>
                            <th>
                                <%--旅游人数--%>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <h4><label>1. <spring:message code="TravelPeople"/></label><label style="color: red">*</label></h4>
                                            <input type="text" class="form-control" id="person_contact"
                                                   name="person_contact"
                                                   placeholder="<spring:message code="PeopleNumber"/>">
                                        </div>
                                    </div>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <%--旅游天数--%>
                                <div class="row">
                                    <div class="col-md-5 col-sm-5">
                                        <div class="form-group">
                                            <h4><label>2. <spring:message code="TripDays"/></label><label style="color: red">*</label>
                                            </h4>
                                            <select name="los" id="los" class="form-control">
                                                <option selected value="">- <spring:message code="HowMany"/> -</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="20+">20+</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <%--抵达日期--%>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <h4><label>3. <spring:message code="ArrivalDate"/> </label><label
                                                    style="color: red">*</label></h4>

                                            <div class="row">

                                                <div class="col-md-10 col-sm-10">
                                                    <input type="text" class="form-control" id="arrive_time"
                                                           name="arrive_time"
                                                           value="" placeholder="yyyy-mm-dd" autocomplete="off">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <%--酒店级别--%>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <h4><label>4. <spring:message code="HotelStyle"/></label><label style="color: red">*</label><br>
                                            </h4>
                                            <label for="fiveStar">
                                                <input name="hotel" type="radio" value="5 star Hotel Chains"
                                                       id="fiveStar">
                                                <spring:message code="HotelStyle5"/>
                                            </label>
                                            <label for="fourStarv">
                                                <input name="hotel" type="radio" value="4 star Best Value"
                                                       id="fourStarv">
                                                <spring:message code="HotelStyle4"/>
                                            </label>
                                            <label for="threeStar">
                                                <input name="hotel" type="radio" value="3 star Recommended"
                                                       id="threeStar">
                                                <spring:message code="HotelStyle3"/>
                                            </label>
                                            <label for="fourStarl">
                                                <input name="hotel" type="radio" value="Self Booking" id="fourStarl">
                                                <spring:message code="HotelStyleNone"/>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                            </th>
                        </tr>
                        <tr>
                            <th>
                                <%--旅游城市--%>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <h4><label>5. <spring:message code="TripCity"/> </label><label
                                                style="color: red">*</label></h4>

                                        <div class="tipText"><spring:message code="TripCityMsg"/><br>
                                        </div>
                                        <div class="citySelect">
                                            <c:forEach items="${cityList}" var="city">
                                                <div class="col-md-4 col-sm-4">
                                                    <input type="checkbox" name="city" height="13px" style="vertical-align:text-top;margin-top: 0 " value="${city.name}">${city.name}
                                                </div>
                                            </c:forEach>
                                        </div>

                                    </div>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <h4><label>6. <spring:message code="Requirement"/></label></h4>
                                    <textarea rows="5" id="message_contact" name="message_contact" class="form-control"
                                              placeholder="<spring:message code="WriteRequirement"/>"
                                              style="height:200px;"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <%--联系方式--%>
                                <div class="row">
                                    <div class="col-md-10 col-sm-10">
                                        <h4><label>7. <spring:message code="ContactDetails"/></label><label style="color: red">*</label></h4>

                                        <div class="row">
                                            <div class="col-md-5 col-sm-5">
                                                <div class="form-group">
                                                    <label><spring:message code="FullName"/></label>
                                                    <input type="text" class="form-control" id="name_contact"
                                                           name="name_contact">
                                                </div>
                                            </div>

                                            <div class="col-md-5 col-sm-5">
                                                <div class="form-group">
                                                    <label><spring:message code="Sex"/></label>
                                                    <select name="sex" id="sex" class="form-control">
                                                        <option selected value="">-<spring:message code="SexMsg"/>-</option>
                                                        <option value="1">F</option>
                                                        <option value="2">M</option>
                                                    </select>
                                                </div>
                                            </div>


                                            <div class="col-md-5 col-sm-5">
                                                <div class="form-group">
                                                    <label><spring:message code="Email"/></label>
                                                    <input type="text" id="email_contact" name="email_contact"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-5 col-sm-5">
                                                <div class="form-group">
                                                    <label><spring:message code="Phone"/></label>
                                                    <input type="text" id="phone_contact" name="phone_contact"
                                                           class="form-control">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </th>
                        </tr>
                    </table>
                    <%--验证--%>
                    <div class="row">
                        <div class="col-md-6">
                            <label><spring:message code="SecurityCode"/></label><br>
                            <img id="imgObj" alt="SecurityCode" src="code.html"/>
                            <a href="javascript:void(0);" id="changecode"><spring:message code="ChangeCode"/></a>
                            <input type="text" id="verify_contact" class=" form-control add_bottom_30">

                            <div id="check-verify" class="clearfix"></div>

                        </div>
                    </div>
                    <input type="button" value="Submit" class="btn_1" id="submit-contact">
                    <div id="check-all" class="clearfix"></div>
                </form>
            </div>
        </div>
        <!-- End col-md-8 -->

        <div class="col-md-4 col-sm-4">
            <div class="box_style_1">
                <span class="tape"></span>
                <h4><spring:message code="Address"/> <span><i class="icon-pin pull-right"></i></span></h4>

                <p>
                    Place Charles de Gaulle, 75008 Paris
                </p>
                <hr>
                <h4><spring:message code="HelpCenter"/> <span><i class="icon-help pull-right"></i></span></h4>

                <%--<p>--%>
                    <%--Lorem ipsum dolor sit amet, vim id accusata sensibus, id ridens quaeque qui. Ne qui vocent ornatus--%>
                    <%--molestie.--%>
                <%--</p>--%>
                <ul id="contact-info">
                    <li>+ 61 (2) 8093 3400 / + 61 (2) 8093 3402</li>
                    <li><a href="#">info@domain.com</a></li>
                </ul>
            </div>
            <div class="box_style_4">
                <i class="icon_set_1_icon-57"></i>
                <h4><spring:message code="Need"/> <span><spring:message code="Help"/>?</span></h4>
                <a href="tel://004542344599" class="phone">+45 423 445 99</a>
                <small><spring:message code="MondayToFriday"/> 9.00am - 7.30pm</small>
            </div>
        </div>
        <!-- End col-md-4 -->
    </div>
    <!-- End row -->
</div>
<!-- End container -->

<%--<div id="map_contact"></div>--%>
<!-- end map-->
<%--<div id="directions">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-8 col-md-offset-2">--%>
                <%--<form action="http://maps.google.com/maps" method="get" target="_blank">--%>
                    <%--<div class="input-group">--%>
                        <%--<input type="text" name="saddr" placeholder="Enter your starting point"--%>
                               <%--class="form-control style-2"/>--%>
                        <%--<input type="hidden" name="daddr" value="New York, NY 11430"/><!-- Write here your end point -->--%>
					<%--<span class="input-group-btn">--%>
					<%--<button class="btn" type="submit" value="Get directions" style="margin-left:0;">GET DIRECTIONS--%>
                    <%--</button>--%>
					<%--</span>--%>
                    <%--</div>--%>
                    <%--<!-- /input-group -->--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<!-- end directions-->
<%@ include file="/common/footer.jsp" %>

<%--<script src="http://maps.googleapis.com/maps/api/js"></script>--%>
<script src="/js/common/bootstrap.js"></script>
<script src="/js/common/bootstrap-datepicker.js"></script>

<%--<script src="/js/common/map_contact.js"></script>--%>
<%--<script src="/js/common/infobox.js"></script>--%>
<script src="/js/createtrip/createtrip.js"></script>

</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<%@ include file="/common/header.jsp" %>
<script src="/js/question/question.js"></script>

<script src="/js/review/review.js"></script>
<section class="parallax-window" data-parallax="scroll" data-image-src="/img/single_tour_bg_1.jpg"
         data-natural-width="1400" data-natural-height="470">

</section>
<!-- End section -->
<div id="position">
    <div class="container">
        <ul>
            <li><a href="#"><spring:message code="Home"/> </a></li>
            <li><a href="#"><spring:message code="Category"/> </a></li>
            <li><spring:message code="PageActive"/> </li>
        </ul>
    </div>
</div>
<!-- End Position -->
<div class="collapse" id="collapseMap">
    <div id="map" class="map"></div>
</div>
<!-- End Map -->
<div class="container margin_60">
    <div class="row">
        <div class="col-md-8" id="single_tour_desc">
            <p class="visible-sm visible-xs"><a class="btn_map" data-toggle="collapse" href="#collapseMap"
                                                aria-expanded="false" aria-controls="collapseMap">View on map</a>
            </p>


            <div class="main_frame1" style="padding: 0px">
                <!-- Map button for tablets/mobiles -->
                <div id="Img_carousel" class="slider-pro">
                    <div class="sp-slides">
                        <c:forEach items="${toursImageBOList}" var="tourImageBO">
                            <div class="sp-slide">
                                <img alt="" class="sp-image" src=""
                                     data-src="${tourImageBO.imageMedium}"
                                     data-small="${tourImageBO.imageSmall}"
                                     data-medium="${tourImageBO.imageMedium}"
                                     data-large="${tourImageBO.imageLarge}"
                                     data-retina="${tourImageBO.imageLarge}">
                            </div>
                        </c:forEach>
                    </div>
                    <div class="sp-thumbnails">
                        <c:forEach items="${toursImageBOList}" var="tourImageBO">
                            <img alt="" class="sp-thumbnail" src="${tourImageBO.imageMedium}">
                        </c:forEach>
                    </div>
                </div>
                <!--缩略图  end -->
                <h3><spring:message code="Description"/></h3><br/>

                <!--class=dayTourBox 总日程安排  未定义
                class=dayTourBox 每日行程    未定义-->
                <div class="dayTourBox">
                </div>
                <!--每日行程end -->
                <hr>
                <div id="inlcudeAndNot ">
                    <div class="include">
                        <h3 style="padding-top: 20px"><spring:message code="WhatIsInclude"/></h3>

                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <ul class="list_ok" id="includeList_left">
                                    <!--不加载包含的内容 -->
                                </ul>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <ul class="list_ok" id="includeList_right">
                                    <!--不加载包含的内容 -->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="exclude">
                        <h3><spring:message code="WhatDoesNotInclude"/></h3><br/>

                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <ul class="list_notok" id="excludeList_left">
                                    <!--不加载包含的内容 -->
                                </ul>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <ul class="list_notok" id="excludeList_right">
                                    <!--不加载包含的内容 -->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--include  and not end -->
                <hr>
                <!--impportant -->
                <h3><spring:message code="important"/></h3><br/>

                <ol id="important">
                    <!--加载重要提示-->
                </ol>

                <!--important end-->

                <hr>
                <!--triphint -->
                <h3><spring:message code="triphint"/></h3><br/>
                <ol id="triphint">
                    <!--加载旅途提示-->
                </ol>
                <!--triphint end-->

                <hr>
                <!--term -->
                <h3><spring:message code="term"/></h3><br/>
                <ol id="term">
                    <!--加载条款-->
                </ol>
                <!--term end-->
                <hr>


                <!-------------------------------reviews--------------------------------->
                <script>
                    var nullreviewcount = "<spring:message code="question_answer_100007"/>";
                </script>
                <div>
                    <h3><spring:message code="review"/></h3>
                    <hr>
                </div>

                <div>

                    <div class="row">
                        <!-- End general_rating -->
                        <div class="col-md-12 col-sm-12" id="rating_summary">
                            <ul class="nav nav-pills">
                                <li id="allReviewLi"><a href="javascript:changeReview(1);" id="all_reviews"><h5
                                        style="color: blue"></h5>
                                </a></li>
                                <li id="goodReviewLi"><a href="javascript:changeReview(2);" id="good_reviews"><h5
                                        style="color: blue"></h5>
                                </a></li>
                                <li id="midReviewLi"><a href="javascript:changeReview(3);" id="mid_reviews"><h5
                                        style="color: blue"></h5></a>
                                </li>
                                <li id="badReviewLi"><a href="javascript:changeReview(4);" id="bad_reviews"><h5
                                        style="color: blue"></h5>
                                </a></li>
                            </ul>
                            <hr>
                        </div>
                        <!-- End row -->
                        <hr>
                        <div class="col-md-12 col-sm-12" id="reviewcontent">
                        </div>
                        <div align="right" class="col-md-12" id="page">
                        </div>
                    </div>
                </div>

                <!-------------------------------reviews end--------------------------------->


                <!--End  single_tour_desc-->


                <!----------------------------question and answer by buhengzhang------------------------------->
                <input id="hiddenId" type="hidden" value="${sessionScope.user.id}"/>
                <input id="hiddenType" type="hidden" value="${sessionScope.user.type}"/>
                <script>
                    var unlogin = "<spring:message code="question_answer_100000"/>";
                    var nullquestion = "<spring:message code="question_answer_100001"/>";
                    var nullanswer = "<spring:message code="question_answer_100002"/>";
                    var nullstatus = "<spring:message code="question_answer_100003"/>";
                    var nullquestioncount = "<spring:message code="question_answer_100006"/>";
                </script>
                <div>
                    <div>
                        <h3><spring:message code="questionAndRe"/></h3>

                        <div align="right">
                            <button class="btn btn-info" id="add_question"><spring:message code="addQuestion"/></button>
                        </div>
                    </div>
                    <hr>
                    <div class="col-md-12 col-sm-12">
                        <div class="row" id="questionAll">
                        </div>
                        <div align="right" class="text_center" id="questionPage">
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="addQuestionModal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="width: 550px;margin-top: 100px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close"
                                    data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h5><spring:message code="addQuestion"/></h5>
                        </div>
                        <div class="modal-body" align="middle">
                            <div class="row" style="width: 90%" align="left">


                                <p><textarea rows="5" id="question_contact" name="message_contact" class="form-control"
                                             placeholder="Write your question"
                                             style="height:200px;"></textarea>
                                </p>

                                <div id="question_con_check"></div>
                                <div align="right">
                                    <button class='btn btn-info' id="submint_question">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal -->
            </div>
            <!--End row -->

            <!--------------------------------question and answer end------------------------------->
        </div>
        <!--end -->


        <script>
            var questionTitle = "<spring:message code="question_100000"/>";
            var answerTitle = "<spring:message code="question_100001"/>";
        </script>
        <!--End  single_tour_desc-->
        <aside class="col-md-4">
            <%--<p class="hidden-sm hidden-xs">--%>
            <%--<a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap">View on map</a>--%>
            <%--</p>--%>

            <div class="box_style_1 expose">
                <h3 class="inner">- <spring:message code="Booking"/> -</h3>

                <div class="row">
                    <!--出发城市-->
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label><i class="icon-location-2"></i><spring:message code="StartCity"/></label>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <div id="startCity"></div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12">
                        <div class="row">
                            <!--提前天数-->
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>&nbsp;&nbsp;&nbsp;<spring:message code="advanceDay"/> :</label>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label id="advanceDays" style="color: red"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group">

                            <!--团购日期隐藏框 -->
                            <div id="endtimes">

                            </div>
                            <label><i class="icon-calendar-7"></i><spring:message code="SelectADate"/></label>

                            <input class="date-pick form-control" data-date-format="M-d-D" type="text"
                                   id="date-pick"
                                   readonly="readonly">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label><spring:message code="Adults"/></label>

                            <div class="numbers-row" onclick="adults_num();">
                                <input type="text" value="1" id="adults" class="qty2 form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group" onclick="javascript:children_num();">
                            <label><spring:message code="Children"/></label>

                            <div class="numbers-row">
                                <input type="text" value="0" id="children" class="qty2 form-control">
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <table class="table table_summary">
                    <tbody>
                    <tr>
                        <td>
                            <spring:message code="Adults"/>
                        </td>
                        <td class="text-right" id="adults_quantity">0</td>
                    </tr>
                    <tr>
                        <td>
                            <spring:message code="Children"/>
                        </td>
                        <td class="text-right" id="children_quantity">0</td>
                    </tr>
                    <tr>
                        <td>
                            <spring:message code="TotalAmount"/>
                        </td>
                        <td class="text-right">
                            <span id="amount_all">0</span> x $<span id="price">0</span>
                            <!--每日价格隐藏 -->
                            <input type="hidden" id="theprice"/>
                        </td>

                    </tr>

                    <c:forEach items="${opList}" var="optionList">
                        <c:forEach items="${optionList}" var="option" varStatus="s">
                            <!--判断如果是第一天记录，则添加整个下拉框。否则则添只加一个opiton -->
                            <c:choose>
                                <c:when test="${s.first}">
                                    <label>${option.optionName}</label>
                                    <select name="options" class="form-control" onchange="total_cost()">
                                    <!--valueId -->


                                    <option selected
                                            value="${option.optionPrice}-${option.valueId}">${option.optionName}--${option.optionPrice}</option>

                                </c:when>
                                <c:otherwise>
                                    <option
                                            value="${option.optionPrice}-${option.valueId}">${option.optionName}--${option.optionPrice}</option>

                                </c:otherwise>
                            </c:choose>
                            <c:if test="${s.last}">
                                </select>
                                <br/>
                            </c:if>
                        </c:forEach>
                    </c:forEach>

                    <tr class="total">
                        <td>
                            <spring:message code="TotalCost"/>
                        </td>
                        <td class="text-right">
                            $<span id="total_cost">0</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <!--点击book now 跳转到支付页面  -->
                <a class="btn_full" href="javascript:payment()"><spring:message code="BOOKNOW"/></a>
                <%--<a class="btn_full_outline" href="#"><i class=" icon-heart"></i> Add to whislist</a>--%>
            </div>
            <!--/box_style_1 -->

            <div class="box_style_4">
                <i class="icon_set_1_icon-90"></i>
                <h4><span><spring:message code="book"/></span>&nbsp;<spring:message code="byPhone"/></h4>
                <a href="/#" class="phone">+45 423 445 99</a>
                <small><spring:message code="Hours"/></small>
            </div>
        </aside>
    </div>
</div>
<!--订单管理end -->
<!--End container -->
<!-- footer -->
<%@include file="/common/footer.jsp" %>
<div id="overlay"></div>
<!-- Mask on input focus -->
<!-- Modal Review -->
<div class="modal fade" id="myReview" tabindex="-1" role="dialog" aria-labelledby="myReviewLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myReviewLabel">Write your review</h4>
            </div>
            <div class="modal-body">
                <div id="message-review">
                </div>
                <form method="post" action="assets/review_tour.php" name="review_tour" id="review_tour">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input name="name_review" id="name_review" type="text" placeholder="Your name"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input name="lastname_review" id="lastname_review" type="text"
                                       placeholder="Your last name" class="form-control">
                            </div>
                        </div>
                    </div>
                    <!-- End row -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input name="email_review" id="email_review" type="email" placeholder="Your email"
                                       class="form-control">
                            </div>
                        </div>
                    </div>
                    <!-- End row -->
                    <hr>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Position</label>
                                <select class="form-control" name="position_review" id="position_review">
                                    <option value="">Please review</option>
                                    <option value="Low">Low</option>
                                    <option value="Sufficient">Sufficient</option>
                                    <option value="Good">Good</option>
                                    <option value="Excellent">Excellent</option>
                                    <option value="Superb">Super</option>
                                    <option value="Not rated">I don't know</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Tourist guide</label>
                                <select class="form-control" name="guide_review" id="guide_review">
                                    <option value="">Please review</option>
                                    <option value="Low">Low</option>
                                    <option value="Sufficient">Sufficient</option>
                                    <option value="Good">Good</option>
                                    <option value="Excellent">Excellent</option>
                                    <option value="Superb">Super</option>
                                    <option value="Not rated">I don't know</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- End row -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Price</label>
                                <select class="form-control" name="price_review" id="price_review">
                                    <option value="">Please review</option>
                                    <option value="Low">Low</option>
                                    <option value="Sufficient">Sufficient</option>
                                    <option value="Good">Good</option>
                                    <option value="Excellent">Excellent</option>
                                    <option value="Superb">Super</option>
                                    <option value="Not rated">I don't know</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Quality</label>
                                <select class="form-control" name="quality_review" id="quality_review">
                                    <option value="">Please review</option>
                                    <option value="Low">Low</option>
                                    <option value="Sufficient">Sufficient</option>
                                    <option value="Good">Good</option>
                                    <option value="Excellent">Excellent</option>
                                    <option value="Superb">Super</option>
                                    <option value="Not rated">I don't know</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- End row -->
                    <div class="form-group">
                            <textarea name="review_text" id="review_text" class="form-control" style="height:100px"
                                      placeholder="Write your review"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="text" id="verify_review" class=" form-control"
                               placeholder="Are you human? 3 + 1 =">
                    </div>
                    <input type="submit" value="Submit" class="btn_1" id="submit-review">
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End modal review -->
<!-- Common scripts -->
<%@include file="/common/script.jsp" %>
<script src="/js/toursdetail/toursdetail.js"></script>
<script>

    var theDay = "<spring:message code="day"/>";
    var ticket_remain = "<spring:message code="remain"/>";
    var destinations = "<spring:message code="Destinations"/>";
    var hotel = "<spring:message code="hotel"/>";
    var transport = "<spring:message code="transport"/>";
    var meals = "<spring:message code="meals"/>";
    var payment_100006 = "<spring:message code="payment_100006"/>";
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
<script src="/js/common/jquery.sliderPro.min.js"></script>
<script type="text/javascript">
    $(document).ready(function ($) {
        $('#Img_carousel').sliderPro({
            width: 960,
            height: 500,
            fade: true,
            arrows: true,
            buttons: false,
            fullScreen: false,
            smallSize: 500,
            startSlide: 0,
            mediumSize: 1000,
            largeSize: 3000,
            thumbnailArrows: true,
            autoplay: false
        });
    });
</script>
<script src="/js/common/bootstrap.js"></script>
<script src="/js/toursdetail/bootstrap-datepicker.js"></script>
<%--<script>--%><!--时间选择  -->
<%--$('input.time-pick').timepicker({--%>
<%--minuteStep: 15,--%>
<%--showInpunts: false--%>
<%--})--%>
<%--</script>--%>
<!--Review modal validation -->
<script src="/js/common/validate.js"></script>
<!-- Map -->
<%--<script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="/js/common/map.js"></script>
<script src="/js/common/infobox.js"></script>--%>

</body>
</html>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html> <!--<![endif]-->
<head>
    <%@ include file="/common/head.jsp"%>
    <title>BEAUTIFUL CHINA - <spring:message code="tourlist_100010"/></title>
    <!-- Common scripts -->
</head>
<body>

<!-- Header================================================== -->
<%@ include file="/common/header.jsp"%>


<section class="parallax-window" data-parallax="scroll" data-image-src="/img/home_bg_1.jpg" data-natural-width="1400" data-natural-height="470">
    <div class="parallax-content-1">
        <div class="animated fadeInDown">
            <h1>Paris tours</h1>
            <p>Ridiculus sociosqu cursus neque cursus curae ante scelerisque vehicula.</p>
        </div>
    </div>
</section><!-- End section -->

<div id="position">
    <div class="container">
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Category</a></li>
            <li>Page active</li>
        </ul>
    </div>
</div><!-- Position -->

<div class="collapse" id="collapseMap">
    <div id="map" class="map"></div>
</div><!-- End Map -->

<div  class="container margin_60">

    <div class="row">
        <aside class="col-lg-3 col-md-3">


            <div id="filters_col">
                <a data-toggle="collapse" href="#collapseFilters" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt"><i class="icon_set_1_icon-65"></i><spring:message code="tourlist_100000"/><i class="icon-plus-1 pull-right"></i></a>
                <div class="collapse" id="collapseFilters">
                    <div class="filter_type">
                        <h6><spring:message code="tourlist_100003"/></h6>
                        <ul>
                            <li><label><a href="javascript:searchPrice(1,0,0)"><spring:message code="tourlist_100004"/></a></label></li>
                            <li><label><a href="javascript:searchPrice(1,10,50)"><spring:message code="tourlist_100001"/> $10 <spring:message code="tourlist_100002"/> $50</a></label></li>
                            <li><label><a href="javascript:searchPrice(1,50,80)"><spring:message code="tourlist_100001"/> $50 <spring:message code="tourlist_100002"/> $80</a></label></li>
                            <li><label><a href="javascript:searchPrice(1,80,100)"><spring:message code="tourlist_100001"/> $80 <spring:message code="tourlist_100002"/> $100</a></label></li>
                        </ul>
                    </div>
                    <div class="filter_type">
                        <h6><spring:message code="tourlist_100005"/></h6>
                        <ul>
                            <li><label><a href="javascript:searchDay(1,0,0)"><spring:message code="tourlist_100004"/></a></label></li>
                            <li><label><a href="javascript:searchDay(1,1,5)"><spring:message code="tourlist_100001"/> 1 <spring:message code="tourlist_100002"/> 5 <spring:message code="tourlist_100007"/></a></label></li>
                            <li><label><a href="javascript:searchDay(1,5,10)"><spring:message code="tourlist_100001"/> 5 <spring:message code="tourlist_100002"/> 10 <spring:message code="tourlist_100007"/></a></label></li>
                            <li><label><a href="javascript:searchDay(1,10,15)"><spring:message code="tourlist_100001"/> 10 <spring:message code="tourlist_100002"/> 15 <spring:message code="tourlist_100007"/></a></label></li>
                        </ul>
                    </div>

                </div><!--End collapse -->
            </div><!--End filters col-->
            <div class="box_style_2">
                <i class="icon_set_1_icon-57"></i>
                <h4>Need <span>Help?</span></h4>
                <a href="tel://004542344599" class="phone">+45 423 445 99</a>
                <small>Monday to Friday 9.00am - 7.30pm</small>
            </div>
        </aside><!--End aside -->
        <div class="col-lg-9 col-md-9">
            <%--列表内容--%>
            <div id="content"></div>
            <%--首次进入页面的搜索条件--%>
            <input id="searchOne" type="hidden" value="${searchOne}">
            <input id="page" type="hidden" value="${page}">
            <%--页码显示--%>
            <div class="text-center" id="pageContent">
                <ul id="visible-pages-example"></ul>
            </div>
            <%--隐藏值内容--%>
            <div id="content2"></div>
        </div><!-- End col lg-9 -->
    </div><!-- End row -->
</div><!-- End container -->

<!-- footer -->
<%@include file="/common/footer.jsp" %>

<!-- Specific scripts -->
<!-- Cat nav mobile -->
<script  src="/js/common/cat_nav_mobile.js"></script>
<script>$('#cat_nav').mobileMenu();</script>
<!-- Check and radio inputs -->
<script src="/js/common/icheck.js"></script>

<script>
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-grey',
        radioClass: 'iradio_square-grey'
    });
</script>
<!-- Map -->
<script id="test" type="text/html">
    {{each list as toursNo i}}
    <div class="strip_all_tour_list wow fadeIn" data-wow-delay="0.1s">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="img_list"><a href="toursdetail/{{toursNo.id}}"><div class="ribbon" ></div><img src="{{toursNo.imageUrl}}"></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="tour_list_desc">
                    <h3><strong>{{toursNo.title}}</strong> <spring:message code="tourlist_100008"/></h3>
                    <p>{{toursNo.subtitle}}</p>
                </div>
            </div>
            <div><spring:message code="tourlist_100007"/>:{{toursNo.days}}</div>
            <div class="col-lg-2 col-md-2 col-sm-2">
                <div class="price_list"><div><sup>$</sup>{{toursNo.trdPrice}}*<span class="normal_price_list"></span><small >*<spring:message code="tourlist_100009"/></small>
                    <p><a href="toursdetail/{{toursNo.id}}" class="btn_1">Details</a></p>
                </div>
                </div>
            </div>
        </div>
    </div>
    {{/each}}
</script>
<script id="test2" type="text/html">
    <input id="pageNumber" type="hidden" value="{{pageNumber}}">
    <input id="pageAll" type="hidden" value="{{pageAll}}">
    <input id="priceMin" type="hidden" value="{{priceMin}}">
    <input id="priceMax" type="hidden" value="{{priceMax}}">
    <input id="dayMin" type="hidden" value="{{dayMin}}">
    <input id="dayMax" type="hidden" value="{{dayMax}}">
    <input id="search" type="hidden" value="{{search}}">
</script>
<%--分页与查询--%>
<script src="js/common/template.js"></script>
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="/js/paging/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="/js/product/tourslist.js" type="text/javascript"></script>
<script>
    var empty_100001 = "<spring:message code="empty_100001"/>"
</script>
</body>
</html>
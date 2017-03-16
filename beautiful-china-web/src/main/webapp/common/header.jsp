<%@ include file="/common/taglibs.jsp" %>
<%@ page import="org.apache.commons.lang.RandomStringUtils" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    response.setHeader("Expires", "0");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragrma", "no-cache");
    RandomStringUtils rs = new RandomStringUtils();
    String ping = rs.randomAlphanumeric(10);
%>
<input type="hidden" id="ping" value="<%=ping%>">
<!--[if lte IE 8]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a>.</p>
<![endif]-->

<div id="preloader">
    <div class="sk-spinner sk-spinner-wave">
        <div class="sk-rect1"></div>
        <div class="sk-rect2"></div>
        <div class="sk-rect3"></div>
        <div class="sk-rect4"></div>
        <div class="sk-rect5"></div>
    </div>
</div>
<!-- End Preload -->
<input id="hiddenName" type="hidden" value="${sessionScope.user.nickname}"/>
<!--获取session中用户id-->
<input id="userId" type="hidden" value="${sessionScope.user.id}"/>
<!--获取session中用户email -->
<input id="email" type="hidden" value="${sessionScope.user.email}"/>
<script>
    var nullpwd = "<spring:message code="login_100003"/>";
    var nullemail = "<spring:message code="login_100004"/>";
    var erroremail = "<spring:message code="login_100005"/>";
</script>

<script src="/js/login/security.js"></script>
<script src="/js/common/header.js"></script>
<script src="/js/common/footer.js"></script>

<div class="layer"></div>

<!-- Mobile menu overlay mask -->
<header>
    <div id="top_line">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6"><i class="icon-phone"></i><strong>0045 043204434</strong></div>

                <div class="col-md-6 col-sm-6 col-xs-6">
                    <ul id="top_links">
                        <li>
                            <div class="dropdown dropdown-access">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                   id="access_link"><spring:message code="SignIn"/></a>
                                <a href="/information" id="login_link" style="text-decoration: none;"></a>
                                <a href="/login/quitLogin"  id="quitLogin" style="text-decoration: none;">&nbsp;|&nbsp;&nbsp;&nbsp;<spring:message code="quitLogin"/></a>
                                <div class="dropdown-menu" id="dropdown">
                                    <%--<div class="row">--%>
                                    <%--<div class="col-md-6 col-sm-6 col-xs-6">--%>
                                    <%--<a href="#" class="bt_facebook">--%>
                                    <%--<i class="icon-facebook"></i>Facebook </a>--%>
                                    <%--</div>--%>
                                    <%--<div class="col-md-6 col-sm-6 col-xs-6">--%>
                                    <%--<a href="#" class="bt_paypal">--%>
                                    <%--<i class="icon-paypal"></i>Paypal </a>--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                    <div class="login-or">
                                        <hr class="hr-or">
                                        <span class="span-or"><spring:message code="SignIn"/></span>
                                    </div>
                                    <div id="login-check" class="clearfix"></div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="inputUsernameEmail"
                                               placeholder="<spring:message code="Email"/>">
                                    </div>
                                    <div id="email-check" class="clearfix"></div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="inputPassword"
                                               placeholder="<spring:message code="Password"/>">
                                    </div>
                                    <div id="password-check" class="clearfix"></div>
                                    <a id="forgot_pw" href="forget"><spring:message code="ForgotPwd"/></a>
                                    <input type="button" name="Sign_in" value="<spring:message code="SignIn"/>"
                                           id="Sign_in" class="button_drop">
                                    <input type="button" name="Sign_up" value="<spring:message code="SignUp"/>"
                                           id="Sign_up" class="button_drop">
                                </div>
                            </div>
                            <!-- End Dropdown access -->
                        </li>
                        <%--<li class="dropdown" style="float: none;">--%>
                            <%--<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="address" name="address" style="text-decoration: none;">--%>
                                 <%--<span class="caret"></span>--%>
                            <%--</a>--%>
                            <%--<ul class="dropdown-menu pull-right" style="height:600px;overflow:scroll;float: none;width: 100px;" id="selecCountry">--%>
                            <%--</ul>--%>
                        <%--</li>--%>
                        <%--<li><a href="wishlist.html" id="wishlist_link">Wishlist</a></li>--%>
                    </ul>
                </div>
            </div>
            <!-- End row -->
        </div>
        <!-- End container-->
    </div>
    <input type="hidden" id="longitudeT" name="longitudeT">
    <!-- End top line-->
    <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9vTacp_Xq7PPdTb9-d7-tpHGnZJUEI_c&signed_in=true&callback=initMap"--%>
            <%--async defer>--%>
    <%--</script>--%>
    <script type="text/javascript">
        //谷歌地图定位
        function initMap() {
            var geocoder=null;
            if(document.getElementById('map')){
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 4,
                center: {lat: 34.5427, lng: 106.2317},
                disableDefaultUI: true
            });
                geocoder= new google.maps.Geocoder();
            var infowindow = new google.maps.InfoWindow();
            document.getElementById('searchCity').addEventListener('click', function () {
                geocodeAddress(geocoder, map,infowindow);
            });
            }else{
                geocoder= new google.maps.Geocoder();
            }
            var latitude = null;
            // Try HTML5 geolocation.
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    latitude = position.coords.latitude + "," + position.coords.longitude;
                    $("#longitudeT").val(position.coords.longitude);
                    var longitudeT=null;
                    var arr,reg=new RegExp("(^| )"+"longitude"+"=([^;]*)(;|$)");
                    if(arr=document.cookie.match(reg)){
                        longitudeT= unescape(arr[2]);
                    }else{
                        longitudeT= null;
                    }
                    if(longitudeT!=null){
                        $("#longitudeT").val(longitudeT);
                    }
                    geocodeLatLng(geocoder, latitude);
                }, function () {
                    handleLocationError();
                });
            } else {
                // Browser doesn't support Geolocation
                handleLocationError();
            }
        }
        function handleLocationError() {
            document.getElementById("address").textContent ="location failed";
        }

        function geocodeLatLng(geocoder, value) {
            var input = value;
            var latlngStr = input.split(',', 2);
            var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
            geocoder.geocode({'location': latlng}, function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        document.getElementById("address").textContent =results[4].formatted_address;
                        var arr,reg=new RegExp("(^| )"+"address"+"=([^;]*)(;|$)");
                        var address=null;
                        if(arr=document.cookie.match(reg)){
                            address= unescape(arr[2]);
                        }else{
                            address= null;
                        }
                        if(address!=null){
                            $("#address").text(address);
                        }

                    } else {
                        document.getElementById("address").textContent ="location failed";
                    }
                } else {
                    document.getElementById("address").textContent ="location failed";
                }
            });
        }

    </script>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-3">
                <div id="logo">
                    <a href="/"><img src="/img/logo.png" width="160" height="34" alt="Bueatiful China"
                                     data-retina="true" class="logo_normal"></a>
                    <a href="/"><img src="/img/logo_black.png" width="160" height="34" alt="Bueatiful China"
                                     data-retina="true" class="logo_sticky"></a>
                </div>
            </div>
            <nav class="col-md-9 col-sm-9 col-xs-9" style="margin-bottom: 10px;">
                <a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>Menu mobile</span></a>

                <div class="main-menu">
                    <div id="header_menu">
                        <img src="/img/logo_sticky.png" width="160" height="34" alt="City tours" data-retina="true">
                    </div>
                    <a href="#" class="open_close" id="close_in"><i class="icon_set_1_icon-77"></i></a>
                    <ul>
                        <li class="submenu">
                            <a href="/" class="show-submenu"><spring:message code="Home"/></a>

                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="show-submenu"><spring:message code="Destinations"/> <i
                                    class="icon-down-open-mini"></i></a>
                            <ul id="destinationList">

                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="/createtrip" class="show-submenu"><spring:message code="CreateMyTrip"/></a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="show-submenu"><spring:message code="Theme"/><i
                                    class="icon-down-open-mini"></i></a>
                            <ul id="themeList">

                            </ul>
                        </li>
                        <li class="megamenu submenu">
                            <a href="/about" class="show-submenu-mega"><spring:message code="AboutUs"/></a>
                        </li>
                    </ul>
                </div>
                <!-- End main-menu -->
                <ul id="top_tools">
                    <li>
                        <div class="dropdown dropdown-search">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-search"></i></a>

                            <div class="dropdown-menu">
                                <form>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search..."
                                               id="search_title">
                                            <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" style="margin-left:0;"
                                                    id="search_btn">
                                                <i class="icon-search"></i>
                                            </button>
                                            </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="col-md-9 col-sm-9 col-xs-9" align="right" >
                            <%--<select name="lang" id="lang" onchange="changeLanguage(this.value)">--%>
                                <%--<option style="background: url('/img/US_flag.png')" value="English" selected><img src="/img/US_flag.png"></option>--%>
                                <%--<option value="French"><img src="/img/FR_flag.png"></option>--%>
                                <%--<option value="Chinese"><img src="/img/CN_flag.png"></option>--%>
                            <%--</select>--%>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                            data-toggle="dropdown" id="selectLanguage">
                                        <spring:message code="Language"/> <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="javascript:changeLanguage('English');"><img src="/img/US_flag.png"><font style="color: black;"><spring:message code="English"/></font></a></li>
                                        <li><a href="javascript:changeLanguage('French');"><img src="/img/FR_flag.png"><font style="color: black;"><spring:message code="French"/></font></a></li>
                                        <li><a href="javascript:changeLanguage('Chinese');"><img src="/img/CN_flag.png"><font style="color: black;"><spring:message code="Chinese"/></font></a></li>
                                    </ul>
                                </div>

                        </div>
                        <!--
                            <div class="dropdown dropdown-cart">

                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class=" icon-basket-1"></i>Cart (0) </a>
                                <ul class="dropdown-menu" id="cart_items">
                                    <li>
                                        <div class="image"><img src="img/thumb_cart_1.jpg" alt=""></div>
                                        <strong>
										<a href="#">Louvre museum</a>1x $36.00 </strong>
                                        <a href="#" class="action"><i class="icon-trash"></i></a>
                                    </li>
                                    <li>
                                        <div class="image"><img src="img/thumb_cart_2.jpg" alt=""></div>
                                        <strong>
										<a href="#">Versailles tour</a>2x $36.00 </strong>
                                        <a href="#" class="action"><i class="icon-trash"></i></a>
                                    </li>
                                    <li>
                                        <div class="image"><img src="img/thumb_cart_3.jpg" alt=""></div>
                                        <strong>
										<a href="#">Versailles tour</a>1x $36.00 </strong>
                                        <a href="#" class="action"><i class="icon-trash"></i></a>
                                    </li>
                                    <li>
                                        <div>Total: <span>$120.00</span></div>
                                        <a href="cart.html" class="button_drop">Go to cart</a>
                                        <a href="payment.html" class="button_drop outline">Check out</a>
                                    </li>
                                </ul>
                            </div>--><!-- End dropdown-cart-->
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- container -->
    <script src="/js/login/header.js"></script>
</header>
<!-- End Header -->

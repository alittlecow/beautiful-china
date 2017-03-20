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

    <title>BEAUTIFUL CHINA - ${city.name}</title>

    <!-- REVOLUTION SLIDER CSS -->
    <link href="/rs-plugin/css/settings.css" rel="stylesheet">
    <link href="/css/extralayers.css" rel="stylesheet">
</head>

<body>

<!-- Header================================================== -->
<%@ include file="/common/header.jsp" %>

<!-- Slider -->
<input type="hidden" id="hiddenCityId" name="hiddenCityId" value="${city.id}">
<input type="hidden" id="hiddenCityName" name="hiddenCityName" value="${city.name}">

<div class="tp-banner-container">
    <div class="tp-banner">
        <ul>
            <li data-transition="fade" id="photoOne">
                <!-- MAIN IMAGE -->
                <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${city.photoOne}>
            </li>
            <!-- SLIDE  -->
            <li data-transition="fade" id="photoTwo">
                <!-- MAIN IMAGE -->
                <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${city.photoTwo}>
            </li>

            <li data-transition="fade" id="photoThree">
                <!-- MAIN IMAGE -->
                <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${city.photoThree}>
            </li>

            <li data-transition="fade" id="photoFour">
                <!-- MAIN IMAGE -->
                <img src="/img/slides_bg/dummy.png" alt="slidebg1" data-lazyload=${city.photoFour}>
            </li>

        </ul>
        <div class="tp-bannertimer tp-bottom"></div>
    </div>
</div>

<div class="container margin_60">
    <div class="col-md-12 col-sm-12">
        <div style="padding: 0 15px 0 15px;background-color: inherit">
            <h1>${city.name}</h1>
            <hr>
            <%--<p class="lead" style="line-height: normal">${city.desc}--%>
            <%--</p>--%>
        </div>
    </div>
    <div class="col-md-12 col-sm-12">
        <div class="col-md-6  col-sm-12" style="margin-top:10%; ">
            <div id="mapByCity" class="col-md-12  col-sm-12" style="height: 400px;"></div>
        </div>
        <div class="col-md-6 col-sm-12" style="margin-top:10%;" align="left">
            <label><h4><spring:message code="cityInformation"/></h4></label>

            <div id="cityDesc"></div>
            <hr>
            <label><h4><spring:message code="sightsInformation"/></h4></label>

            <div id="sightsDesc"></div>
            <hr>
            <label><h4><spring:message code="hotelInformation"/></h4></label>

            <div id="hotelDesc"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var geocoder = null;
    if (document.getElementById('mapByCity')) {
        var map = new google.maps.Map(document.getElementById('mapByCity'), {
            zoom: 8,
            center: {lat: 34.5427, lng: 106.2317},
        });
        geocoder = new google.maps.Geocoder();
        var infowindow = new google.maps.InfoWindow();
        geocodeAddress(geocoder, map, infowindow);
    }
    var cityId = document.getElementById('hiddenCityId').value;
    $.ajax({
        async: false,
        type: "GET",
        url: "/geoMap/getInfoById",
        data: {id: cityId},
        contentType: "application/json",
        dataType: "JSON",
        success: function (msg) {
            var list = msg.data;
            var cityList = list[0];
            var sightsList = list[1];
            var hotelList = list[2];
            $("#sightsDesc").empty();
            $("#hotelDesc").empty();
            $("#cityDesc").empty();
            for (var i = 0; i < cityList.length; i++) {
                $("#cityDesc").append("<hr style='border:1px dashed;border-color: grey;'><label style='font-size: 14px;'>" + cityList[i].name + "</label><div>" + cityList[i].cityDesc + "</div>");
            }
            for (var i = 0; i < sightsList.length; i++) {
                $("#sightsDesc").append("<hr style='border:1px dashed;border-color: grey;'><label style='font-size: 14px;'>" + sightsList[i].sightsName + "</label><div>" + sightsList[i].sightsDesc + "</div>");
            }
            for (var i = 0; i < hotelList.length; i++) {
                $("#hotelDesc").append("<hr style='border:1px dashed;border-color: grey;'><label style='font-size: 14px;'>" + hotelList[i].hotelName + "</label><div>" + hotelList[i].hotelDesc + "</div>");
            }
        },
    });

    function geocodeAddress(geocoder, map, infowindow) {
        var cityName = document.getElementById('hiddenCityName').value;
        var cityId = document.getElementById('hiddenCityId').value;
        geocoder.geocode({'address': cityName}, function (results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location,
                });
                getAddrInfoByCity(marker, results[0].geometry.location, infowindow, map, cityId);
            }
        })
    }
    function getAddrInfoByCity(marker, uluru, infowindow, map, cityId) {
        infowindow = new google.maps.InfoWindow({
            maxWidth: 250
        });
        marker = new google.maps.Marker({
            position: uluru,
            map: map,
            title: cityId + ""
        });
        marker.addListener('click', function () {
            map.setZoom(8);
            map.setCenter(marker.getPosition());
            getInfoOfCity(cityId, infowindow, map, marker);
        });
    }
    function getInfoOfCity(id, infowindow, map, marker) {
        $.ajax({
            async: false,
            type: "GET",
            url: "/geoMap/getInfoById",
            data: {id: id},
            contentType: "application/json",
            dataType: "JSON",
            success: function (msg) {
                var list = msg.data;
                var cityList = list[0];
                var sightsList = list[1];
                var hotelList = list[2];
                $("#sightsDesc").empty();
                $("#hotelDesc").empty();
                $("#cityDesc").empty();
                var contentString = null;
                for (var i = 0; i < cityList.length; i++) {
                    contentString = '<div id="content" style="color: black;">' +
                            '<div id="siteNotice">' +
                            '</div>' +
                            '<h3 id="firstHeading" class="firstHeading">' + cityList[i].name + '</h3>' +
                            '<div id="bodyContent">' +
                            cityList[i].cityDesc +
                            '</div>' +
                            '</div>';
                    $("#cityDesc").append("<hr style='border:1px dashed;border-color: grey;'><label style='font-size: 14px;'>" + cityList[i].name + "</label><div>" + cityList[i].cityDesc + "</div>");
                }
                infowindow = new google.maps.InfoWindow({
                    content: contentString,
                    maxWidth: 250
                });
                infowindow.open(map, marker);
                for (var i = 0; i < sightsList.length; i++) {
                    $("#sightsDesc").append("<hr style='border:1px dashed;border-color: grey;'><label style='font-size: 14px;'>" + sightsList[i].sightsName + "</label><div>" + sightsList[i].sightsDesc + "</div>");
                }
                for (var i = 0; i < hotelList.length; i++) {
                    $("#hotelDesc").append("<hr style='border:1px dashed;border-color: grey;'><label style='font-size: 14px;'>" + hotelList[i].hotelName + "</label><div>" + hotelList[i].hotelDesc + "</div>");
                }
            },
        });
    }
</script>
<!-- footer -->
<%@include file="/common/footer.jsp" %>
<!-- Common scripts -->


<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script src="/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script src="/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script src="/js/common/revolution_func.js"></script>
</body>

</html>

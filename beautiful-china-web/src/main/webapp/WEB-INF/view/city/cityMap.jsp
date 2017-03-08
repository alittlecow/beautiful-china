<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html> <!--<![endif]-->
<head>
    <%@ include file="/common/head.jsp" %>
    <title>BEAUTIFUL CHINA</title>
    <style>
        #floating-panel {
            position: absolute;
            top: 10px;
            left: 5%;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: 'Roboto', 'sans-serif';
            line-height: 30px;
            padding-left: 10px;
        }

    </style>
</head>
<body>

<!-- Header================================================== -->
<%@ include file="/common/header.jsp" %>
<script type="text/javascript">
    function geocodeAddress(geocoder, resultsMap, infowindow) {
        var addressSearch = document.getElementById('addressSearch').value;
        geocoder.geocode({'address': addressSearch}, function (results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                resultsMap.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: resultsMap,
                    position: results[0].geometry.location,
                });
                var cityId = null;
                $.ajax({
                    async: false,
                    type: "GET",
                    url: "/geoMap/getIdbyCItyName",
                    data: {name: addressSearch},
                    contentType: "application/json",
                    dataType: "JSON",
                    success: function (msg) {
                        cityId = msg;
                    },
                });
                getAddrInfoByCity(marker, results[0].geometry.location, infowindow, resultsMap, cityId);
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
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
            getInfoOfCity(cityId, infowindow,map,marker);
        });
    }
    function getInfoOfCity(id, infowindow,map,marker) {
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
                            '<h3 id="firstHeading" class="firstHeading">'+cityList[i].name+'</h3>' +
                            '<div id="bodyContent">' +
                            cityList[i].cityDesc+
                            '</div>' +
                            '</div>';
                    $("#cityDesc").append("<hr style='border:1px dashed;'><label style='font-size: 14px;'>"+cityList[i].name+"</label><div>"+cityList[i].cityDesc+"</div>");
                }
                infowindow = new google.maps.InfoWindow({
                    content: contentString,
                    maxWidth: 250
                });
                infowindow.open(map, marker);
                for(var i = 0; i < sightsList.length;i++){
                    $("#sightsDesc").append("<hr style='border:1px dashed;'><label style='font-size: 14px;'>"+sightsList[i].sightsName+"</label><div>"+sightsList[i].sightsDesc+"</div>");
                }
                for(var i = 0; i < hotelList.length;i++){
                    $("#hotelDesc").append("<hr style='border:1px dashed;'><label style='font-size: 14px;'>"+hotelList[i].hotelName+"</label><div>"+hotelList[i].hotelDesc+"</div>");
                }
            },
        });
    }
</script>
<section class="login" id="hero">
    <div class="container">
        <div class="row">
            <div class="col-md-6  col-sm-12" style="margin-top:10%; ">
                <div id="floating-panel">
                    <input id="addressSearch" value="shanghai" style="color: black;">
                    <input id="searchCity" type="submit" value="Geocode" style="color: black;">
                </div>

                <div id="map" class="col-md-12  col-sm-12"></div>
            </div>
            <div class="col-md-6 col-sm-12" style="margin-top:10%;" align="left">
                <label><h4 style="color: white;">city descrition</h4></label>
                <div id="cityDesc"></div>
                <hr>
                <label><h4 style="color: white;">sights descrition</h4></label>
                <div id="sightsDesc"></div>
                <hr>
                <label><h4 style="color: white;">hotel descrition</h4></label>
                <div id="hotelDesc"></div>
            </div>
        </div>
    </div>
</section>
<!-- footer -->
<%@include file="/common/footer.jsp" %>
</body>
</html>
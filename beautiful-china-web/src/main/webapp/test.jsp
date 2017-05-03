<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #allmap{width:100%;height:500px;}
        p{margin-left:5px; font-size:14px;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=7eTHy7BrPv7CV5NpRBgR2V4oHCFteFmt"></script>
    <title>根据关键字本地搜索</title>
</head>
<body>
<div id="allmap"></div>
<p>返回北京市“景点”关键字的检索结果，并展示在地图上</p>
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    //云南24.9819259739,102.7699183100
    map.centerAndZoom(new BMap.Point(102.7699183100, 24.9819259739), 12);
    var local = new BMap.LocalSearch(map, {
        renderOptions:{map: map}
    });
    local.search("景点");
</script>
$(document).ready(function(){
    //判断是否从首页或者通过搜索进入列表页面
    var searchOne= $("#searchOne").val();//首次进入页面的搜索条件
    var page     = $("#page").val();//首次进入页面的页数
    if(page==1){
        var json = JSON.stringify({pageNumber:page,search:searchOne});
        getTours(json);
    }
});

/**
 * 按价格查询
 * @param pageNumber
 * @param priceMin
 * @param priceMax
 */
function searchPrice(pageNumber,priceMin,priceMax){
    var dayMin   = $("#dayMin").val();
    var dayMax   = $("#dayMax").val();
    var search   = $("#search").val();
    var json = JSON.stringify({pageNumber:pageNumber,priceMin:priceMin,priceMax:priceMax,
                               dayMin:dayMin,dayMax:dayMax,search:search});
    getTours(json);
}
/**
 * 按天数查询
 * @param pageNumber
 * @param dayMin
 * @param dayMax
 */
function searchDay(pageNumber,dayMin,dayMax){
    var priceMin = $("#priceMin").val();
    var priceMax = $("#priceMax").val();
    var search   = $("#search").val();
    var json = JSON.stringify({pageNumber:pageNumber,priceMin:priceMin,priceMax:priceMax,
        dayMin:dayMin,dayMax:dayMax,search:search});
    getTours(json);
}
/**
 * 获取页码
 */
function getPages(){
    var pageAll=$("#pageAll").val();
    if(pageAll=="0"){
        $('#visible-pages-example').hide();
        $("#content").text(empty_100001);
        $("#content").attr("align","center");
    }else{
        $('#visible-pages-example').show();
        var visiblePage=7;
        if(pageAll<7){
            visiblePage=pageAll;
        }
        //重新加载
        $('#visible-pages-example').empty();
        $('#visible-pages-example').removeData("twbs-pagination");
        $('#visible-pages-example').unbind("page");

        $('#visible-pages-example').twbsPagination({
            totalPages: pageAll,
            visiblePages: visiblePage,
            version: '1.1',
            onPageClick: function (event, pageNumber) {
                var searchOne= $("#searchOne").val();//判断是否是首次进入
                var search="";
                if(searchOne!=""){
                    search=searchOne;
                }else{
                    search   = $("#search").val();
                }
                var priceMin = $("#priceMin").val();
                var priceMax = $("#priceMax").val();
                var dayMin   = $("#dayMin").val();
                var dayMax   = $("#dayMax").val();
                var json = JSON.stringify({pageNumber:pageNumber,priceMin:priceMin,priceMax:priceMax,
                    dayMin:dayMin,dayMax:dayMax,search:search});
                $.ajax({
                    type: "POST",
                    url: "/toursList/getTours",
                    data: json,
                    contentType: "application/json",
                    dataType:"json",
                    success: function(msg){
                        if(msg.data=="0"){
                            $('#visible-pages-example').hide();
                            $("#content").text(empty_100001);
                            $("#content").attr("align","center");
                        }else{
                            var toursConditions=msg.data;//获取对象
                            //遍历记录
                            var data={
                                list:toursConditions.listBO
                            };
                            var html = template('test', data);
                            document.getElementById("content").innerHTML = html;
                            //条件的隐藏值
                            var data2={
                                pageNumber:toursConditions.pageNumber,
                                pageAll:toursConditions.pageAll,
                                priceMin:toursConditions.priceMin,
                                priceMax:toursConditions.priceMax,
                                dayMin:toursConditions.dayMin,
                                dayMax:toursConditions.dayMax,
                                search:toursConditions.search,
                            };
                            var html2 = template('test2', data2);
                            document.getElementById("content2").innerHTML = html2;
                        }
                    }
                });
            }
        });
    }
}
/**
 * 获取列表
 * @param json
 */
function getTours(json){
    $.ajax({
        type: "POST",
        url: "/toursList/getTours",
        data: json,
        contentType: "application/json",
        dataType:"json",
        success: function(msg){
            if(msg.data=="0"){
                $('#visible-pages-example').hide();
                $("#content").text(empty_100001);
                $("#content").attr("align","center");
            }else{
                var toursConditions=msg.data;//获取对象
                //遍历记录
                var data={
                    list:toursConditions.listBO
                };
                var html = template('test', data);
                document.getElementById("content").innerHTML = html;
                //条件的隐藏值
                var data2={
                    pageNumber:toursConditions.pageNumber,
                    pageAll:toursConditions.pageAll,
                    priceMin:toursConditions.priceMin,
                    priceMax:toursConditions.priceMax,
                    dayMin:toursConditions.dayMin,
                    dayMax:toursConditions.dayMax,
                    search:toursConditions.search,
                };
                var html2 = template('test2', data2);
                document.getElementById("content2").innerHTML = html2;
                getPages();
            }
        }
    });
}
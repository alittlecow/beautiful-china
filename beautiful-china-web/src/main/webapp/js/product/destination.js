$(document).ready(function () {
    var cityId=$("#cityId").val();
    var total=$("#total").val();//所有旅游线路的条数
    if(total>0){
        var page=0;
        var visiblePage=10;
        if(total%9==0){
            page=parseInt(total/9);
        }else{
            page=parseInt(total/9)+1;
        }
        if(page<7){
            visiblePage=page;
        }
        //根据当前选定的页数,访问服务器动态生成内容
        $('#visible-pages-example').twbsPagination({
            totalPages: page,
            visiblePages: visiblePage,
            version: '1.1',
            onPageClick: function (event, page) {
                //$('#page-content').text('Page ' + page);
                $.ajax({
                    type : "POST",
                    url : "/destination/getToursByCityId",//路径
                    data : {
                        page : page,
                        id:cityId
                    },//数据，这里使用的是Json格式进行传输
                    success : function(data) {//返回数据根据结果进行相应的处理
                        $("#allTours").empty();
                        var list = eval('(' + data + ')');
                        var text='';
                        for(var i=0;i<list.length;i++){
                            text+=
                                '<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.1s"><div class="tour_container">'
                                +' <div class="img_container"><a href="/toursdetail/'+list[i].tourId+'">'
                                + '<img src="'+list[i].image+'" class="img-responsive"  width="358" height="258" alt="">'
                                +' <div class="short_info">'
                                + '<span class="price"><sup>$</sup>'+list[i].price+ '</span></div></a></div>' +
                                '<div class="tour_title"><h3><strong>'+list[i].title+'</strong> tour</h3></div></div></div>'
                        }
                        $("#allTours").append(text);
                    }
                });
            }

        });
    }


    //判断页面上端的4张图片是否为空,为空则图片不显示
    if(!$("#photoOne").children("img").attr("data-lazyload")){
        $("#photoOne").remove();
    }
    if(!$("#photoTwo").children("img").attr("data-lazyload")){
        $("#photoTwo").remove();
    }
    if(!$("#photoThree").children("img").attr("data-lazyload")){
        $("#photoThree").remove();
    }
    if(!$("#photoFour").children("img").attr("data-lazyload")){
        $("#photoFour").remove();
    }
});


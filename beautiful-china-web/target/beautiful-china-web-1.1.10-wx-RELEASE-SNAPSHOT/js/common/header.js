/**
 * fengbaitong 2016.1.10
 * header页面里,对应的js文件
 */
$(document).ready(function(){


	//Destination下拉框数据初始化
	$.ajax( {
		url:'/destination/list',// 跳转到 action
		type:'get',
		dataType:'json',
		cache:true,
		success:function(data) {
			if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#destinationList").append("<li><a href='/destination/detail?id="+data[i].id+"'>"+data[i].name+"</a></li>");
				}
			}
		}

	});

	$.ajax( {
		url:'/theme/list',// 跳转到 action
		type:'get',
		dataType:'json',
		cache:true,
		success:function(data) {
			if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#themeList").append("<li><a href='/theme/detail?id="+data[i].id+"'>"+data[i].title+"</a></li>");
				}
			}
		}

	});


	$("#search_btn").click(function(){
		var search=$("#search_title").val();
		window.location.href="/toursList?search="+search;
	});
});




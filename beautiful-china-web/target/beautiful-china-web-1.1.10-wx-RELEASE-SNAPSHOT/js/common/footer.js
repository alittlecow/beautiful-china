/**
 * fengbaitong 2016.1.10
 * 主页面footer.jsp对应的js事件处理文件
 */
$(document).ready(function(){
	var cookieVal = getCookie("org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE");
	if(cookieVal=='en_US'){
		$("#lang").val('English');
	}else if(cookieVal=='fr_FR'){
		$("#lang").val('French');
	}

})

function changeLanguage(value){
	var language="";
	if(value=='French'){
		language="fr";
	}else if(value=='English'){
		language="en";
	}else if(value=='Chinese'){
		language="zh";
	}
	$.ajax( {
		url:'/setLanguage',// 跳转到 action
		type:'get',
		data:{langType:language},
		success:function(data) {
			location.assign(window.location.href);
		}
	});

}


function getCookie(cookie_name)
{
	var allcookies = document.cookie;
	var cookie_pos = allcookies.indexOf(cookie_name);   //索引的长度

	// 如果找到了索引，就代表cookie存在，
	// 反之，就说明不存在。
	if (cookie_pos != -1)
	{
		// 把cookie_pos放在值的开始，只要给值加1即可。
		cookie_pos += cookie_name.length + 1;      //这里容易出问题，所以请大家参考的时候自己好好研究一下
		var cookie_end = allcookies.indexOf(";", cookie_pos);

		if (cookie_end == -1)
		{
			cookie_end = allcookies.length;
		}

		var value = unescape(allcookies.substring(cookie_pos, cookie_end));         //这里就可以得到你想要的cookie的值了。。。
	}
	return value;
}




<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="/js/common/jquery-2.1.4.js"></script>
    <script>
      function userinfo(userId, userName){
        this.userId = userId;
        this.userName = userName;
      }

      function test1(){
        var userinfoRef = new userinfo('111', '2222');
        var jsonStringRef = JSON.stringify(userinfoRef);
        var json = JSON.stringify({userId:"sdsf",userName:"sdf22"});
        $.ajax({
          type: "POST",
          url: "/json/getJSON1",
          data: json,
          contentType: "application/json",
          dataType:"json",
          success: function(msg){
            alert( msg.result );
          }
        });
      }

      function test2(){
        var myArray =new Array();
        myArray[0]="中国1";
        myArray[1]="中国2";
        myArray[2]="中国3";
        myArray[3]="中国4";
        var jsonString=JSON.stringify(myArray);
        $.ajax({
          type: "POST",
          data: jsonString,
          url: "/json/getJSON2?t=" + new Date().getTime(),
          contentType: "application/json",
          dataType:'json',
          success:function(msg){
            alert(msg.result);
          }
        });
      }

      function test3(){
        var myArray=new Array();
        myArray[0]= new userinfo('中国1', '中国人1');
        myArray[1]= new userinfo('中国2', '中国人2');
        myArray[2]= new userinfo('中国3', '中国人3');
        myArray[3]= new userinfo('中国4', '中国人4');
        var jsonString=JSON.stringify(myArray);
        var jsonArray=[{userId:"1",userName:"name1"},{userId:"2",userName:"name2"}];
        var jsonString2=JSON.stringify(jsonArray);
        $.ajax({
          type: "POST",
          data: jsonString2,
          url: "/json/getJSON3.spring?t=" + new Date().getTime(),
          contentType: "application/json",
          dataType:'json',
          success:function(msg){
              alert(msg.result);
          }
        });
      }

      function test4(){
        var jsonObject={
          "username":"accp",
          "work":[{
            "address":"address1"
          },{
            "address":"address2"
          }],
          "school":{
            "name":"tc",
            "address":"pjy"
          }
        }
        var jsonString=JSON.stringify(jsonObject);
        $.ajax({
          type: "POST",
          data: jsonString,
          url: "/json/getJSON4.spring?t=" + new Date().getTime(),
          contentType: "application/json"
        });
      }


      function test6(){
        $.ajax({
          type: "POST",
          url: "/json/insertData" ,
          contentType: "application/json",
          dataType:'json',
          success:function(msg){
            alert(msg.result);
          }
        });
      }


      function test5(){
          var jsonArray=[{userId:"1",userName:"name1"},{userId:"2",userName:"name2"}];
          var jsonString=JSON.stringify(jsonArray);
          $.ajax({
              type: "POST",
              data: jsonString,
              url: "/json/getJSON5?t=" + new Date().getTime(),
              contentType: "application/json",
              dataType:'json',
              success:function(msg){
                  alert(msg.result);
              }
          });
      }
    </script>
</head>
<body>
<button type="button" onclick="test1()">test1</button>
<button type="button" onclick="test2()">test2</button>
<button type="button" onclick="test3()">test3</button>
<button type="button" onclick="test4()">test4</button>
<button type="button" onclick="test5()">test5</button>
<button type="button" onclick="test6()">插入数据</button>


</body>
</html>

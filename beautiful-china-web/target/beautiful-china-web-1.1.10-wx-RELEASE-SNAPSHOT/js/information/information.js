var divClass =[];
divClass[0]='col-md-2 col-sm-2 h6'; divClass[1]='col-md-2 col-sm-2 h6'; divClass[2]='col-md-2 col-sm-2 h6';
divClass[3]='col-md-2 col-sm-2 h6'; divClass[4]='col-md-4 col-sm-4 h6'; divClass[5]='col-md-4 col-sm-4 h6'
divClass[6]='col-md-2 col-sm-2 h6'; divClass[7]='col-md-2 col-sm-2 h6';
var formClass='form-group';
var paramClass='form-control';
var labelParam=[];
labelParam[0]='firstName';
labelParam[1]='lastName';
labelParam[2]='gender';
labelParam[3]='nationality';
labelParam[4]='email';
labelParam[5]='address';
labelParam[6]='passport';
labelParam[7]='phone';

var nameParam=[];
nameParam[0]='firstName';nameParam[1]='lastName';nameParam[2]='sex';nameParam[3]='nationality';nameParam[4]='email';
nameParam[5]='address';nameParam[6]='passport';nameParam[7]='tel';
var index=1;
var length=8;

$(document).ready(function () {

    //联系人信息模态框验证
    $("#saveContactForm").validate({
        errorClass:"msg_error",
        rules:{
            firstName: {
                required: true,
            },
            lastName: {
                required: true,
            },
            sex: {
                required: true,
            },
            nationality: {
                required: true,
            },
            email: {
                required: true,
                email:true
            },
            address: {
                required: true,
            },
            passport: {
                required: true,
            },
            tel: {
                required: true,
            },
        },
        errorPlacement: function (error, element) {
            var p = $("<p />").append(error);
            p.appendTo(element.parent());
        },
        messages:{
            firstName: {
                required: notnull,
            },
            lastName: {
                required: notnull,
            },
            sex: {
                required: notnull,
            },
            nationality: {
                required: notnull,
            },
            email: {
                required: notnull,
                email:erroremail
            },
            address: {
                required: notnull,
            },
            passport: {
                required: notnull,
            },
            tel: {
                required: notnull,
            },
        }
    });
    var userId = $("#hiddenId").val();
    var userNickName=$("#hiddenName").val();
    if (userNickName == "") {
        $("#loginFirst").modal();
        return;
    }
    if(userId!=""){
        getUserInfo();
    }
    //var userSex = $("#hiddenSex").val();
    //提交按钮点击事件
    $("#updateProfile").click(function () {
        var userNickName=$("#hiddenName").val();
        if (userNickName == "") {
            $("#loginFirst").modal();
            return;
        }
        var userId = $("#hiddenId").val();
        var sex = $("#sexInfo option:selected").val();
        var firstName = $("#firstName").val();
        var lastName = $("#lastName").val();
        var nickName = $("#nickName").val();
        var passport=$("#passport").val();
        //判断input内容是否为空
        if(sex==""){
            checkInfo(nullsex);
            return;
        }else{
            $("#check-info").hide();
        }
        if(firstName==""||lastName==""){
            checkInfo(nullUsername);
            return;
        }else{
            $("#check-info").hide();
        }
        if(nickName==""){
            checkInfo(nullnickname);
            return;
        }else{
            $("#check-info").hide();
        }
        if(passport==""){
            checkInfo(nullPassport);
            return;
        }else{
            $("#check-info").hide();
        }
        //转化sex信息
        if(sex=='F'){
            sex="F";
        }
        if(sex=='M'){
            sex="M";
        }
        var ordinaryUserVO = new userInfo(userId,firstName,lastName,nickName,sex,passport);
        var contactList = new Array();
        for(var i=0;i<index;i++){
            var firstName = $("#firstName"+i).val();
            var lastName = $("#lastName"+i).val();
            var sex = $("#sex"+i).val();
            var nationality = $("#nationality"+i).val();
            var email = $("#email"+i).val();
            var address = $("#address"+i).val();
            var passport = $("#passport"+i).val();
            var tel = $("#tel"+i).val();
            contactList[i]=new contact(userId,firstName,lastName, sex, nationality,email,address, passport, tel);
        }


        //json对象
        var jsonObject = {ordinaryUserVO: ordinaryUserVO, contactList: contactList};
        var jsonString = JSON.stringify(jsonObject);
        $.ajax({
            type: "POST",
            url: "/userInfo/changeInfo",
            data: jsonString,
            contentType: "application/json",
            dataType: "json",
            success: function (msg) {
                checkInfo(msg.msg);
                window.location.reload();
            }
        })
    });
    $("#addBtn").click(function(){
        $("#saveContactForm")[0].reset();
        $("#updateContactForm")[0].reset();
    });
    $("#saveBtn").click(function(){
        //验证输入信息
        if(!$("#saveContactForm").valid()){
            return;
        }

        var data = {};
        var values = $('#saveContactForm').serializeArray();
        $.each(values, function() {
            data[this.name] = this.value;
        });
        var jsonString =JSON.stringify(data);
        $.ajax({
            type: "POST",
            url: "/userInfo/saveContact",
            data:jsonString,
            contentType: "application/json",
            success: function (msg) {
                $("#saveContact").modal('hide');
                $("div[name='contact']").remove();
                getUserInfo();
            }
        })
    });
    $("#editBtn").click(function(){

        var id = $("#editId").val();
        var firstName = $("#editFirstName").val();
        var lastName = $("#editLastName").val();
        var sex = $("#editSex").val();
        var nationality = $("#editNationality").val();
        var email = $("#editEmail").val();
        var address = $("#editAddress").val();
        var passport = $("#editPassport").val();
        var tel = $("#editTel").val();

        var contacObject = new contact(id,userId,firstName,lastName,sex,nationality,email,address,passport,tel);

        var jsonString =JSON.stringify(contacObject);
        $.ajax({
            type: "POST",
            url: "/userInfo/saveContact",
            data:jsonString,
            contentType: "application/json",
            success: function (msg) {
                $("#updateContact").modal('hide');
                $("div[name='contact']").remove();
                getUserInfo();
            }
        })
    });
});


function contact(id,userId,firstName,lastName, sex, nationality,email, address, passport, tel) {
    this.id = id;
    this.userId = userId;
    this.firstName = firstName;
    this.lastName = lastName;
    this.sex = sex;
    this.nationality = nationality;
    this.email = email;
    this.address = address;
    this.passport = passport;
    this.tel= tel;
}
function userInfo(userId,firstName,lastName,nickName,sex,passport){
    this.userId=userId;
    this.firstName= firstName;
    this.lastName= lastName;
    this.nickname= nickName;
    this.sex= sex;
    this. passport=passport;
}
function checkInfo(message) {
    $("#check-info").show();
    $("#check-info").text(message);
}
function saveContact(id,num){
    for(var i=0;i<index;i++){
        var firstName = $("#firstName"+num).val();
        var lastName = $("#lastName"+num).val();
        var sex = $("#sex"+num).val();
        var nationality = $("#nationality"+num).val();
        var email = $("#email"+num).val();
        var address = $("#address"+num).val();
        var passport = $("#passport"+num).val();
        var tel = $("#tel"+num).val();
    }
    var contactVO = new contact(id,userId,firstName,lastName, sex, nationality,email,address, passport, tel);
    var jsonObject = {contactVO: contactVO};
    var jsonString = JSON.stringify(jsonObject);
    var url = "";
    $.ajax({
        type: "POST",
        url: "/userInfo/saveContact",
        data: jsonString,
        contentType: "application/json",
        dataType: "json",
        success: function (msg) {
            if(msg.result=='ok'){
               $("div[name='contact']").remove();
                getUserInfo();
            }

        }
    })
}


function deleteContact(id){
    $.ajax({
        type: "GET",
        url: "/userInfo/deleteContact",
        data: {id: id},
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {

            if(msg.result=='ok'){
                $("div[name='contact']").remove();
                getUserInfo();
            }
        }
    });
}


function getUserInfo(){
    var id=$("#hiddenId").val();
    $.ajax({
        type: "GET",
        url: "/userInfo/getUserInfo",
        data: {id: id},
        contentType: "application/json",
        dataType: 'json',
        success: function (msg) {
            var user=msg.data;
            $("#userNameSpan").text(user.firstName+"    "+user.lastName);
            //$("#login_link").text(user.name);
            $("#userNickSpan").text(user.nickname);
            var sex=user.sex;
            if(sex=="F"){
                $("#userSexSpan").text(female);
            }if(sex=="M"){
                $("#userSexSpan").text(male);
            }
            $("#userPortSpan").text(user.passport);
            $("#userTimeSpan").text(user.regtime);
            $("#userEmailSpan").text(user.email);
            $("#firstName").val(user.firstName);
            $("#lastName").val(user.lastName);
            $("#nickName").val(user.nickname);
            $("#passport").val(user.passport);

            if (user.sex == "F") {
                $("select option[value='F']").attr("selected", "selected");
            }
            if (user.sex == "M") {
                $("select option[value='M']").attr("selected", "selected");
            }

            var html="";
            var values = new Array();
            for(var x=0;x<user.contactList.length;x++){
             html+= "<div name='contact' class='panel-group' id='accordion"+x+"'> <div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'>"+
                       "<a data-toggle='collapse' data-parent='#accordion"+x+"' href='#collapse"+x+"'>Concat&nbsp;&nbsp;"+(x+1)+"</a></h4></div>"+
                       "<div class='panel-collapse' id= 'collapse"+x+"'><div class='panel-body'><div class='row'><div class='col-md-12 col-sm-12'>"+
                       "<h4 class='panel-heading'>"+user.contactList[x].firstName+"&nbsp;&nbsp;"+user.contactList[x].lastName+"</h4>";
                for(var i=0;i<length;i++) {
                    var textValue =eval("user.contactList[x]." + nameParam[i]);
                    var id = user.contactList[x].id;
                    values[0]=id;
                    if(textValue=='F'){
                        html+="<dl class='dl-horizontal'><dt><strong>"+eval(labelParam[i])+"</strong></dt><dd>"+female+"</dd></dl>";
                    }else if(textValue=='M'){
                        html+="<dl class='dl-horizontal'><dt><strong>"+eval(labelParam[i])+"</strong></dt><dd>"+male+"</dd></dl>";
                    }else{
                        html+="<dl class='dl-horizontal'><dt><strong>"+eval(labelParam[i])+"</strong></dt><dd>"+textValue+"</dd></dl>";
                    }
                    values[i+1]="'"+textValue+"'";
                }
                html+="<div style='text-align:right'><a class='btn btn-default' href='javascript:void(0)' role='button' onclick=update("+values+")"+
                     ">"+edit+"</a>&nbsp;&nbsp;<a class='btn btn-default' href='javascript:deleteContact("+id+")' role='button'>"+del+"</a></div></div></div></div></div></div></div>";
            }
            $("#addBtn").after(html);
        }
    });
}

function update(id,firstName,lastName,sex,nationality,email,address,passport,tel){
    $("#editId").val(id);
    $("#editFirstName").val(firstName);
    $("#editLastName").val(lastName);
    $("#editSex").val(sex);
    $("#editNationality").val(nationality);
    $("#editEmail").val(email);
    $("#editAddress").val(address);
    $("#editPassport").val(passport);
    $("#editTel").val(tel);
    $("#updateContact").modal('show');
}
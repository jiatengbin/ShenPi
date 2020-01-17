
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>添加信息</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="./js/jquery.min.js"></script>
    <style>
        body{
        }
        .container{
            margin-top:100px;
            border-radius:10px;
            padding-top:50px;
            padding-bottom:50px;
            align:center;
            background-color:white;
            opacity:0.8;
            width:500px;
        }
        form{
            margin-top:20px;
        }
        .form-group{
            align:center;
            width:350px;
            margin:auto;
            position:relative;
        }
        h2{
            border-bottom:5px solid red;
            padding-bottom:10px;
            text-align:center;
            width:100%;
        }
        .label{
            float:left;
            width:80px;
            margin-top:7px;
            margin-right:5px;
            text-align:left;
        }
        .form-control{
            width:200px;
            margin-top:7px;
        }
        .sex{
            border:0px solid #000;
            width:200px;
            margin-top:7px;
        }
        .sign{
            width:160px;
            margin-top:10px;
        }
        .tip{
            position:relative;
            width:100%;
            height:auto;
            padding:5px;
        }
        .tip .tipicon{
            float:left;
            background-repeat:no-repeat;
            background-position:center;
            background-size:cover;
            width:20px;
            height:20px;
        }
        .tipmessage{

            color:red;
            font-size:15px;
        }

        .tip{
            display:none;
        }
        .righttip{
            display:none;
            position:absolute;
            right:8px;
            top:8px;
            width:25px;
            height:25px;
            background-repeat:no-repeat;
            background-position:center;
            background-size:cover;
        }

    </style>

    <script type="text/javascript">
        function isMobileNumber(phone) {
            var flag = false;
            var message = "";
            var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[4-9]{1})|(18[0-9]{1})|(199))+\d{8})$/;
            if (myreg.test(phone)){
                flag = true;
            }
            return flag;
        }

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg); //获取url中"?"符后的字符串并正则匹配
            var context = "";
            if (r != null)
                context = r[2];
            reg = null;
            r = null;
            return context == null || context == "" || context == "undefined" ? "" : context;
        }




        function isPwd(password)
        {
            var myreg=/[0-9a-zA-Z]+/;
            if(!myreg.test(password))
                return false;
            else
                return true;
        }

        function isId(id)
        {
            if((id[0]=="4")&&(id[1]=="1")&&(id[2]=="1"))
                return true;
            else
                return false;
        }

        function inputusername()
        {
            var username=$("#usr").val();
            var tip1=$("#tip1");
            var tip_1=$("#tip_1");
            if(!((username[0]>='a'&&username[0]<='z')||(username[0]>='A'&&username[0]<='Z')))
            {
                $("#usr").next().css("display","none");
                tip1.css("display","block");
                tip_1.html("用户名必须以英文字母开头！");
            }
            else if(username.length<6||username.length>12){
                $("#usr").next().css("display","none");
                tip1.css("display","block");
                tip_1.html("用户名必须为6-12位字符！");
            }
            else
            {
                tip1.css("display","none");
                $.post(
                    "UserServlet",
                    {username:username},
                    function(data){
                        if(data=="yes"){
                            tip1.css("display","none");
                            $("#usr").next().css("display","block");
                        }
                        else{
                            $("#usr").next().css("display","none");
                            tip1.css("display","block");
                            tip_1.html("用户名已被注册！");
                        }
                    },
                    "text"
                );
            }
        }

        function inputId()
        {
            var id=$("#id").val();
            var tip4=$("#tip4");
            var tip_4=$("#tip_4");
            if(!isId(id))
            {
                $("#id").next().css("display","none");
                tip4.css("display","block");
                tip_4.html("身份证号必须以411开头！");
            }
            else if(id.length!=18){
                $("#id").next().css("display","none");
                tip4.css("display","block");
                tip_4.html("请输入18位身份证号！");
            }
            else
            {
                tip4.css("display","none");
                $.post(
                    "IdServlet",
                    {id:id},
                    function(data){
                        if(data=="yes"){
                            tip4.css("display","none");
                            $("#id").next().css("display","block");
                        }
                        else{
                            $("#id").next().css("display","none");
                            tip4.css("display","block");
                            tip_4.html("该身份证号已存在！");
                        }
                    },
                    "text"
                );
            }
        }

        function inputpassword()
        {
            var password=$("#pwd").val();
            var tip2=$("#tip2");
            var tip_2=$("#tip_2");
            if(password.length<8)
            {
                $("#pwd").next().css("display","none");
                tip2.css("display","block");
                tip_2.html("请输入8位以上密码！");
            }
            else if(!isPwd(password)){
                $("#pwd").next().css("display","none");
                tip2.css("display","block");
                tip_2.html("密码仅由英文或数字组成！");
            }
            else{
                tip2.css("display","none");
                $("#pwd").next().css("display","block");
            }
        }





        function isEmpty()
        {
            if($("#usr").val()==""||$("#pwd").val()==""||$("#name").val()==""||$('input[name="sex"]:checked').val()==""||$("#sel1").val()==""||
                $("#agency").val()==""||$("#major").val()==""||$("#classnum").val()==""||$("#birthplace").val()==""
                ||$("#email").val()==""||$("#id").val()==""||$("#text").val()=="")
            {
                alert("请将信息填写完整！");
                return false;
            }
            return true;
        }

        function getResult()
        {
            if(GetQueryString("result")=="true")
                alert("添加成功！");
            else if(GetQueryString("result")=="false")
                alert("添加失败！");
        }

        var inputs=document.getElementsByTagName("input");
        for(var i=0;i<inputs.length;i++)
        {
            inputs[i].onkeyup=function(event){
                if(event.keyCode=13){
                    var next=this.nextElementSibling.nextElementSibling;
                    next.focus();
                }
            }
        }

    </script>

</head>

<body onload="getResult()">
<div class="container">
    <h2>在线审批用户注册</h2>
    <form action="Signin_do" method="post">
        <div class="form-group">
            <label for="usr" class="label">账号:</label>
            <input type="text" class="form-control" id="usr" name="username" oninput="inputusername()" placeholder="请输入用户名">
            <div class="righttip"></div>
            <div class="tip" id="tip1">
                <div class="tipicon"></div>
                <div id="tip_1" class="tipmessage"></div>
            </div>
        </div>
        <div class="form-group">
            <label for="pwd" class="label">密码:</label>
            <input type="password" class="form-control" id="pwd" name="password" placeholder="请输入密码" oninput="inputpassword()">
            <div class="righttip"></div>
            <div class="tip" id="tip2">
                <div class="tipicon"></div>
                <div id="tip_2" class="tipmessage"></div>
            </div>
        </div>

        <div class="form-group">
            <label class="label" for="sex">性别：</label>
            <div class="sex form-control" id="sex">
                <label class="radio-inline"><input type="radio" name="sex" value="男">男</label>
                <label class="radio-inline"><input type="radio" name="sex" value="女">女</label>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="label">姓名:</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
        </div>

        <div class="form-group">
            <label for="name" class="label">身份证号:</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="请输入身份证号" oninput="inputId()">
            <div class="righttip"></div>
            <div class="tip" id="tip4">
                <div class="tipicon"></div>
                <div id="tip_4" class="tipmessage"></div>
            </div>
        </div>
        <input type="submit" class="sign btn btn-primary btn-lg" value="注册" onclick="return isEmpty()">

    </form>


</div>

</body>
</html>

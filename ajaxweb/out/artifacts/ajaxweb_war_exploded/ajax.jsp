<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/11/12
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function ajaxReq() {
            //获取用户请求数据
            var uname=document.getElementById("uname").value;
            var data="name="+uname;
            //创建ajax引擎对象
            var ajax;
            if(window.XMLHttpRequest){
                ajax=new XMLHttpRequest();
            }else if(window.ActiveXObject){
                ajax=new ActiveXObject("Msxml2.XMLHTTP");
            }
            //复写onreadystatechange函数
            ajax.onreadystatechange=function(){
                //判断ajax状态码
                if(ajax.readyState==4){
                    //判断响应状态码
                    if(ajax.status==200){
                        //获取响应内容
                        var result=ajax.responseText;
                        //处理响应内容
                        alert(result);
                    }
                }
            }
            //发送请求
            //get方式：请求实体拼接在url后面
            // ajax.open("get","ajax?"+data);
            // ajax.send(null);
            //post方式:请求实体需要单独的发送
            ajax.open("post","ajax");
            ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            ajax.send("name=张三&pwd=999");
        }
    </script>
    <style type="text/css">
        #showdiv{
            border: solid 1px;
            width: 200px;
            height: 100px;
        }
    </style>
</head>
<body>
<form action="" enctype="application/x-www-form-urlencoded"></form>
<h3>ajax的认识</h3>
<hr>
<input type="text" name="uname" id="uname" value=""/>
<input type="button" value="test" onclick="ajaxReq();"/>
<div id="showdiv"></div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/11/12
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>ajax认识</title>
  <%--
  ajax认识：
  概念：局部刷新技术，是多种技术的组合，是浏览器端的技术
  作用：实现在当前页面显示其他请求的响应内容
  使用：流程如下：
          创建ajax引擎对象
          覆写onreadystatement函数
          判断ajax状态码
          判断响应状态码
              获取响应内容(响应内容的格式)
              普通字符串 json XML数据
          获取响应内容
          处理响应内容 js操作文档结构
          发送请求:
              get请求 get的请求实体拼接在url后面 ？隔开 键值对
              ajax.open("get","url");
              ajax.send(null);

              post请求 有单独的请求实体
              ajax.open("post","url");
              ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
              ajax.send("name=张三&pwd=123");
          ajax的状态码：readyState:0,1,2,3,4 4表示响应内容被成功接收
          响应状态码：200，404，500
          ajax的异步和同步
          ajax.open(method,uri,boolean); true代表异步 false代表同步 默认是异步
  --%>
    <script type="text/javascript">
      function getData() {
          //创建ajax引擎对象
          var ajax;
          if(window.XMLHttpRequest){//火狐
              ajax=new XMLHttpRequest();
          }else if(window.ActiveXObject){//ie
              ajax=new ActiveXObject("Msxml2.XMLHTTP");
          }
          //覆写onreadystatement函数
          ajax.onreadystatechange = function(){
              //判断ajax状态码
              //判断Ajax状态吗
              if(ajax.readyState==4){
                  //判断响应状态吗
                  if(ajax.status==200){
                      //获取响应内容
                      var result=ajax.responseText;
                      //处理响应内容
                      //获取元素对象
                      var showdiv=document.getElementById("showdiv");
                      showdiv.innerHTML=result;
                  }else if(ajax.status==404){
                      //获取元素对象
                      var showdiv=document.getElementById("showdiv");
                      showdiv.innerHTML="请求资源不存在";
                  }else if(ajax.status==500){
                      //获取元素对象
                      var showdiv=document.getElementById("showdiv");
                      showdiv.innerHTML="服务器繁忙";
                  }
              }else {
                  //获取元素对象
                  var showdiv=document.getElementById("showdiv");
                  showdiv.innerHTML="<image src='img/2.gif' width='200px' height='100px'/>";
              }
          }
          //发送请求
          ajax.open("get","ajax",true);
          ajax.send(null);
          // alert("888888888888888888");
      }
    </script>
    <style type="text/css">
      #showdiv{
        border : solid 1px;
        width: 200px;
        height: 100px;
      }
    </style>
  </head>
  <body>
  <h3>ajax的认识</h3>
  <hr>
  <input type="button" value="text" onclick="getData();"/>
  <div id="showdiv"></div>
  </body>
</html>

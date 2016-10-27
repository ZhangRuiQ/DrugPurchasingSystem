<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
	<link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">
    <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap-responsive.min.css'/>" rel="stylesheet" media="screen">
    <link href="<c:url value='/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css'/>" rel="stylesheet" media="screen">
    <link href="<c:url value='/bootstrap/vendors/jGrowl/jquery.jgrowl.css'/>" rel="stylesheet" media="screen">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <style type="text/css">
  #modify{ margin:5% 25% 0 25%;}
  </style>
  
  <body>
  <div id="modify">
  <form class="form-horizontal" id="myForm">
  <div class="control-group" id="divOldPasswd">
    <label class="control-label" for="inputOldPasswd">旧密码</label>
    <div class="controls">
      <input type="text" id="inputOldPasswd" name="oldPasswd" placeholder="输入旧密码">
       <p class="text-error" id="information1"></p>
    </div>

  </div>
  <div class="control-group" id="divNewPasswd">
    <label class="control-label" for="inputNewPasswd">新密码</label>
    <div class="controls">
      <input type="password" id="inputNewPasswd" name="newPasswd" placeholder="输入新密码">
       <p class="text-error" id="information2"></p>
    </div>
  </div>
  <div class="control-group" id="divAgainPasswd" >
    <label class="control-label" for="inputAgainPasswd">再次输入新密码</label>
    <div class="controls">
      <input type="password" id="inputAgainPasswd" name="againPasswd" placeholder="再次输入新密码">
      <p class="text-error " id="information3"></p>
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button type="button" class="btn btn-primary" onclick="modify_passwd()">修改</button>
    </div>
  </div>
</form>
</div>

    <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>

<script>
	
	$("#inputOldPasswd").blur(function(){
		if( "" == $("#inputOldPasswd").val() ){
			$("#information1").text("旧密码不能为空！");
		}else{
			$("#divOldPasswd").attr("class","control-group success");
			$("#information1").text("");
		}
	});
	
	$("#inputNewPasswd").blur(function(){
		if( "" == $("#inputNewPasswd").val() ){
			$("#information2").text("新密码不能为空！");
		}else if( $("#inputNewPasswd").val().length < 6 ){
			$("#information2").text("新密码不能小于6位！");
		}else{
			$("#divNewPasswd").attr("class","control-group success");
			$("#information2").text("");
		}
	});
	
	$("#inputAgainPasswd").blur(function(){
		if( "" == $("#inputAgainPasswd").val() ){
			$("#information3").text("重复密码不能为空！");
		}else if( $("#inputAgainPasswd").val().length < 6 ){
			$("#information3").text("重复密码不能小于6位！");
		}else{
			$("#divAgainPasswd").attr("class","control-group success");
			$("#information3").text("");
		}
	});

	//修改密码
	function modify_passwd(){
		var newPasswd = $("#inputNewPasswd").val(); 
		var againPasswd = $("#inputAgainPasswd").val();
		
		if( "" == $("#inputOldPasswd").val() || "" == newPasswd || "" == againPasswd ){
			alert("输入不能为空！");
		}else if( $("#inputNewPasswd").val().length < 6 ){
			$("#information2").text("新密码不能小于6位！");
		}else if( $("#inputAgainPasswd").val().length < 6 ){
			$("#information3").text("重复密码不能小于6位！");
		}else{
			if(newPasswd != againPasswd){
				$("#divAgainPasswd").attr("class","control-group error");
				alert("再次输入密码不一致！请检查再次输入的密码");
			}else{
				
				$.ajax({url:"<c:url value='/healthBureau/modify_passwd.action' />",
					type:"POST",
					data:$("#myForm").serialize(),
					async:true,
					cache:false,
					success:function(data){	
						alert(data);
						if("修改密码成功!" == data){
		                	window.top.location='<c:url value='/common/logout.action'/>';
		                } 
						if("抱歉，您输入的旧密码错误!请重新输入" == data){
							$("#information1").text("请重新输入旧密码！");
							$("#divOldPasswd").attr("class","control-group error");
		                } 
					},
					error: function(){		//没有设置type="button"报error
					    alert(arguments[1]);
					}
				});	
			}
		}
		
	}
	
	
	
</script>
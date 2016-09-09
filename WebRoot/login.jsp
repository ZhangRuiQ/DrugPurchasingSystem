<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>药品集中采购系统登录界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min3.3.css'/>" />

<style type="text/css">
html,body {
	height: 100%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width: 500px;
	height: 400px;
	position: absolute;
	top: 40%;
	margin-top: -200px;	/*设置负值，为要定位子盒子的一半高度*/	
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}	

.form {
	width: 100%;
	max-width:500px;
	height: 345px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 370px;
	width: 100%;
	max-width:500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}		
	
	
.input-group {
	margin: 0px 0px 30px 0px !important;
}
.form-control,
.input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}
.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
</style>

  </head>
  
 <body>
<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>药品集中采购系统</small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form action="#" method="post" >
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="username" name="username" class="form-control" placeholder="用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="password" name="password" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>



	<div class="form-group">
					<div class="col-xs-5  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="text" id="verfity" name="verfity" class="form-control" placeholder="验证码"/>
						</div>
					</div>
					<div class="col-xs-2  ">
                    <div class="input-group">
					
					<img id="vertifyCodeImage" src="<c:url value='/common/vertifyImage.action'/>">
					
                    </div>
					</div>
					<div class="col-xs-5  ">
                    <div class="input-group">
					 <a href="javascript:_change()">
					看不清，换一张
					</a>
                    </div>
					</div>
				</div>















				<div class="form-group">
				
				<div class="col-xs-4 col-xs-offset-">
					<div class=" ">
  <label>
    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
    医疗机构
  </label>
</div>
<div class="  ">
  <label>
    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
   监管机构
  </label>
</div>
		</div>		
				
				
					<div class="col-xs-4  ">
						<button type="submit" class="btn btn-sm btn-info"><span class="glyphicon glyphicon-off"></span> 登录</button>
					</div>

</div>

		<div class="form-group">
<div class="col-xs-6 "  >
<p class="text-center remove-margin"><small>忘记密码？</small> <a href="javascript:_clicks()" ><small>找回</small></a>
						</p></div>

				</div>
			
		
			</form>

			</div>
		</div>
	</div>
</div>


</body>
   <script src="bootstrap/vendors/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
//验证码更换
function _change() {
		/*
		1. 获取<img>元素
		*/
		
		var ele = document.getElementById("vertifyCodeImage");
		ele.src = "<c:url value='/common/vertifyImage.action'/>?xxx=" + new Date().getTime();
		
	}
	
	//验证码更换
	$("#vertifyCodeImage").click(function(){
		
			var ele = document.getElementById("vertifyCodeImage");
		ele.src = "<c:url value='/common/vertifyImage.action'/>?xxx=" + new Date().getTime();
	
	});
	
	//离开焦点
	$("#verfity").blur(function(){
	alert("afdsadfasd");
		ajax({url:"/common/verificationCode",async:false});	

});
	
	//登录
		function _clicks(){
	
	
		
	
	
	}
	

</script>
</html>

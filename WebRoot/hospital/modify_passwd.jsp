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
    

    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#information,#information1,#information3{
	color: red;
	}

	
	</style>
<link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">
         <style type="text/css">
  #modify{ margin:5% 25% 0 25%;}
  </style>
  </head>
       <body>
    <div id="modify">
   <form id="myForm" class="form-horizontal" action="<c:url value='/hospital/null_modifyPasswd'/>"> 
  <div class="control-group">
    <label class="control-label col-xs-2" for="inputOldPasswd">旧密码</label>
    <div class="controls col-xs-4">
      <input type="password" name="oldPasswd" id="inputOldPasswd" placeholder="输入旧密码">
       <span id="information" class="help-inline"></span>
    </div>

  </div>
  <div class="control-group">
    <label class="control-label" for="inputNewPassword">新密码</label>
    <div class="controls">
      <input type="password" id="inputNewPassword" name="newPasswd" placeholder="输入新密码">
       <span class="help-inline" id="information1"></span>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputNewPasswordAgain">再次输入新密码</label>
    <div class="controls">
      <input type="password" id="inputNewPasswordAgain" placeholder="再次输入新密码">
      <span class="help-inline"id="information2"></span>
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button id="btn" type="button" class="btn btn-primary btn-large">修改</button>
    </div>
  </div>
</form>
</div>

  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
       <script type="text/javascript">
       $("#inputNewPassword").blur(function(){
    	   var passwdnew=$("#inputNewPassword").val();
       			var ss=0
       			for(i=0;i<passwdnew.length;i++){
       			 if(passwdnew.charAt(i)==" "){ss=1;}
       			}
       			if(ss==1)
       				{
       				$("#information1").text("密码不允许空格");
       				}
       			else if(passwdnew.length<6||passwdnew.length>13){
       				$("#information1").text("密码位数为6~13");
    		   
    	   }
 alert(ss);
       });
       
       $("#bto").click(function(){
    	   $("#bto").attr("disabled","disabled");
    	   $("#myForm").submit();
       })
      
		
		
       </script>
</html>

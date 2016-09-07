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
<link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">
         <style type="text/css">
  #modify{ margin:5% 25% 0 25%;}
  </style>
  </head>
       <body>
    <div id="modify">
  <form class="form-horizontal">
  <div class="control-group">
    <label class="control-label" for="inputOldPasswd">旧密码</label>
    <div class="controls">
      <input type="text" id="inputOldPasswd" placeholder="输入旧密码">
       <span class="help-inline">Something may have gone wrong</span>
    </div>

  </div>
  <div class="control-group">
    <label class="control-label" for="inputNewPassword">新密码</label>
    <div class="controls">
      <input type="password" id="inputNewPassword" placeholder="输入新密码">
       <span class="help-inline">Something may have gone wrong</span>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputNewPasswordAgain">再次输入新密码</label>
    <div class="controls">
      <input type="password" id="inputNewPasswordAgain" placeholder="再次输入新密码">
      <span class="help-inline">Something may have gone wrong</span>
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button type="submit" class="btn btn-primary btn-large">修改</button>
    </div>
  </div>
</form>
</div>

  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
       
</html>

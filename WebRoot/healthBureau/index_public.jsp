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
  p{ margin-left:85%};
  
  </style>
  </head>
      <body>
    <div class="jumbotron">
    <br>
    <br>
    <br>
    <br>
  <h1><small>Hello, 如果有什么意见，请麻烦您填写意见........</small></h1>

  <p><a class="btn btn-primary btn-lg" href="<c:url value='healthBureau/root_propose.jsp'/>" role="button">意见反馈</a></p>
</div>


  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
 
</html>

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
      
  </head>

  <body>
  <div class="container-fluid">
  <div style="margin-top:2%" class="row-fluid">
    <div class="navbar">
  <div class="navbar-inner">
    <a class="brand" href="#">操作手册</a>
</div>


    </div>
  </div>




<!--内容----------sdfasd-->


<!--下载-->
  <div style="margin-top:1%" class="row-fluid">
    <div class="offset10">
    <a class="btn btn-primary"><i class="icon-download  icon-white"></i>下载手册</a>
</div>
</div>



  </div>


  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
 
</html>

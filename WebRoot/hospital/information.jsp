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
    <a class="brand" href="#">账号信息</a>
</div>
</div>
</div>
 <div style="margin-top:2%" class="row-fluid">
 <div class="offset2 span8">
<table  class="table table-bordered">
<tr>
<td><b>单位名称：</b></td>
<td>xxxx医院</td>
</tr>
<tr>
<td><b>级别：</b></td>
<td>三级甲等医院</td>
</tr>
<tr>
<td><b>联系电话：</b></td>
<td>65465465465</td>
</tr>
<tr>
<td><b>地址</b>：</td>
<td>中华人民共和国xxx省xxx市xxx区xxx..........</td>
</tr>
</table>
</div>
</div>
  <div style="margin-top:1%" class="row-fluid">
    <div class="offset10">
    <a href="modify_passwd.html" class="btn btn-primary">修改密码</a>
</div>
</div>

</div>

  

  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
       
</html>

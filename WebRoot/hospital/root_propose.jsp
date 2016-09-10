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
    <a class="brand" href="<c:url value='/hospital/root_propose.jsp'/>">意见反馈</a>
</div>


    </div>
  </div>


   <div style="margin-top:2%" class="row-fluid">
   <!--同时发送到qq邮箱中-->
<form class="form-horizontal">
  <div class="control-group">
    <label class="control-label" for="themeInput">主题</label>
    <div class="controls">
      <input type="text" id="themeInput" class="input-xxlarge" placeholder="主题"><button  type="submit" class="btn"><i class="icon-picture"></i></button>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="contentInput">内容</label>
    <div class="controls">
    <textarea name="" style="" class="span10" id="contentInput" placeholder="请写出你的建议" cols="30" rows="10"></textarea>
    </div>
  </div>
   <div class="control-group">
    <div class="controls">
      
        <button type="submit" class="offset9 btn btn-success btn-large">发送</button>
    </div>
  </div>
</form>


 
</div>
</div>
  

  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
   
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>    
    <head>
<!DOCTYPE html>    
    <head>
        <title>意见反馈</title>
        <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
        <!-- Bootstrap -->
        <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap-responsive.min.css'/>" rel="stylesheet" media="screen">
        <!-- <link href="assets/styles.css" rel="stylesheet" media="screen"> -->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    
<body>
	<div class="container-fluid">
		<div style="margin-top:2%" class="row-fluid">
			<div class="navbar">
				<div class="navbar-inner">
					<a class="brand" href="#">意见反馈</a>
				</div>


			</div>
		</div>


		<div style="margin-top:2%" class="row-fluid">
			<!--同时发送到qq邮箱中-->
			<form class="form-horizontal" action="<c:url value='/healthBureau/sendMail.action' />" id="myForm">
				<div class="control-group">
					<label class="control-label" for="themeInput">主题</label>
					<div class="controls">
						<input type="text" id="themeInput" name="subject" class="span8" placeholder="主题">
						<button type="button" class="btn">
							<i class="icon-picture"></i>
						</button>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="contentInput">内容</label>
					<div class="controls">
						<textarea name="text" style="" class="span8" id="contentInput"
							placeholder="请写出您的建议" cols="20" rows="10"></textarea>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">

						<button type="submit" class="offset7 btn btn-success">发送</button>
					</div>
				</div>
			</form>



		</div>
	</div>




	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="vendors/jquery-1.9.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
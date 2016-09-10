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
        <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap-responsive.min.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/assets/styles.css'/>" rel="stylesheet" media="screen">
	
	
	
 <title>药品集中采购系统</title>
  </head>
  
  <body>
      <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="<c:url value='/hospital/index.jsp'/>">药品集中采购系统</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i>${hospital.name }<i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                      <li>
                                        <a tabindex="-1" target="iframe1" href="<c:url value='/hospital/modify_passwd.jsp'/>" class="inner_navigation">修改密码</a>
                                    </li>

                                    <li>
                                        <a tabindex="-1" href="<c:url value='/common/logout.action'/>">注销</a>
                                    </li>
                                    

                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li id="index_jsp"  class=" active navigation ">
                                <a href="<c:url value='/hospital/index.jsp'/>" class="navigation_event">主页</a>
                        
                            </li>
                            
                            <li class="dropdown navigation">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">目录 <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="<c:url value='/hospital/information.jsp'/>" class="navigation_event" target="iframe1">信息</a>
                                    </li>  
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="<c:url value='/hospital/help.jsp'/>" class="navigation_event" target="iframe1">操作手册</a>
                                    </li>
                                </ul>
                            </li>
                           
                            <li class="navigation">
                        
                                <a href="<c:url value='/root_propose.jsp'/>" class="navigation_event" target="iframe1">意见反馈</a>
                            	
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2" id="sidebar">
                     <div class="accordion" id="accordion2">
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                 药品目录
                              </a>
                            </div>
                            <div id="collapseOne" class="accordion-body collapse in">
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_medicine_search.action' />" target="iframe1">药品目录查询</a></div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                                 采购单管理
                              </a>
                            </div>
                            <div id="collapseTwo" class="accordion-body collapse">
                            
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_purchase_new.action'/>" target="iframe1">采购单创建</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_purchase_search.action'/>" target="iframe1">采购单列表</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_purchase_maintain.action'/>" target="iframe1">采购单修改</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_purchase_put.action'/>" target="iframe1">采购入库</a></div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                                 退货单管理
                              </a>
                            </div>
                            <div id="collapseThree" class="accordion-body collapse">
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_back_new.action'/>" target="iframe1">退货单创建</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_back_search.action'/>" target="iframe1">退货单列表</a></div>
                        
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
                                 统计分析
                              </a>
                            </div>
                            <div id="collapseFour" class="accordion-body collapse">
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_statistics_medicine.jsp'/>" target="iframe1">按药品统计</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_statistics_hospital.jsp'/>" target="iframe1">按医院统计</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_statistics_supplier.jsp'/>" target="iframe1">按供应商统计</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="<c:url value='/hospital/jump_statistics_business.jsp'/>" target="iframe1">交易明细查询</a></div>
                            </div>
                          </div>
                        
                    </div>   
                </div>
                
                <!--/span-->
                <div class="span10" ><!-- id="content" -->
                    <div class="row-fluid">
                        <div class="navbar">
                            <div class="navbar-inner">
	                               <ul class="breadcrumb">
	                                <i class="icon-chevron-left hide-sidebar"></i>
	                                <i class="icon-chevron-right show-sidebar" style="display:none;"></i>
	                                <li>
	                                    <a href="<c:url value='/hospital/index_public.jsp'/>" target="iframe1" id="catalogue" >公告</a> 
	                                </li>
	                            </ul>
                            </div>
                        </div>
                    </div>
                     <iframe  name="iframe1" id="frame1" style="zoom: 0.8;" height="840" src="<c:url value='/hospital/index_public.jsp'/>" frameBorder="0" width="100%"></iframe> 
                </div>
            </div>
            <hr>
            <footer>
                <p align="center" >&copy; 测试版 design by 2016</p>
            </footer>
        </div>
   
  </body>
  <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.js'/>"></script>
        <script src="<c:url value='/bootstrap/assets/scripts.js'/>"></script>
    <script>
        $(function() {
  
            // Easy pie charts
            $("#frame1").attr("src","<c:url value='/hospital/index_public.jsp'/>");
            $('.chart').easyPieChart({animate: 1000});
        });
		
		//函数清空主导航栏的active状态
		function  clear_nav(){
		$(".navigation").removeClass("active");
		};


		//导航栏触发
		$(".navigation_event").click(function(){
			clear_nav();
			//找到触发对象包含父亲节点navigation的节点
			var parent=$(this).parent();
			while(!$(parent).hasClass("navigation"))
				{
					parent=$(parent).parent();
				}

			$(parent).addClass("active");

			var Str_a=$(this).attr("href");
			var Str_text=$(this).text();
			if (Str_text=="主页") 
				{

				}
			else{
				$("#catalogue").attr("href",Str_a);
				$("#catalogue").text(Str_text);
				}
		
	});

		//内部导航栏触发
				$(".inner_navigation").click(function(){
			//active是否在主页上
			if($("#index_jsp").hasClass("active"))
			{
				
			}
			else
			{
				clear_nav();
				$("#index_jsp").addClass("active");

			}

			var Str_a=$(this).attr("href");
			var Str_text=$(this).text();

				$("#catalogue").attr("href",Str_a);
				$("#catalogue").text(Str_text);
		
	});



        </script>
  
</html>

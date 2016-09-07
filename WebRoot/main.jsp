<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>药品集中采购系统</title>
        <meta charset="UTF-8">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    </head>
    
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="index.jsp">药品集中采购系统</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> 嘉大卫生室 <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                      <li>
                                        <a tabindex="-1" target="iframe1" href="modify_passwd.html" class="inner_navigation">修改密码</a>
                                    </li>

                                    <li>
                                        <a tabindex="-1" href="login.html">注销</a>
                                    </li>
                                    

                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li id="index_jsp"  class=" active navigation ">
                                <a href="index.jsp" class="navigation_event">主页</a>
                        
                            </li>
                            <li class=" dropdown navigation">
                                <a href="#" data-toggle="dropdown" class=" dropdown-toggle">设置 <b class="caret"></b>

                                </a>
                                <ul class="dropdown-menu" id="menu1">
                                    
                                    <li>
                                        <a href="root_seo.html" class="navigation_event" target="iframe1">SEO Settings</a>
                                    </li>
                             
                                    <li class="divider"></li>
                                 
                                 <li>
                                        <a href="root_journal.html" class="navigation_event" target="iframe1"> <i class="icon-align-left"></i>日志

                                        </a>
                                   
                                    </li>
 
                                 <li>
                                        <a href=" root_suggest.html" class="navigation_event" target="iframe1"> <i class="icon-align-left"></i>建议列表

                                        </a>
                                   
                                    </li>

                                </ul>
                            </li>
                            <li class="dropdown navigation">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">目录 <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="information.html" class="navigation_event" target="iframe1">信息</a>
                                    </li>  
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="help.html" class="navigation_event" target="iframe1">操作手册</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown navigation">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">用户 <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="user_list.html" class="navigation_event" target="iframe1">用户列表</a>
                                    </li>
        
                                    <li>
                                        <a tabindex="-1" href="user_power.html" class="navigation_event" target="iframe1">权限</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="navigation">
                        
                                <a href="root_propose.html" class="navigation_event" target="iframe1">意见反馈</a>
                            	
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
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="medicine_search.jsp" target="iframe1">药品目录查询</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a  class="inner_navigation" href="medicine_maintain.jsp" target="iframe1">药品目录维护</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="medicine_control.html" target="iframe1">供货目录控制</a></div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                                 采购单管理
                              </a>
                            </div>
                            <div id="collapseTwo" class="accordion-body collapse">
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="purchase_new.html" target="iframe1">采购单创建</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="purchase_search.html" target="iframe1">采购单查询</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="purchase_maintain.html" target="iframe1">采购单维护</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="purchase_ratify.html" target="iframe1">采购单审批</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="purchase_put.html" target="iframe1">采购入库</a></div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                                 退货单管理
                              </a>
                            </div>
                            <div id="collapseThree" class="accordion-body collapse">
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="back_new.html" target="iframe1">退货单创建</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="back_search.html" target="iframe1">退货单查询</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="back_maintain.html" target="iframe1">退货单维护</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="back_ratify.html" target="iframe1">退货单审批</a></div>
                            </div>
                          </div>
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
                                 统计分析
                              </a>
                            </div>
                            <div id="collapseFour" class="accordion-body collapse">
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="statistics_medicine.html" target="iframe1">按药品统计</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="statistics_hospital.html" target="iframe1">按医院统计</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="statistics_supplier.html" target="iframe1">按供应商统计</a></div>
                              <div class="accordion-inner"><i class="icon-star"></i> <a class="inner_navigation" href="statistics_business.html" target="iframe1">交易明细查询</a></div>
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
	                                    <a href="index_public.html" target="iframe1" id="catalogue" >公告</a> 
	                                </li>
	                            </ul>
                            </div>
                        </div>
                    </div>
                     <iframe  name="iframe1" id="frame1" style="zoom: 0.8;" height="840" src="index_public.html" frameBorder="0" width="100%"></iframe> 
                </div>
            </div>
            <hr>
            <footer>
                <p align="center" >&copy; 测试版 design by 2016</p>
            </footer>
        </div>



        <!--/.fluid-container-->
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
        <script>
        $(function() {
  
            // Easy pie charts
            $("#frame1").attr("src","index_public.html");
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
    </body>

</html>
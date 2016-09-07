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
      <style type="text/css">
          #ri{
            text-align:right;
        }
        #bu{
            text-align:center;
        }
        </style>
  </head>
     <script src="<c:url value='/bootstrap/vendors/modernizr-2.6.2-respond-1.1.0.min.js'/>"></script>
  <body>
    <table class="table table-unbordered"> 
            <tr>
                <td>
                    <label>采购单编号 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >采购单名称 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >建单时间 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >提交时间 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
            </tr>
            <tr>
                <td>
                    <label >联系人 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >联系电话 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >商品名称 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >备注 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
            </tr>
            <tr>
                <td>
                    <label >审核时间 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >审核意见 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td> 
                    <br/>
                    <button class="btn btn-primary">查询</button>  
                </td>                 
                <td>
                </td>
            </tr>           
        </table>
      <div class="navbar navbar-inner ">
            <div class="muted pull-left" >采购单列表</div>
     </div>
     <div class="block-content collapse in">
        <div>
           <a href="#"><i class="icon-plus"></i>批量入库</a>
        </div>
        <br>
        <div >    
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                <thead>
                    <tr>
                        <th><input type="checkbox" /></th>
                        <th>采购单编号</th>
                        <th>采购单名称</th>
                        <th>建单时间</th>
                        <th>提交时间</th>
                        <th>采购单状态</th>
                        <th>备注</th>
                        <th>审核时间</th>
                        <th>审核意见</th>
                        <th>联系人</th>
                        <th>联系电话</th>
                        <th>审核入库</th>
                    </tr>
                </thead>
                  <tbody>
                    <tr class="odd gradeX">
                        <td><input type="checkbox" /></td>
                        <td>Trident</td>
                        <td>Internet
                             Explorer 4.0</td>
                        <td>Win 95+</td>
                        <td class="center"> 4</td>
                        <td class="center">X</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="#">入库</a> </td>
                    </tr>
                    <tr class="even gradeC">
                        <td><input type="checkbox" /></td>
                        <td>Trident</td>
                        <td>Internet
                             Explorer 5.0</td>
                        <td>Win 95+</td>
                        <td class="center">5</td>
                        <td class="center">C</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="#">入库</a></td>
                    </tr>
                    <tr class="odd gradeA">
                       <td><input type="checkbox" /></td>
                        <td>Trident</td>
                        <td>Internet
                             Explorer 5.5</td>
                        <td>Win 95+</td>
                        <td class="center">5.5</td>
                        <td class="center">A</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="#">入库</a></td>
                    </tr>
                    <tr class="even gradeA">
                       <td><input type="checkbox" /></td> 
                        <td>Trident</td>
                        <td>Internet
                             Explorer 6</td>
                        <td>Win 98+</td>
                        <td class="center">6</td>
                        <td class="center">A</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="#">入库</a></td>
                    </tr>
                    <tr class="odd gradeA">
                      <td><input type="checkbox" /></td>
                        <td>Trident</td>
                        <td>Internet Explorer 7</td>
                        <td>Win XP SP2+</td>
                        <td class="center">7</td>
                        <td class="center">A</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="#">入库</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="pagination pagination-right">
            <ul>
                <li><a href="#">首页</a></li>
                <li><a href="#">上一页</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">下一页</a></li>
                <li><a href="#">尾页</a></li>
            </ul>
        </div>
    </div>
       
  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/assets/scripts.js'/>"></script>
 
</html>

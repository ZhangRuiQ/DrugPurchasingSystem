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
                    <label>通用名 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >剂型 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >规格 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >转换系数 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
            </tr>
            <tr>
                <td>
                    <label >流水号 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >生产企业 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >商品名称 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
                <td>
                    <label >价格范围 :</label>
                    <input name="year" type="text" id="yearInput" >
                </td>
            </tr>
            <tr>
                <td>
                    <label >药品类别 :</label>
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown" href="#">
                        全部
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">固体</a></li>
                            <li><a href="#">液体</a></li>
                        </ul>
                    </div>
                </td>
                <td>
                    <label >交易状态 :</label>
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown" href="#">
                        全部
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">固体</a></li>
                            <li><a href="#">液体</a></li>
                        </ul>
                    </div>
                </td>
                <td>
                    <label >质量层次 :</label>
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown" href="#">
                        全部
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">固体</a></li>
                            <li><a href="#">液体</a></li>
                        </ul>
                    </div>
                </td>
                <td>
                   <br/>
                    <button class="btn btn-primary">查询</button>
                </td>
            </tr>
        </table>
      <div class="navbar navbar-inner ">
            <div class="muted pull-left" >药品目录列表</div>
     </div>
     <div class="block-content collapse in">
        <div >    
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                <thead>
                    <tr>
                        <th><input type="checkbox" /></th>
                        <th>流水号</th>
                        <th>通用名</th>
                        <th>规格</th>
                        <th>生产企业</th>
                        <th>转换系数</th>
                        <th>剂型</th>
                        <th>商品名称</th>
                        <th>药品类别</th>
                        <th>交易状态</th>
                        <th>质量层次</th>
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
                    </tr>
                    <tr class="even gradeA">
                      <td><input type="checkbox" /></td>
                        <td>Trident</td>
                        <td>AOL browser (AOL desktop)</td>
                        <td>Win XP</td>
                        <td class="center">6</td>
                        <td class="center">A</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="gradeA">
                      <td><input type="checkbox" /></td>
                        <td>Gecko</td>
                        <td>Firefox 1.0</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.7</td>
                        <td class="center">A</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
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

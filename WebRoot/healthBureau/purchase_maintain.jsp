<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>    
    <head>
        <title>药品集中采购系统</title>
        <!-- Bootstrap -->
     	<link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap-responsive.min.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css'/>" rel="stylesheet" media="screen">
        <!-- <link href="assets/styles.css" rel="stylesheet" media="screen"> -->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <style type="text/css">
          #ri{
            text-align:right;
        }
        #bu{
            text-align:center;
        }
        </style>
    </head>
    
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
                </td>                 
                <td>
                </td>
            </tr>           
        </table>
        <center>
          <button class="btn btn-primary">修改</button>     
          <button class="btn btn-primary">删除</button>
        </center>
        <br/>
      <div class="navbar navbar-inner ">
            <div class="muted pull-left" >采购单列表</div>
     </div>
     <div class="block-content collapse in">
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
                        <th>修改</th>
                        <th>删除</th>
                        <th>详细</th>
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
                        <td><a href="#">修改</a></td>
                        <td><a href="#">删除</a></td>
                        <td><a href="">查看</a></td>
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
                        <td><a href="#">修改</a></td>
                        <td><a href="#">删除</a></td>
                        <td><a href="">查看</a></td>
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
                        <td><a href="#">修改</a></td>
                        <td><a href="#">删除</a></td>
                        <td><a href="">查看</a></td>
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
                        <td><a href="#">修改</a></td>
                        <td><a href="#">删除</a></td>
                        <td><a href="">查看</a></td>
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
                        <td><a href="#">修改</a></td>
                        <td><a href="#">删除</a></td>
                        <td><a href="">查看</a></td>
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
                        <td><a href="#">修改</a></td>
                        <td><a href="#">删除</a></td>
                        <td><a href="">查看</a></td>
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
                        <td><a href="#">修改</a></td>
                        <td><a href="#">删除</a></td>
                        <td><a href="">查看</a></td>
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
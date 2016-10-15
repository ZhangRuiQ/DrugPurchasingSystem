<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%-- <base href="<%=basePath%>"> --%>
    <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">
    <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap-responsive.min.css'/>" rel="stylesheet" media="screen">
    <link href="<c:url value='/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css'/>" rel="stylesheet" media="screen">
    
    <title>orderItems</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	 <button class="btn btn-info" id="order_Id" >采购单编号：${order.id }</button><br/>
   	 <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" >
        <thead>
            <tr>
                <th>订单项编号</th>
                <th>药品流水号</th>
                <th>购入总价</th>
                <th>购入量</th>
                <!-- <th><i class="icon-pencil"></i></th>
                <th><i class="icon-remove"></i></th> -->
            </tr>
        </thead>
        <tbody id="orderItems_tbody" >
        	  <s:iterator value="#session.orderItems.list" >
             	<tr>
  					 <td><s:property value="id" /></td>
                	 <td><s:property value="medicine.number" /></td>
                	 <td><s:property value="amount" /></td>
                	 <td><s:property value="number" /></td>
             </tr>
        	 </s:iterator>   
        </tbody>
     </table>
     
	
	<div class="pagination pagination-right pagination-small">
        <ul>
			<!-- 上一页 --> 
            <li>
				<c:choose>
					<c:when test="${orderItems.currentPage == 1 }"><a href="javascipt:void(0)" class="previous disabled">上一页</a></c:when>
					<c:otherwise><a href="<c:url value='/healthBureau/searchOrderItems.action?orderItemDto.order.id=${order.id }&page=${orderItems.currentPage - 1 }' />" >上一页</a></c:otherwise>
				</c:choose>
			</li>
			<!-- 中间页 -->
			<%-- 我们需要计算页码列表的开始和结束位置，即两个变量begin和end
				计算它们需要通过当前页码！
				1. 总页数不足6页--> begin=1, end=最大页
				2. 通过公式设置begin和end，begin=当前页-1，end=当前页+3
				3. 如果begin<1，那么让begin=1，end=6
				4. 如果end>totalPage, 让begin=totalPage-5, end=totalPage
				计算begin和end
			    如果总页数<=6，那么显示所有页码，即begin=1 end=${orderItems.tp}
			    设置begin=当前页码-2，end=当前页码+3
			    如果begin<1，那么让begin=1 end=6
			    如果end>最大页，那么begin=最大页-5 end=最大页 --%>
			 <c:choose>
			 	<c:when test="${orderItems.totalPage <= 5 }">
			 		<c:set var="begin" value="1"/>
			 		<c:set var="end" value="${orderItems.totalPage }"/>
			 	</c:when>
			 	<c:otherwise>
			 		<c:set var="begin" value="${orderItems.currentPage - 2 }"/>
			 		<c:set var="end"   value="${orderItems.currentPage + 2 }"/>
			 		<c:if test="${begin < 1 }">
			 		  <c:set var="begin" value="1"/>
			 		  <c:set var="end" value="5"/>
			 		</c:if>
			 		<c:if test="${end > orderItems.totalPage }">
			 		  <c:set var="begin" value="${orderItems.totalPage - 4 }"/>
			 		  <c:set var="end" value="${orderItems.totalPage }"/>
			 		</c:if> 		
			 	</c:otherwise>
			 </c:choose>
			 
			 <c:forEach begin="${begin }" end="${end }" var="i">
			   <c:choose>
			   	  <c:when test="${i == orderItems.currentPage }">
			   	    <li><a href="javascript:void(0)" class="btn disabled">${i }</a></li>
			   	  </c:when>
			   	  <c:otherwise>
			   	    <li><a href="<c:url value='/healthBureau/searchOrderItems.action?orderItemDto.order.id=${order.id }&page=${i }' /> ">${i }</a></li>
			   	  </c:otherwise>
			   </c:choose>
			 </c:forEach>
			    
			
            <!-- 下一页 -->
            <li>
          	  <c:choose>
				<c:when test="${orderItems.currentPage == orderItems.totalPage }"><a href="javascipt:void(0)" class="previous disabled">下一页</a></c:when>
				<c:otherwise><a href="<c:url value='/healthBureau/searchOrderItems.action?orderItemDto.order.id=${order.id }&page=${orderItems.currentPage + 1 }' />">下一页</a></c:otherwise>
			  </c:choose>
            	
            </li>
        </ul>
    </div>
  </body>
</html>

<script type="text/javascript">


</script>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>    
    <head>
        <title>药品集中采购系统</title>
        <!-- Bootstrap -->
        <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap-responsive.min.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/datepicker/css/datepicker.css'/>" rel="stylesheet">
        <!-- <link href="assets/styles.css" rel="stylesheet" media="screen"> -->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="<c:url value='vendors/modernizr-2.6.2-respond-1.1.0.min.js' />"></script>
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
      <form action="<c:url value='/healthBureau/back_search.action' />" method="post" id="myForm">
       <table class="table table-unbordered"> 
            <tr>
                <td>
                 <div class="" id="div_id">
                    <label class="control-label" for="id">采购单编号 :</label>
                    <input  type="text" name="orderDto.id" id="id" value="" onblur="input_check(0)" >
                 </div>
                </td>
                <td>
                 <div class="" id="div_hospitalId">
                    <label class="control-label" for="hospitalId">医院编号 :</label>
                    <input  type="text" name="orderDto.hospitalId" id="hospitalId" value="" onblur="input_check(1)">
                 </div>   
                </td>
                <td>
                 <div class="" id="div_dp1">
                    <label class="control-label" for="dp1">建单时间 :</label>
                    <input  type="text" name="orderDto.order_Time"  value="2011-02-24" id="dp1" onblur="input_check(2)">
                 </div>
                </td>
                <td>
                 <div class="" id="div_amount">
                    <label class="control-label" for="amount">总价 :</label>
                    <input  type="text" name="orderDto.amount" id="amount" value="" onblur="input_check(3)">
                </div>
                </td>
            </tr>
            <tr>
                <td>
                 <div class="" id="div_status">
                    <label class="control-label" for="status">采购状态 :</label>
                    <input  type="text" name="orderDto.status" id="status" value="" onblur="input_check(4)">
                 </div>
                </td>
                <td>
                 <div class="" id="div_dp2">
                    <label class="control-label" for="dp2">退货时间 :</label>
                    <input  type="text" name="orderDto.return_Time" value="" id="dp2" onblur="input_check(5)">
                 </div>
                </td>
                <td>
                 <div class="" id="div_return_Reason">
                    <label class="control-label" for="return_Reason">退货原因 :</label>
                    <input  type="text" name="orderDto.return_Reason" id="return_Reason" value="" onblur="input_check(6)">
                 </div>
                <td>
                    <label >备注 :</label>
                    <input  type="text" name="" value="" >
                </td>
            </tr>
            <tr>
                <td>
                    <label >审核时间 :</label>
                    <input  type="text" value="" id="dp3" >
                </td>
                <td>
                    <label >审核意见 :</label>
                    <input  type="text"  value="" >
                </td>
                <td> 
                    <br/>
                    <button class="btn btn-primary" type="submit">查询</button>     
                </td>                 
                <td>
                </td>
            </tr>           
        </table>
       </form>
      <div class="navbar navbar-inner ">
            <div class="muted pull-left" >采购单列表</div>
     </div>
     
     <div class="block-content collapse in">
        <div >    
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                <thead>
                    <tr>
                        <th id="all" ><input type="checkbox" /></th>
                        <th>采购单编号</th>
                        <th>医院编号</th>
                        <th>建单时间</th>
                        <th>总价</th>
                        <th>采购单状态</th>
                        <th>退货时间</th>
                        <th>退货原因</th>
                        <th>备注</th>
                        <th>审核时间</th>
                        <th>审核意见</th>
                    </tr>
                </thead>
                 <tbody id="tbody" >
                    <s:iterator value="pageBean.list" >
						<tr class="gradeA">
							<td><input type="checkbox" /></td>
						 	<td><s:property value="id" /></td>
                        	<td><s:property value="hospital.id" /></td>
                        	<%-- <td><s:property value="orderTime" /></td> --%>
                        	<td><fmt:formatDate type="both" value="${orderTime }" /></td>
                       	    <td><s:property value="amount" /></td>
                        	<td><s:property value="status" /></td>
                       	 	<%-- <td><s:property value="returnTime" /></td> --%>
                       	 	<td><fmt:formatDate type="both" value="${returnTime }" /></td>
                       	    <td><s:property value="returnReason" /></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
					   </tr>
					</s:iterator>
                 </tbody>
            </table>
        </div>
        
    <!-- 分页导航条  -->
    <div class="pagination pagination-right">
        <ul>
       	 	<!-- 首页 -->
            <li>
            	<a href="<c:url value='/healthBureau/back_search.action?page=1' />">首页</a>
			</li>
			<!-- 上一页 --> 
            <li>
				<c:choose>
					<c:when test="${pageBean.currentPage == 1 }"><a href="javascipt:void(0)" class="previous disabled">上一页</a></c:when>
					<c:otherwise><a href="<c:url value='/healthBureau/back_search.action?page=${pageBean.currentPage - 1 }' />" >上一页</a></c:otherwise>
				</c:choose>
			</li>
			<!-- 中间页 -->
			<%--我们需要计算页码列表的开始和结束位置，即两个变量begin和end
				计算它们需要通过当前页码！
				1. 总页数不足6页--> begin=1, end=最大页
				2. 通过公式设置begin和end，begin=当前页-1，end=当前页+3
				3. 如果begin<1，那么让begin=1，end=6
				4. 如果end>totalPage, 让begin=totalPage-5, end=totalPage --%>
				<%-- 计算begin和end --%>
			    <%-- 如果总页数<=6，那么显示所有页码，即begin=1 end=${pageBean.tp} --%>
			    <%-- 设置begin=当前页码-2，end=当前页码+3 --%>
			    <%-- 如果begin<1，那么让begin=1 end=6 --%>
			    <%-- 如果end>最大页，那么begin=最大页-5 end=最大页 --%>
			 <c:choose>
			 	<c:when test="${pageBean.totalPage <= 5 }">
			 		<c:set var="begin" value="1"/>
			 		<c:set var="end" value="${pageBean.totalPage }"/>
			 	</c:when>
			 	<c:otherwise>
			 		<c:set var="begin" value="${pageBean.currentPage - 2 }"/>
			 		<c:set var="end"   value="${pageBean.currentPage + 2 }"/>
			 		<c:if test="${begin < 1 }">
			 		  <c:set var="begin" value="1"/>
			 		  <c:set var="end" value="5"/>
			 		</c:if>
			 		<c:if test="${end > pageBean.totalPage }">
			 		  <c:set var="begin" value="${pageBean.totalPage - 4 }"/>
			 		  <c:set var="end" value="${pageBean.totalPage }"/>
			 		</c:if> 		
			 	</c:otherwise>
			 </c:choose>
			 
			 <c:forEach begin="${begin }" end="${end }" var="i">
			   <c:choose>
			   	  <c:when test="${i == pageBean.currentPage }">
			   	    <li><a href="javascript:void(0)" class="btn disabled">${i }</a></li>
			   	  </c:when>
			   	  <c:otherwise>
			   	    <li><a href="<c:url value='/healthBureau/back_search.action?page=${i }' /> ">${i }</a></li>
			   	  </c:otherwise>
			   </c:choose>
			 </c:forEach>
			    
			
            <!-- 下一页 -->
            <li>
          	  <c:choose>
				<c:when test="${pageBean.currentPage == pageBean.totalPage }"><a href="javascipt:void(0)" class="previous disabled">下一页</a></c:when>
				<c:otherwise><a href="<c:url value='/healthBureau/back_search.action?page=${pageBean.currentPage + 1 }' />">下一页</a></c:otherwise>
			  </c:choose>
            	
            </li>
            <!-- 尾页 -->
            <li>
            	<a href="<c:url value='/healthBureau/back_search.action?page=${pageBean.totalPage }' /> ">尾页</a>
            </li>
        </ul>
     </div>
    </div>
       
    </body>
     <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
     <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
     <script src="<c:url value='/bootstrap/assets/scripts.js'/>"></script>
     <script src="<c:url value='/bootstrap/datepicker/js/bootstrap-datepicker.js'/>"></script>

</html>

<script type="text/javascript">


	
	//显示退货单的状态码(转换状态硬编码)
	window.onload = function code_convert(){
		var tbody = document.getElementById("tbody");	//获取父元素
		
		var tds = tbody.getElementsByTagName("td");		//td的元素集合
		
		for(var i = 5; i < tds.length; i+=11){
			
			/* alert(tds[i].innerHTML ); */
			
			var status = tds[i].innerHTML;
			
			switch ( status )
			{
			case "00":
				tds[i].innerHTML = "订单已保存";
			  break;
			case "10":
				tds[i].innerHTML = "已提交(未审批)";
			  break;
			case "20":
				tds[i].innerHTML = "已审核(未付)";
			  break;
			case "30":
				tds[i].innerHTML = "发货中";
			  break;
			case "40":
				tds[i].innerHTML = "已入库(未付)";
			  break;
			case "50":
				tds[i].innerHTML = "审核不通过";
			  break;
			case "60":
				tds[i].innerHTML = "订单退货";	
			  break;
			case "70":
				tds[i].innerHTML = "退货审核成功";	
			  break;
			case "80":
				tds[i].innerHTML = "退货中(已退款)";
			  break;
			case "90":
				tds[i].innerHTML = "退货成功(已退款)";
			  break;
			case "21":
				tds[i].innerHTML = "已审批(已付)";
			  break;
			case "31":
				tds[i].innerHTML = "发货中(已付)";
			  break;
			case "41":
				tds[i].innerHTML = "已入库(已付)";
			  break;
			case "81":
				tds[i].innerHTML = "退货中(未退款)";
			  break;
			case "91":
				tds[i].innerHTML = "退货成功(未退款)";
		 	 break;
			}
		}
		
		//全选、全不选和反选
		var all = document.getElementById("all");		//获取可以进行全选的那个CheckBox

		var CheckBoxs = tbody.getElementsByTagName("input");		//将要被勾选的元素集合

		all.onclick = function(){
		
			for(i=0;i<CheckBoxs.length;i++){
			
				if( CheckBoxs[i].checked ){			//如果原来已经选上的，就会去掉；原来没有选上的，就会被选上。
				
					CheckBoxs[i].checked = false;
				
				}else{
				
					CheckBoxs[i].checked = true;
					
				}
	  		 }
		 };	
		
	}
	
	
	//搜索框的输入验证js事件
	function input_check(i){
		
		var form = document.getElementById("myForm");
		
		var values = form.getElementsByTagName("input");
		
		var divs = form.getElementsByTagName("div");
		
		var is_num = /^\d+(\.\d+)?$/; 
		
		if( 6 == i ){
			if( "" == values[6].value ){
				$("#"+divs[6].id).attr("class","control-group warning");
			}else if(  is_num.test( values[6].value ) ){
				$("#"+divs[6].id).attr("class","control-group success");
			}else {
				$("#"+divs[6].id).attr("class","control-group error");
				$('.tooltip-top').tooltip('show');	
			} 
		}else {
			if( "" == values[i].value ){
				$("#"+divs[i].id).attr("class","control-group warning");
			}else {
				$("#"+divs[i].id).attr("class","control-group success");
			} 
		}
		
	}
	
	
	//日历插件
	$(function(){
		window.prettyPrint && prettyPrint();
		$('#dp1').datepicker({
			format: 'yyyy-mm-dd'
		});
		$('#dp2').datepicker({
			format: 'yyyy-mm-dd'
		});
		$('#dp3').datepicker({
			format: 'yyyy-mm-dd'
		});
		
		var startDate = new Date(2012,1,20);
		var endDate = new Date(2012,1,25);

        // disabling dates
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var checkin = $('#dpd1').datepicker({
          onRender: function(date) {
            return date.valueOf() < now.valueOf() ? 'disabled' : '';
          }
        }).on('changeDate', function(ev) {
          if (ev.date.valueOf() > checkout.date.valueOf()) {
            var newDate = new Date(ev.date)
            newDate.setDate(newDate.getDate() + 1);
            checkout.setValue(newDate);
          }
          checkin.hide();
          $('#dpd2')[0].focus();
        }).data('datepicker');
        var checkout = $('#dpd2').datepicker({
          onRender: function(date) {
            return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
          }
        }).on('changeDate', function(ev) {
          checkout.hide();
        }).data('datepicker');
		});
	

</script>
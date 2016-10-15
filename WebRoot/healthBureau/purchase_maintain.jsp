<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
     <form action="<c:url value='/healthBureau/updateOrder.action' />"  method="post" id="myForm" >
        <table class="table table-unbordered" id="table">  
            <tr>
                <td>
                 <div class="" id="div_id">
                    <label class="control-label" for="id">采购单编号 :</label>
                    <input  type="text" name="orderDto.id" id="id" value="" onblur="input_check(0)" placeholder="ps：无需手动输入" readonly="readonly" >
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
                </td>
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
                    <input  type="text" id="" value="" >
                </td>
                <td><br/>
               	  <a href="#update" role="button" class="btn btn-primary" data-toggle="modal">修改</a>
		          <div id="update" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  			<div class="modal-header">
		   			 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		   			 <h3 id="myModalLabel"></h3>
		  			</div>
		 			 <div class="modal-body">
		   				 <p class="text-error">是否修改该药品吗？</p>
		 			 </div>
		  			<div class="modal-footer">
		   			 <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		   			 <button class="btn btn-primary" onclick="document.getElementById('myForm').submit();" data-dismiss="modal">确认</button>
				  </div>
				 </div>
                </td>                 
                <td></td>
            </tr>           
        </table>
       </form>
        <!--<center>
           <button class="btn btn-primary">删除</button>     
          <button class="btn btn-primary">修改</button> -->
          <%-- <a href="#delete" role="button" class="btn btn-primary" data-toggle="modal">删除</a>
          <div id="delete" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-header">
   			 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   			 <h3 id="myModalLabel"></h3>
  			</div>
 			 <div class="modal-body">
   				 <p class="text-error">是否要删除该药品吗？</p>
 			 </div>
  			<div class="modal-footer">
   			 <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
   			 <button class="btn btn-primary" data-dismiss="modal" onclick="" >确认</button>
		   </div>
		  </div>    
        </center>
        <br/> --%>
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
                        <th>修改</th>
                        <th>删除</th>
                        <th>详情</th>
                    </tr>
                </thead>
                <tbody id="tbody" >
                 <s:iterator value="pageBean.list" id="pageBean_id" >
                    <tr class="gradeA">
                      	<td><input type="checkbox" /></td>
					  	<td><s:property value="id" /></td>
                        <td><s:property value="hospital.id" /></td>
                      	<td><fmt:formatDate type="both" value="${orderTime }" /></td>
                     	<td><s:property value="amount" /></td>
                     	<td><s:property value="status" /></td>
                      	<td><fmt:formatDate type="both" value="${returnTime }" /></td>
                    	<td><s:property value="returnReason" /></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a id="${id }" onclick="maintain(this.id)" href="#">修改</a></td>
                       	<td>
                       		<a href="#delete_single${id }"  data-toggle="modal">删除 </a>
                       		<div id="delete_single${id }" class="modal hide fade" >
					  			 <div class="modal-header">
					   			  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					   			  <h3 id="myModalLabel"></h3>
					  			 </div>
					 			  <div class="modal-body">
					   				 <p class="text-error">将要彻底删除此采购单，请确认要删除该采购单吗？</p>
					 			  </div>
					  			 <div class="modal-footer">
					   			  <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					   			  <button id="${id }" onclick="deleteOrder(this.id)" class="btn btn-primary" data-dismiss="modal" >确认</button>
							    </div>
							   </div>
                       	</td>
                        <td>
	                        <a href="" id="view${id }" onclick="searchOrderItems(this.id, 1)" data-toggle="modal" data-target="#orderitem_Model" >查看</a>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
   		</div>
    

    <!-- 模拟状态框  -->
	<div id="orderitem_Model" id="full-width" class="modal container hide fade" tabindex="-1">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	    <h3>采购单<a onclick="javascript:void(0)" ></a>详情：</h3>
	  </div>
	  <div class="modal-body" >
	  	<iframe  id="body_iframe" style="zoom: 0.8;" height="400" src="<c:url value='/healthBureau/searchOrderItems.action' />" frameBorder="0" width="100%"></iframe>
	  </div>  
	  <div class="modal-footer">
	    <button class="btn" data-dismiss="modal" aria-hidden="true">返回</button>
  			<button onclick="" class="btn btn-primary" data-dismiss="modal" >确认</button>
	  </div>
	</div>
    
    <!-- 分页导航条  -->
    <div class="pagination pagination-right">
        <ul>
       	 	<!-- 首页 -->
            <li>
            	<a href="<c:url value='/healthBureau/purchase_maintain.action?page=1' />">首页</a>
			</li>
			<!-- 上一页 --> 
            <li>
				<c:choose>
					<c:when test="${pageBean.currentPage == 1 }"><a href="javascipt:void(0)" class="previous disabled">上一页</a></c:when>
					<c:otherwise><a href="<c:url value='/healthBureau/purchase_maintain.action?page=${pageBean.currentPage - 1 }' />" >上一页</a></c:otherwise>
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
			   	    <li><a href="<c:url value='/healthBureau/purchase_maintain.action?page=${i }' /> ">${i }</a></li>
			   	  </c:otherwise>
			   </c:choose>
			 </c:forEach>
			    
			
            <!-- 下一页 -->
            <li>
          	  <c:choose>
				<c:when test="${pageBean.currentPage == pageBean.totalPage }"><a href="javascipt:void(0)" class="previous disabled">下一页</a></c:when>
				<c:otherwise><a href="<c:url value='/healthBureau/purchase_maintain.action?page=${pageBean.currentPage + 1 }' />">下一页</a></c:otherwise>
			  </c:choose>
            	
            </li>
            <!-- 尾页 -->
            <li>
            	<a href="<c:url value='/healthBureau/purchase_maintain.action?page=${pageBean.totalPage }' /> ">尾页</a>
            </li>
        </ul>
    </div>
       
    </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
     <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
     <script src="<c:url value='/bootstrap/assets/scripts.js'/>"></script>
     <script src="<c:url value='/bootstrap/datepicker/js/bootstrap-datepicker.js'/>"></script>

</html>
<script type="text/javascript">


	
	//获取将要修改的采购单条目,进行修改
	function maintain(id){
		
		$.ajax({url:"<c:url value='/healthBureau/order_search_maintain.action' />",
			type:"POST",
			data: {"orderDto.id" : id},		
			async:true,
			cache:false,
			success:function(data){			
				var m = data.split(",", 7);				//m存储着将要修改的订单的信息
				$('input[name="orderDto.id"]').attr('value',m[0]);
				$('input[name="orderDto.hospitalId"]').attr('value',m[1]);
				$('input[name="orderDto.order_Time"]').attr('value',m[2]);
				$('input[name="orderDto.amount"]').attr('value',m[3]);
				$('input[name="orderDto.return_Time"]').attr('value',m[4]);
				$('input[name="orderDto.return_Reason"]').attr('value',m[5]);
				$('input[name="orderDto.status"]').attr('value',m[6]);
			}
		});	

	};
	
	//更新订单的确认点击事件
	 function checkInputValue(){
		
		 var table = document.getElementById("table");	//获取"table"的这个元素
		 
		 var inputs = table.getElementsByTagName("input");	//获取table的下的所有input元素
		 
		 for (var i=0; i<inputs.length; i++){
			if(  inputs[i].value != "" ){
				document.getElementById("myForm").submit();  
				break;
			 }else{
				 alert("内容能为空！无法修改！");
				 break;
			 } 
		 }
		 
		 location.replace("purchase_maintain.action");
		 
	};
	
	
	//删除单个订单
	function deleteOrder(id){
		
		$.ajax({url:"<c:url value='/healthBureau/deleteOrderById.action' />",
			type:"POST",
			data: {"orderDto.id" : id},		
			async:true,
			cache:false,
			success:function(data){
				alert("删除成功！"); 
				location.replace("purchase_maintain.action");  			//replace() 方法可用一个新文档取代当前文档。
			}
		});	

	};
	
	
	//查询采购单的订单项
	function searchOrderItems(order_Id, page){
		
		var order_Id = order_Id.substring(4);
		
		$("#body_iframe").attr("src","<c:url value='/healthBureau/searchOrderItems.action?orderItemDto.order.id=' />"+order_Id+"&page="+page);
		
		$.ajax({url:"<c:url value='/healthBureau/searchOrderItems.action' />",
			type:"POST",
			data: {"orderItemDto.order.id" : order_Id,
				"page" : page},		
			async:true,
			cache:false,
			success:function(data){
				/* $("#orderitem_Model").modal('show'); */
				 /* $("#orderItems_tbody").html("<s:iterator value="#session.orderItems.list" id="or">" + 
				"<tr><td><s:property value="id" /></td><td><s:property value="medicine.number" /></td>" +
				"<td><s:property value="amount" /></td><td><s:property value="number" /></td>" +
				 "<td><a herf=\"#\" class=\"icon-pencil\"></a></td><td><i class=\"icon-remove\"></i></td>" + 
				"</tr></s:iterator>");  */
			}
		});	

	};
	
	
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
	
	//显示退货单的状态码(转换状态硬编码)
	window.onload = function code_convert(){
		var tbody = document.getElementById("tbody");	//获取父元素
		
		var tds = tbody.getElementsByTagName("td");		//td的元素集合
		
		for(var i = 5; i < tds.length; i+=14){
			
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

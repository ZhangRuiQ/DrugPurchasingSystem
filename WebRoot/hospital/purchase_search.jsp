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
           <link rel="stylesheet/less" type="text/less" href="<c:url value='bootstrap/datepicker/less/datepicker.less'/>">
        <link href="<c:url value='bootstrap/datepicker/css/datepicker.css'/>" rel="stylesheet" media="screen">
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
  <form id="myForm" >
     <table class="table table-unbordered"> 
       <tr>
                <td>
                    <label for="orderDto_id_Input">采购单编号 :</label>
                    <input   type="text"  id="orderDto_id_Input" name="orderSearchCondition.id" >
                    
                </td>
                <td>
                    <label for="orderDto_begin_order_time_input">建单起始时间 :</label>
                    <input  type="text" id="orderDto_begin_order_time_input"name="orderSearchCondition.beginorder_Time" >
                </td>
       			<td>
                    <label for="orderDto_end_order_time_input">建单结束时间 :</label>
                    <input  type="text" id="orderDto_end_order_time_input" name="orderSearchCondition.endorder_Time" >
                </td>
                
            </tr>    
            <tr>
            	 <td>
                    <label>订单状态 :</label>
                    <div class="btn-group">
                    <input id="conditionStatus" name="orderSearchCondition.status" type="hidden" value="-1">
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown">
                        		<font id="conditionStatusText">全部</font>
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                         <li><a href="javascript:void(0)" class="conditionStatusSelect">全部</a><font hidden>-1</font></li>
                          <li><a href="javascript:void(0)" class="conditionStatusSelect">未提交</a><font hidden>0</font></li>
                           <li><a href="javascript:void(0)" class="conditionStatusSelect">未审批</a><font hidden>10</font></li>
                            <li><a href="javascript:void(0)" class="conditionStatusSelect">审批不通过</a><font hidden>50</font></li>
                            
                             <li><a href="javascript:void(0)" class="conditionStatusSelect">未发货</a><font hidden>2</font></li>
                              <li><a href="javascript:void(0)" class="conditionStatusSelect">发货中</a><font hidden>3</font></li>
                               <li><a href="javascript:void(0)" class="conditionStatusSelect">订单完成</a><font hidden>4</font></li>
                               
                                <li><a href="javascript:void(0)" class="conditionStatusSelect">申请退货</a><font hidden>60</font></li>
                                 <li><a href="javascript:void(0)" class="conditionStatusSelect">退货审批成功</a><font hidden>70</font></li>
                                 
                                  <li><a href="javascript:void(0)" class="conditionStatusSelect">退货中(未退款)</a><font hidden>81</font></li>
                                   <li><a href="javascript:void(0)" class="conditionStatusSelect">退货成功(未退款)</a><font hidden>91</font></li>
                                    <li><a href="javascript:void(0)" class="conditionStatusSelect">退货中(已退款)</a><font hidden>80</font></li>
                                   <li><a href="javascript:void(0)" class="conditionStatusSelect">退货成功(已退款)</a><font hidden>90</font></li>
                                   
                          
                        </ul>
                    </div>
                </td>
             <td>
                    <label>金额状态：</label>
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown">
                        		<font id="conditionStatusMoneyText">全部</font>
                        		
                        <span class="caret"></span>
                        </a>
                        <ul id="conditionStatusMoneySelectList" class="dropdown-menu">
                        	<li><a  href="javascript:void(0)" class="conditionStatusMoneySelect">全部</a></li>
                     
                          
                        </ul>
                    </div>
                </td>
            <td>
                    <label></label>
                    <div class="btn-group">
                    <input id="inputPriceSort" name="orderSearchCondition.pricesort" type="hidden" value="asc" >
                        <a id="conditionPrice" class="btn dropdown-toggle btn-success" data-toggle="dropdown">
                       		<font id="conditionPriceTest">价格从低到高</font>
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a id="conditionPrice1" href="javascript:void(0)">价格从高到低</a></li>
                       <li><a id="conditionPrice2" href="javascript:void(0)">价格从低到高</a></li>
                       
                        </ul>
                    </div>
                </td>
            
            </tr>               
        </table>
        <input type="hidden" name="page" id="pageInput" value="0">
         <center>
          <button id="btn_ajax_purchase" type="button" class="btn btn-primary">查询</button>
		  <a id="btn_ajax_download_list" target="_blank" href="<c:url value='/hospital/download_downloadPurchase.action'/>" class="btn btn-primary">导出</a>           
        </center>
        </form>
        <br>
      <div class="navbar navbar-inner ">
            <div class="muted pull-left" ><p class="navbar-text">采购单列表</p></div>
     </div>
     
     
              
              
     <div id="blank_div_and_table_parent" class="block-content collapse in">
        <s:if test="orderDtoList.size()==0">
           
                  <div id='blank_div'  class='hero-unit'>  <h1>没有任何数据</h1>  <p>No thing</p></div> 
              </s:if>
        
          <s:elseif test="orderDtoList.size()!=0"> 
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                <thead>
                    <tr>
                 
                        <th>采购单编号</th>
                        <th>建单时间</th>
                         <th>总金额</th>
                        <th>采购单状态</th>
                        <th>退单时间</th> 
                        <th>查看</th>                 
                        <th>退货</th>
                    </tr>
                </thead>
                
             
                 <tbody id="list_tbody">
                 <s:iterator value="orderDtoList" var="o">
                    <tr class="odd gradeX">
						
						<td><s:property value="#o.id"/></td>
						<td><s:property value="#o.order_Time"/></td>
						<td><s:property value="#o.amount"/></td>
						<td class="orderStatus"><s:property value="#o.status"/>
						</td>
						<td><s:property value="#o.return_Time"/></td>
						
						<td><a class="Order_look_btn" onclick="Order_look_btn(this)" href="JavaScript:void(0)">查看</a><input type="hidden" value="<s:property value="#o.status"/>" ></td>
						<s:if test="#o.status=='31' || #o.status=='21'||#o.status=='30'||#o.status=='20'">
						<td><a class="Order_back_btn" onclick="Order_back_btn(this)" href="JavaScript:void(0)">退货</a></td>
						</s:if>
						<s:else>
							<td></td>
						</s:else>
					</tr>
					</s:iterator>
                </tbody>
                 
            </table>
            </s:elseif>
        </div>
         

	<div class="pagination pagination-right" >
    
        <ul id="list_page">
        
        </ul>
    </div>
   
   
       
       
  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/assets/scripts.js'/>"></script>
         <script src="<c:url value='/bootstrap/datepicker/js/bootstrap-datepicker.js'/>" ></script>
         <script src="<c:url value='/hospital/js/orderStatusfunction.js'/>"></script>
 		<script type="text/javascript">	
 		//条件选择栏中两个下拉菜单的选择项联动及其触发事件
 		
 		$(".conditionStatusSelect").click(function(){
 			//清除付款选择项的所有选择项
 			$("#conditionStatusMoneySelectList").empty();
 			$("#conditionStatusMoneyText").text("全部"); 
 		$("#conditionStatus").val($(this).next().text());
 		$("#conditionStatusText").text($(this).text());
 		$("#conditionStatusMoneySelectList").append($("<li><a  href='javascript:void(0)' class='conditionStatusMoneySelect'>全部</a></li>")); 
 		
 		if($("#conditionStatus").val()=="2"||$("#conditionStatus").val()=="3"||$("#conditionStatus").val()=="4"){
 			$("#conditionStatusMoneySelectList").append("<li><a href='javascript:void(0)' class='conditionStatusMoneySelect'>已付款</a></li><li><a href='javascript:void(0)'class='conditionStatusMoneySelect'>未付款</a></li>");
 		}
 
 			
 	});
 	
 	$("#conditionStatusMoneySelectList").on("click",".conditionStatusMoneySelect",function(){
		$("#conditionStatusMoneyText").text($(this).text()); 
		if($(this).text()=="已付款"){
			var str=$("#conditionStatus").val();
			str=str.substr(0,1);
			$("#conditionStatus").val(str+"1");
		}
		if($(this).text()=="未付款"){
			var str=$("#conditionStatus").val();
			str=str.substr(0,1);
			$("#conditionStatus").val(str+"0");
		}

		if($(this).text()=="全部"){
			if($("#conditionStatusText").text()=="未发货"||$("#conditionStatusText").text()=="发货中"||$("#conditionStatusText").text()=="订单完成")
			{
				var str=$("#conditionStatus").val();
			str=str.substr(0,1);
			$("#conditionStatus").val(str);
			
			}
			
		
		}
		
	});

	
	
	
	//价格排序按钮js
 	$("#conditionPrice2").click(function(){
 				$("#inputPriceSort").val("asc");
 				$("#conditionPriceTest").text("价格从低到高");
 	
 	});
 	$("#conditionPrice1").click(function(){
 				$("#inputPriceSort").val("desc");
 				$("#conditionPriceTest").text("价格从高到低");
 
 	});
//当页面加载时，默认为1（在JavaScript的最开始）
var page=1;
//分页   动态加载函数
function loadPage(pagecount){

	var begin;
	pageCount=pagecount
	var end;
	$("#list_page").append("<li id='firstPage'><a  href='javascript:void(0)' onclick='pageClick(this)'>首页</a></li>");
	$("#list_page").append(" <li><a    href='javascript:void(0)' onclick='pageClick(this)'>尾页</a></li>");
	if(pageCount>1&&page!=pageCount){
	$("#firstPage").after(" <li><a href='javascript:void(0)' onclick='pageClick(this)'>下一页</a></li>");

	}
	if(pageCount<=5){
		begin=1;
		end=pageCount;
	}
	else{
			begin=page-2;
			end=page+2;
	
		if(begin<=0){
			begin=1;
			end=5;
		}
		else if(end>pageCount){
			end=pageCount;
			begin=pageCount-4;
			
		}
	}
	for(;begin<=end;end--){
	if(end==page){
	$("#firstPage").after(" <li class='active'><a href='javascript:void(0)' onclick='pageClick(this)'>"+end+"</a></li>");
	
	}
	else{
	$("#firstPage").after(" <li><a href='javascript:void(0)' onclick='pageClick(this)'>"+end+"</a></li>");
	}
}

	if(pageCount>1&&page!=1){
	$("#firstPage").after(" <li><a href='javascript:void(0)' onclick='pageClick(this)'>上一页</a></li>");
	}
		
}

//Order_back_btn(退货按钮触发事件)弹出一个带iframe模态框的页面进行操作
function Order_back_btn(e){
		var id=$(e).parent().parent().children()[0];
			$("#myModalLabel", window.parent.document).text("申请退货");
		parent.openModel();
		$("#Modeliframe",window.parent.document).attr("src","<c:url value='/hospital/jump_back_new.action'/>?orderDto.id="+$.trim($(id).text()));

	
	}
	
	//Order_look_btn（查找按钮）弹出一个带iframe模态框的页面进行操作
	function Order_look_btn(e){
	var id=$(e).parent().parent().children()[0];
	$("#myModalLabel", window.parent.document).text("订单详情");
	$("#Modeliframe",window.parent.document).attr("src","<c:url value='/hospital/jump_purchase_maintain.action'/>?orderDto.id="+$.trim($(id).text()));
	
		parent.openModel();
	}
 




//当点击“采购单列表”按钮，则加载分页栏
$(function(){
loadPage(${orderPageCount});
	//订单时间input的日历控件
			// disabling dates   
    var nowTemp = new Date();
var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
 
var checkin =  $("#orderDto_begin_order_time_input").datepicker({
  onRender: function(date) {
    return date.valueOf() > now.valueOf() ? "disabled" : "";
  },
  format: "yyyy-mm-dd"
}).on("changeDate", function(ev) {
	
 	if (ev.date.valueOf() != now.valueOf()) {	
 			  var newDate = new Date(ev.date)
 				newDate.setDate(newDate.getDate() + 1);
    				checkout.setValue(newDate);
 		
  
 }
 
  checkin.hide();
   $("#orderDto_end_order_time_input")[0].focus();
}).data("datepicker");
var checkout = $("#orderDto_end_order_time_input").datepicker({
  onRender: function(date) {
    return date.valueOf() >= checkin.date.valueOf() && date.valueOf() <= now.valueOf()? "" : "disabled" ;
  },format: "yyyy-mm-dd"
}).on("changeDate", function(ev) {
  checkout.hide();
}).data("datepicker");
checkin.setValue(now);
checkout.setValue(now);




//解析由struts传递来的订单status的值
var statuslist=$(".orderStatus");
for(var i=0;i<statuslist.length;i++){
	$(statuslist[i]).text(parseOrderStatus($.trim($(statuslist[i]).text())));
}

	}); 








		//ajax处理订单列表
		//有/无 总页数=+订单字段·订单字段·订单字段·订单字段·订单字段|订单字段·订单字段·订单字段·订单字段·订单字段·订单字段+
function load_purchase_list(data){

				//清空list数据
                 $("#blank_div_and_table_parent").children().remove();
                 //删除分页
				$("#list_page").children("li").remove();
                //本来可用json
                if(data.charAt(0)=="无"){
                    //无数据的时候；添加blank_Div的，删除分页栏
                    	$("#blank_div_and_table_parent").append($("<div id='blank_div'  class='hero-unit'>  <h1>无任何数据</h1>  <p>No thing</p></div> "));
                  
                    	
                    }
                    else{
                    $("#blank_div_and_table_parent").append("<table cellpadding='0' cellspacing='0' border='0' class='table table-striped table-bordered'><thead><tr> <th>采购单编号</th><th>建单时间</th><th>总金额</th><th>采购单状态</th><th>退单时间</th><th>查看</th><th>退货</th></tr></thead><tbody id='list_tbody'></tbody></table>");
						//添加分页
	            		loadPage(data.substring(1,data.indexOf("=")));
                    	//解析字符串
                    	//将+和  +之间的有用数据取出
                   		var medicine_data_by_page=data.substring((data.indexOf("+")+1),data.lastIndexOf("+"));
                    	//将每一行的数据分割存放在数组中
						var medicine_list_array_by_page=medicine_data_by_page.split("|");
					  	//遍历行
                   		for(var i=0;i<medicine_list_array_by_page.length;i++){
                    		
                    		var attribute=$("<tr class=' odd gradeX'></tr>");
                    		//将该行中的属性分割存放在数组中
                    		var medicine_attribute_array=medicine_list_array_by_page[i].split("·");
                    		//遍历属性
                    		for(var j=0;j<medicine_attribute_array.length;j++){
                    			if(j==3){
                    				attribute.append($("<td>"+parseOrderStatus(medicine_attribute_array[j])+"</td>"))
                    			}
                    			else{
                    			attribute.append($("<td>"+medicine_attribute_array[j]+"</td>"));
                    			
                    			}
                    			}
                    		var status=medicine_attribute_array[3]
                    	
                    	attribute.append($("<td><a class='Order_look_btn' onclick='Order_look_btn(this)' href='JavaScript:void(0)'>查看</a><input type='hidden' value='"+status+"' ></td>"));
                   			if(status=="31"||status=="21"||status=="30"||status=="20"){
                    		attribute.append($("<td><a class='Order_back_btn'onclick='Order_back_btn(this)' href='JavaScript:void(0)'>退货</a></td>"));
                    	}
                    	else{
                    		attribute.append($("<td></td>"));
                    	}	
                   			
                   			
                   			$("#list_tbody").append(attribute);
                   		 }
                   
                    
                    		
                    
                    }
}
 		







//为分页栏按钮添加事件

function pageClick(e){
	var pageButton=e.text;
	if(pageButton=="首页"){
			page=1;
		}
	else if(pageButton=="尾页"){
		page=pageCount
	
		}
	else if(pageButton=="下一页"){
			page+=1;
	}
	else if(pageButton=="上一页"){
				page-=1;
	}
	else{
		page=Number(e.text);
			
		}
	
 	 $.ajax({
                cache: false,
                type: "GET",
                url:"<c:url value='/hospital/null_ajax_purchase_search.action'/>?page="+page,
                async:true,
                success:function (data){
                load_purchase_list(data);
                }
            });
};

	
	//查询按钮搜索数据
	$("#btn_ajax_purchase").click(function(){
		 $.ajax({
                cache: false,
                type: "POST",
                url:"<c:url value='/hospital/null_ajax_purchase_search.action'/>",
                data:$("#myForm").serialize(),// 你的formid
                async: true,
                success:function (data){
               //此处当前页状态必须归0
                page=1;
                load_purchase_list(data);
                
                }
                
            });
		
	
	});
	
	
 	
 	
 		
 		
 		</script>
</html>

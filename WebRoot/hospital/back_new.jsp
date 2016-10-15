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
  <s:if test="orderDto==null">
  <div  id="when_order_null" class="container-fluid">
  <div class="row-fluid">
                <!--/span-->
                <div class="span12">
 					<div id='blank_div'  class="hero-unit">  <h1>订单已进入退货环节</h1>  <p>No thing</p></div>
 			 </div>
  </div>
  </div>
  
  
  </s:if>
  <s:else>
  
  
   <div  class="container-fluid" id="when_order_non_null">
            <div class="row-fluid"> 
                       
 
			<div class=" row-fluid" style="margin-top:1%">		
				 <p class="span4 "><input  class="btn btn-info" type="button" id="orderDto_id" value="采购单编号：<s:property value='orderDto.id'/> "/></p>
				<p class="span3 offset1 "><input   class="btn btn-info" type="button" id="orderDto_status" value="状态:<s:property value='orderDto.status'/> "/></p>
					 <span id="btn_ajax_return_order_information" class="span2 offset2" style="color:red"></span>
					 
				
								</div>
								 <div class=" row-fluid" style="margin-top:1%;margin-bottom:0.5%">	
								<p class="span4 "><input  class="btn btn-info  " type="button" id="orderDto_order_time" value="建单时间：<s:property value='orderDto.order_Time'/>" />
            					</p>
								
								<button  type="button" class="btn btn-success span3 offset1">总价： ￥：<font id="order_amount"><s:property  value="orderDto.amount"/></font></button> 				
								 </div>
                                <div class="block-content collapse in">
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                        <thead>
										<tr>
											<th>药品名</th>
											<th>药品编号</th>
											<th>单价</th>
											<th>数量</th>
											<th>金额</th>  
										</tr>
									</thead>
                                        <tbody id="list_tbody">
                                             <s:iterator value="orderItemDtoList" var="oit">
                    <tr class="odd gradeX">   
                        <td><s:property value="#oit.medicine.name"/>
                        </td>
                        <td><s:property value="#oit.medicine.number"/></td>
                        <td><s:property value="#oit.medicine.price"/></td>
                         <td ><s:property value="#oit.number"/></td>
                        <td><font>￥：</font><font class="orderItem_medicine_amount"><s:property value='#oit.amount'/></font></td>         
                    </tr>
                    </s:iterator>
                                        </tbody>
                                    </table>
                                </div>
                                
    <div class="pagination pagination-right" style="margin-bottom:0;margin-top:0;">
          <ul id="list_page">
 
        </ul>
            </div>  

							
                        
           
                    </div>
                   
      
       	</div>

                                <form  id="back_new_form" >
           
             <div class="row-fluid">
              <div class="form-group">
                    <label for="orderDto_returnReason_Input">退货原因 :</label>
                    <textarea rows="4" style="width:100%; resize:none;" id="orderDto_returnReason_Input" name="orderDto.return_Reason" ></textarea>
                 <input  name="orderDto.id" type="hidden" value="<s:property value='orderDto.id'/>"/>
                    </div>
             
             </div>
              <div class="row-fluid">
                     <button id="btn_ajax_purchase" type="button" class="btn btn-danger span2 offset10">退货</button>
                     
                     </div>           
                                
                                </form>
							

  
            
        </s:else>
       
  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/assets/scripts.js'/>"></script>
         <script src="<c:url value='/hospital/js/orderStatusfunction.js'/>"></script>
        <script type="text/javascript">
        //当页面加载时，默认为1
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


//当点击“药品目录查询”按钮，则加载分页栏
$(function(){
loadPage(${orderItemPageCount});
var str=$.trim($("#orderDto_status").val());
        	$("#orderDto_status").val("状态:"+parseOrderStatus(str.substr(str.indexOf(":")+1)));
	}); 
        
        
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
                url:"<c:url value='/hospital/null_ajax_load_back_new.action'/>?page="+page+"&orderDto.id="+"<s:property value='orderDto.id'/>",
                async:true,
                success:function (data){
                load_order_list(data);
                }
            });
};

$("#btn_ajax_purchase").click(function(){
 $.ajax({
                cache: false,
                type: "POST",
                url:"<c:url value='/hospital/null_ajax_return_order.action'/>",
                data:$("#back_new_form").serialize(),// 你的formid
                async: true,
                success:function (data){
                if(data=="订单已退货"){
                $("#when_order_non_null").remove();
                 $("#back_new_form").remove();
				 $("body").append($("<div  id='when_order_null' class='container-fluid'><div class='row-fluid'><div class='span12'><div id='blank_div'  class='hero-unit'>  <h1>订单已进入退货环节</h1>  <p>No thing</p></div></div></div></div>"));
				}
				else{
				$("#btn_ajax_return_order_information").text(data); 
				}
                

                }
                
            });
 	


});

        
        
//ajax处理订单项列表
//  订单项属性· 订单项属性· 订单项属性· 订单项属性|订单项属性· 订单项属性· 订单项属性· 订单项属性
function load_order_list(data){
				//清空list数据

                 $("#list_tbody").children("tr").remove();
                 	//删除分页
					$("#list_page").children("li").remove();
                    //本来可用json                                        
                    //添加分页
   loadPage(${orderItemPageCount});
                    
                    	//将每一行的数据分割存放在数组中
					var order_list_array_by_page=data.split("|");
           	
                  
                   	
                   //遍历行
                    for(var i=0;i<order_list_array_by_page.length;i++){
                    		
                    		var attribute=$("<tr class=' odd gradeX'></tr>");
                    		//将该行中的属性分割存放在数组中
                    		
                    	var order_attribute_array=order_list_array_by_page[i].split("·");
                    		
                    		//遍历属性
                    		for(var j=0;j<order_attribute_array.length;j++){
                    		
                    				attribute.append($("<td>"+order_attribute_array[j]+"</td>"));
		
                    			
                    		}
                    
                    $("#list_tbody").append(attribute);
                    }
                   	
                    
                    }

        
              
        
        
        
        
    
        
        </script>
 
</html>

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
 					<div id='blank_div'  class="hero-unit">  <h1>订单已删除</h1>  <p>No thing</p></div>
 			 </div>
  </div>
  </div>
  
  
  </s:if>
  <s:else>
   <div id="when_order_non_null" class="container-fluid">
            <div class="row-fluid">
                <!--/span-->
                <div class="span12" id="content">
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- block -->
                            <div class="block">

							<s:if test="orderDto.status==10">
								<div class=" row-fluid OrderItemBody">
									<a id="purchase_new_delete_some" class="span2  btn btn-danger"><i
										class="icon-minus icon-white"></i>批量删除</a>
									 <span id="btn_ajax_update_order_information" class="span2" style="color:red"></span>
									<button class="span2 offset6 ajax_order btn btn-primary">
										<i class="icon-ok icon-white"></i><font>修改</font>
									</button>
								</div>
							</s:if>
							<s:if test="orderDto.status==0">
								<div class=" row-fluid OrderItemBody">
									<a id="purchase_new_delete_some" class="span2  btn btn-danger"><i
										class="icon-minus icon-white"></i>批量删除</a>
 									<span id="btn_ajax_update_order_information" class="span2" style="color:red"></span>
									<button class="span2 offset4 ajax_order btn btn-primary">
										<i class="icon-file icon-white"></i><font>保存</font>
									</button>

									<button class="span2  ajax_order btn btn-primary">
										<i class="icon-ok icon-white"></i><font>提交订单</font>
									</button>
								</div>
							</s:if>
							
							<div class=" row-fluid" style="margin-top:1%">		
				 <p class="span4 "><input  class="btn btn-info" type="button" id="orderDto_id" value="采购单编号：<s:property value='orderDto.id'/> "/></p>
				<p class="span3 offset1 "><input   class="btn btn-info" type="button" id="orderDto_status" value="状态:<s:property value='orderDto.status'/> "/></p>
					 
				<p class="span4 "><input  class="btn btn-info  " type="button" id="orderDto_order_time" value="建单时间：<s:property value='orderDto.order_Time'/>" />
             </p>
								</div>
								 <div class=" row-fluid" style="margin-top:1%;margin-bottom:0.5%">	
								<button  type="button" class="btn btn-success span3">总价： ￥：<font id="order_amount"><s:property  value="orderDto.amount"/></font></button> 				
 							<s:if test="orderDto.status>=60">
								<p class="span4 offset1"><input  class="btn btn-info" type="button" id="orderDto_return_time" value="退货时间：<s:property value='orderDto.return_Time'/> "/></p>
								 </s:if>
								 </div>
                                <div class="block-content collapse in">
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                        <thead>
										<tr>
										<s:if test="orderDto.status<=10">
											<th><input type="checkbox" id="purchase_new_Id_all" />
											</th>
											</s:if>
											<th>药品名</th>
											<th>药品编号</th>
											<th>单价</th>
											<th>数量</th>
											<th>金额</th>
											  <s:if test="orderDto.status<=10">
											<th>操作</th>
											</s:if>
										</tr>
									</thead>
                                        <tbody id="list_tbody">
                                             <s:iterator value="orderItemDtoList" var="oit">
                    <tr class="odd gradeX">
                    	<s:if test="orderDto.status<=10">
                        <td><input type="checkbox" class="purchase_new_Id_list" />
                        <input type="hidden" value=" <s:property value='#oit.id'/>" class="orderItem_id_input" />
                        </td>
                        </s:if>
                        <td><s:property value="#oit.medicine.name"/>
                        </td>
                        <td><s:property value="#oit.medicine.number"/></td>
                        <td><s:property value="#oit.medicine.price"/></td>
                        <s:if test="orderDto.status<=10">
                        <td >
                       		 <div class="input-append"> 
                         		<button class="btn btn-mini" type="button" onclick="orderItem_medicine_number_reduce_click(this)">-</button>
                        		<input  class="input-mini orderItem_medicine_number"   value="<s:property value='#oit.number'/>"/>                      
                         		<button class="btn btn-mini" type="button" onclick="orderItem_medicine_number_add_click(this)">+</button>
                         		<font hidden ><s:property value='#oit.number'/></font>
                         		</div>
                         </td>
                         </s:if>
                         <s:if test="orderDto.status>10">
                         <td >
                       		 
                         <s:property value="#oit.number"/>                    
                       
                         		
                         </td>
                         
                         </s:if>
                        <td><font>￥：</font><font class="orderItem_medicine_amount"><s:property value='#oit.amount'/></font></td>
                          <s:if test="orderDto.status<=10">
                        <td><a  href="javascript:void(0);" onclick="purchase_delete_a(this)">删除</a></td>
                          </s:if>
                    </tr>
                    </s:iterator>
                                        </tbody>
                                    </table>
                                </div>
                                <s:if test="orderDto.status>10">
    <div class="pagination pagination-right">
          <ul id="list_page">
 
        </ul>
            </div>
        </s:if>
                                
                                
                                
                                <s:if test="orderDto.status>=60">
							     <div class="row-fluid">
              <div class="form-group">
                    <label for="orderDto_returnReason_Input">退货原因 :</label>
                    <input type="hidden" name="orderDto.id" value="">
                    <textarea rows="4" style="width:100%;resize:none;" disabled="disabled" id="orderDto_returnReason_Input" name="orderDto.return_Reason"><s:property value='orderDto.return_Reason'/></textarea>
                 
                    </div>
             
             </div>
             </s:if>


							<!-- /block -->
                        </div>
           
                    </div>
                   
            
                </div>
            </div>
            <hr>
        </div>
       	</div>
       
     
    
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
                url:"<c:url value='/hospital/null_ajax_load_orderItem.action'/>?page="+page+"&orderDto.id="+"<s:property value='orderDto.id'/>",
                async:true,
                success:function (data){
                load_order_list(data);
                }
            });
};
        
        
        
        
        
        
        
         //计算总金额
        function order_amount(){
				var amountList=$(".orderItem_medicine_amount");
				var amount=0;
				for(var i=0;i<amountList.length;i++){
				amount+=Number($(amountList[i]).text());
				}
				$("#order_amount").text(amount);
        }
        
        
       //订单基本信息栏+订单项数量行----------------------------
        $(function(){
         var str=$.trim($("#orderDto_status").val());
        	$("#orderDto_status").val("状态:"+parseOrderStatus(str.substr(str.indexOf(":")+1)));
        
        
        	var orderItem_number_li=$(".orderItem_medicine_number");
        	for(var i=0;i<orderItem_number_li.length;i++){
        		if(orderItem_number_li[i].value==1){
        		
        			$(orderItem_number_li[i]).prev().attr("disabled","disabled");
        		}
        	
        	}
        	
        });
   //删除订单项---------------------------------------------------
   
        //总的复选框触发其他复选框反选操作
	$("#purchase_new_Id_all").change(function(){
	var list=$(".purchase_new_Id_list");

	for(var i=0;i<list.length;i++){
	//直接使用js
		if(	list[i].checked==false){
			list[i].checked=true;
		}
		else{
			list[i].checked=false;
		}


}

});
//判断复选框点击状态批量删除
$("#purchase_new_delete_some").click(function(){
 var list=$(".purchase_new_Id_list");
 	for(var i=0;i<list.length;i++){
		if(	list[i].checked==true){
		$(list[i]).parent().parent().remove();
		
		}
	}
order_amount();
});

//单行删除
function purchase_delete_a(e){

	$(e).parent().parent().remove();
order_amount();
}
//------------------订单项[数量][小计]栏目以及订单的【总价】------------

$(".orderItem_medicine_number").blur(function(){
var str=$(this).val();
var pa=new RegExp("[0-9]");
for(var s=0;s<str.length;s++){
if(pa.test(str.charAt(s))){
}
else{
	$(this).val(str.substring(0,s));
	break;
}
}

});

//当数量为1的时候将“-”按钮禁止
$(".orderItem_medicine_number").keyup(function(){
//正则表达式，删除非数字
var str=$(this).val();
var pa=new RegExp("[0-9]");
for(var s=0;s<str.length;s++){
if(pa.test(str.charAt(s))){
}
else{
	$(this).val(str.substring(0,s));
	break;
}
}
//当输入框为空的时候
if(str==""||str=="0"){
$(this).val(1);
}

//主功能
if(str==1){
	$(this).prev().attr("disabled","disabled");
}
else{
$(this).prev().removeAttr("disabled");

}

//更改金额
str=$(this).val();
	var price=$(this).parent().parent().prev().text();
	$(this).parent().parent().next().children().next().text(price*str);
        order_amount();	

});
//减少按钮
function orderItem_medicine_number_reduce_click(e){
	var number=$(e).next().val()-1;
	$(e).next().val(number);
	if($(e).next().val()==1){
		$(e).attr("disabled","disabled");
	}
	var price=$(e).parent().parent().prev().text();
	$(e).parent().parent().next().children().next().text(price*number);
	 order_amount();	
}
//增加按钮
function orderItem_medicine_number_add_click(e){
	var number=Number($(e).prev().val());
	$(e).prev().val(number+1);
	if($(e).prev().val()>1){
		$(e).prev().prev().removeAttr("disabled");
	}
	var price=$(e).parent().parent().prev().text();
	$(e).parent().parent().next().children().next().text(price*(number+1));
	 order_amount();	
}
        
  //------------ajax提交保存或者提交订单-------------
        $(".ajax_order").click(function(){
        var str;
        if($($(this).children()[1]).text()=="保存"){
       
        str="0=";  
        }
        else if($($(this).children()[1]).text()=="修改"){
        //当订单处于10的状态的时候进行修改
        	str="101="
        }
        else{
        	str="10=";
        	
        }
    
        //
        //当订单为状态0的时候  修改订单：格式 0=orderitemid@number·orderitemid@number·orderitemid@number·orderitemid@number
//         					全部删除的时候为格式为0
         //当订单为状态0的时候  提交订单：格式10=orderitemid@number·orderitemid@number·orderitemid@number·orderitemid@number
//          				全部删除的时候为格式为10
////当订单为状态10的时候  修订单：格式101=orderitemid@number·orderitemid@number·orderitemid@number·orderitemid@number*orderID
      var id_list=  $(".orderItem_id_input");
      var number_list=  $(".orderItem_medicine_number");
      for(var s=0;s<id_list.length;s++){
      	str=str+$.trim($(id_list[s]).val())+"@"+$.trim($(number_list[s]).val())+"·";
      }
      
      
       if($($(this).children()[1]).text()=="修改"){
        //当订单处于10的状态的时候进行修改
        	
        	str=str+"*<s:property value='orderDto.id'/>"
        }
        else{
        	str=str.substring(0,(str.length-1));
        }
       $.ajax({
				cache:false,
				type:"POST",
				url:"<c:url value='/hospital/null_ajax_update_purchase.action'/>",
				data:{
					purchase_maintain_jsp_information : str
				},
				async:true,
				success:function(data){
				
				if(data=="订单已删除"){
				$("#when_order_non_null").remove();
				 $("body").append($("<div  id='when_order_null' class='container-fluid'><div class='row-fluid'><div class='span12'><div id='blank_div'  class='hero-unit'>  <h1>"+data+"</h1>  <p>No thing</p></div></div></div></div>"));
				}
				else{
				$("#btn_ajax_update_order_information").text(data); 
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
					var medicine_list_array_by_page=data.split("|");
           	
                  
                   	
                   //遍历行
                    for(var i=0;i<medicine_list_array_by_page.length;i++){
                    		
                    		var attribute=$("<tr class=' odd gradeX'></tr>");
                    		//将该行中的属性分割存放在数组中
                    		
                    	var medicine_attribute_array=medicine_list_array_by_page[i].split("·");
                    		
                    		//遍历属性
                    		for(var j=0;j<medicine_attribute_array.length;j++){
                    		
                    				attribute.append($("<td>"+medicine_attribute_array[j]+"</td>"));
		
                    			
                    		}
                    
                    $("#list_tbody").append(attribute);
                    }
                   
                    
                    		
                    
                    }

        
              
        
        
        
        
    
        
        </script>
 
</html>

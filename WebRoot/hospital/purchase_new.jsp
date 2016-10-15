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
    <table id="order_info" class=" table table-unbordered"> 
            <tr>
                <td>
                    <label for="orderDto_id_Input">采购单编号 :</label>
                    <input class="btn btn-info"  type="button"  id="orderDto_id_Input" value="<s:property value='orderDto.id'/>" >
                </td>
                <td>
                    <label for="orderDto.order_time_input">建单时间 :</label>
                    <input  class="btn btn-info" type="button" id="orderDto_order_time_input" value="<s:property value='orderDto.order_Time'/>" >
                </td>
       			<td>
                    <label for="orderDto_hospital">购买方 :</label>
                    <input class="btn btn-info"  type="button" id="orderDto_hospital" value="" >
                </td>
            </tr>     
        </table>
       
        <br/>
      <div class="navbar navbar-inner ">
            <div class="muted pull-left" ><p class="navbar-text">订单详情</p></div>
     </div>
     
     <div id="when_orderItem_null" class="block-content collapse in">
     
     			<s:if test="orderDto.id==''">
           
                  <div id='blank_div'  class='hero-unit'>  <h1>没有订单</h1>  <p>No thing</p></div> 
              </s:if>
              
             <s:elseif test="orderDto.id!=''">  
      <div class="OrderItemBody">
      
           <a id="purchase_new_delete_some" class="btn btn-danger"><i class="icon-minus icon-white"></i>批量删除</a>
          
        </div>
        <br>
        <div class="OrderItemBody">    
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                <thead>
                    <tr>
                    
                        <th><input type="checkbox" id="purchase_new_Id_all" />
                        
                        
                        </th>  	
                        <th>药品名</th>
                        <th>药品编号</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>金额</th>
                        <th>操作</th>
                    </tr>
                </thead>
                 <tbody>
              
             
              <s:iterator value="orderItemDtoList" var="oit">
                    <tr class="odd gradeX">
                        <td><input type="checkbox" class="purchase_new_Id_list" />
                        <input type="hidden" value=" <s:property value='#oit.id'/>" class="orderItem_id_input" />
                        </td>
                        <td><s:property value="#oit.medicine.name"/>
                        </td>
                        <td><s:property value="#oit.medicine.number"/></td>
                        <td><s:property value="#oit.medicine.price"/></td>
                        <td >
                       		 <div class="input-append"> 
                         		<button class="btn btn-mini" type="button" onclick="orderItem_medicine_number_reduce_click(this)">-</button>
                        		<input  class="input-mini orderItem_medicine_number"   value="<s:property value='#oit.number'/>"/>                      
                         		<button class="btn btn-mini" type="button" onclick="orderItem_medicine_number_add_click(this)">+</button>
                         		<font hidden ><s:property value='#oit.number'/></font>
                         		</div>
                         </td>
                        <td><font>￥：</font><font class="orderItem_medicine_amount"><s:property value='#oit.amount'/></font></td>
                        <td><a  href="javascript:void(0);" onclick="purchase_delete_a(this)">删除</a></td>
                    </tr>
                    </s:iterator>
		  </tbody>
            </table>
        </div>
            </s:elseif>
            
            
         <s:if test="orderDto.id!=''">
        <center class="OrderItemBody">
         <button  type="button" class="btn btn-success">总价： ￥：<font id="order_amount"><s:property  value="orderDto.amount"/></font></button>
          <button  class=" ajax_order btn btn-primary" align="center">保存</button>
          <button class="ajax_order btn btn-primary">提交</button>
           <span id="btn_ajax_update_order_information" class="help-inline" style="color:red"></span>
        
        </center>
        </s:if>
        
        
        
        
    <!--     <div class="pagination pagination-right">
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
         -->
    </div>
       
  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/assets/scripts.js'/>"></script>
        <script type="text/javascript">
        //一些js的调用方法
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
        if($.trim($("#orderDto_id_Input").val())!=0){
        	$("#orderDto_hospital").val("${hospital.name}");
        	}
        	else{
        	
        		$("#order_info").children().remove();
        		$("#order_info").append($("<tr><td><input  class='btn btn-danger' type='button' value='无未提交订单信息' ><tr>"))
        	  
                    
        	
        	}
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
        if($(this).text()=="保存"){
       
        str="0=";  
        }
        else{
        	str="10=";
        	
        }
    
        
        //格式   id@number·id@number·id@number·id@number
      var id_list=  $(".orderItem_id_input");
      var number_list=  $(".orderItem_medicine_number");
      for(var s=0;s<id_list.length;s++){
      	str=str+$.trim($(id_list[s]).val())+"@"+$.trim($(number_list[s]).val())+"·";
      }
    
      str=str.substring(0,(str.length-1));
       $.ajax({
				cache:false,
				type:"POST",
				url:"<c:url value='/hospital/null_ajax_update_purchase_status_0.action'/>",
				data:{
					purchase_new_jsp_information : str
				},
				async:true,
				success:function(data){
				
				if(data=="订单已被删除"){
				$(".OrderItemBody").remove();
				 $("#when_orderItem_null").append($("<div id='blank_div'  class='hero-unit'>  <h1>"+data+"</h1>  <p>No thing</p></div> "));
                  $("#order_info").children().remove();
        		$("#order_info").append($("<tr><td><input  class='btn btn-danger' type='button' value='无未提交订单信息' ><tr>"))
        	  
                     
				}
				else{
				if(data=="提交成功"){
				$(".OrderItemBody").remove();
				$("#when_orderItem_null").append($("<div id='blank_div'  class='hero-unit'>  <h1>"+data+"</h1>  <p>No thing</p></div> "));
                 
				
				}
				else{
					$("#btn_ajax_update_order_information").text(data); 
				}
				
				}
			 
				
			
				}
		
	});
        
        
        })
        
        </script>
 
</html>

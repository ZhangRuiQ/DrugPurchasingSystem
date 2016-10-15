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

  
  
  
  
 
    <form id="myForm" action="">
        <table class="table table-unbordered"> 
            <tr>
            	<td>
                    <label for="numberInput">流水号 :</label>
                    <input name="condition.number" type="text" id="numberInput" >
                </td>
                <td>
                    <label for="nameInput">通用名 :</label>
                    <input name="condition.name" type="text" id="nameInput" >
                </td>
                
                <td>
                    <label></label>
                    <div class="btn-group">
                    <input id="inputPriceSort" name="condition.pricesort" type="hidden" value="asc" >
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
            <tr>
            

                
               
                <td>
                    <label for="manufacturerNameInput" >生产企业:</label>
                    <input name="condition.manufacturerName" type="text" id="manufacturerNameInput" >
                </td>
                
                 <td>
                    <label>药品类别 :</label>
                    <div class="btn-group">
                    	<input name="condition.type" id="conditionType" type="hidden" value="0"/>
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown" >
                       		<font id="conditionTypeText">全部</font>
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                         <li><a href="javascript:void(0)" onclick="allTypeClick()">全部	</a></li>
                        
                        <c:forEach var="s" items="${medicineType }">
                        	
                        <li><a href="javascript:void(0)" onclick="aClick(this)">${s }</a></li>
                        
                        </c:forEach>
                        
                       
                        </ul>
                    </div>
                </td>
                
                <td>
                    <label>交易状态 :</label>
                    <div class="btn-group">
                    <input id="conditionStatus" name="condition.status" type="hidden" value="3">
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown">
                        		<font id="conditionStatusText">全部</font>
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                         <li><a id="conditionStatus0"href="javascript:void(0)">全部</a></li>
                          <li><a id="conditionStatus1"href="javascript:void(0)">正常供货</a></li>
                            <li><a id="conditionStatus2" href="JavaScript:void(0)">暂停交易</a></li>
                            <li><a id="conditionStatus3"href="javascript:void(0)">接受预定</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
            <tr>
               
                <td>
                      <!-- 点击查询按钮默认page为0 -->
    <input type="hidden" name="page" id="pageInput" value="0">
                   <label></label>
                    <button id="btn_ajax_medicine" type="button" class="btn btn-primary">查询</button>
                     <a  target="_blank" href="<c:url value='/hospital/download_downloadMedicine.action'/>" class="btn btn-primary">导出</a>
                      <button id="btn_ajax_add_medicine" type="button"   class="btn btn-primary">批量加入购物单</button>          
            			
             
                </td>
                <td>
                <label></label>
                <span id="btn_ajax_add_medicine_information" class="help-inline" style="color:red"></span>
                 </td>
                 <td></td>
                 <td></td>
                
                
            </tr>
           
        </table>
         
      <div class="navbar navbar-inner ">
            <div class="muted pull-left" ><p class="navbar-text">药品目录列表</p></div>
     </div>
     <div class="block-content collapse in">
        <div id="medicine_list_div" >    
            <table  cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="medicine_list_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="add_medicine_Id_all"/></th>
                        <th>流水号</th>
                        <th>通用名</th>
                        <th>生产企业</th>
                        <th>药品类别</th>
                        <th>规格</th>
                        <th>库存量</th>
                        <th>价格</th>
                        <th>交易状态</th>
                    </tr>
                </thead>
                
                 <tbody id="medicine_list_tbody"> 
                 	<s:iterator value="medicineDtoList" var="s">
                    <tr   class="odd gradeX ">
                        <td><s:if test="#s.status=='接受预定' or #s.status=='正常交易'"><input  type="checkbox" class="add_medicine_Id_list" /></s:if></td>
                        <td><s:property value="#s.number"/></td>
                        <td><s:property value="#s.name"/></td>
                        <td><s:property value="#s.manufacturer.name"/></td>
                        <td class="center"> <s:property value="#s.type"/></td>
                        <td class="center"><s:property value="#s.standard"/></td>
                        <td><s:property value="#s.stock_Balance"/></td>
                        <td><s:property value="#s.price"/></td>
                        <td><s:property value="#s.status"/></td>
                   
                    </tr> 
                        </s:iterator>                                
                </tbody>
            </table>
    </div>

    <div class="pagination pagination-right" >
    
        <ul id="medicine_list_page">
        </ul>
    </div>
    </div>
       </form>
  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/assets/scripts.js'/>"></script>
        <!--此处JavaScript是用于加载页面信息，（分页、药品列表，搜索系统【涉及按钮查找】） -->
 <script type="text/javascript">
 //当页面加载时，默认为1
var page=1;
//总页数
var pageCount
//分页   动态加载函数
function loadPage(pagecount){

	var begin;
	pageCount=pagecount
	var end;
	$("#medicine_list_page").append("<li id='firstPage'><a  href='javascript:void(0)' onclick='pageClick(this)'>首页</a></li>");
	$("#medicine_list_page").append(" <li><a    href='javascript:void(0)' onclick='pageClick(this)'>尾页</a></li>");
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
loadPage(${PageCount});
	}); 

var flag=0;//判断是否存在black_div  0为没有，1为有

//ajax处理药品列表
function load_medicine_list(data){
				//清空list数据
                 $("#medicine_list_tbody").children("tr").remove();
                 	//删除分页
					$("#medicine_list_page").children("li").remove();
                    //本来可用json
                    if(data.charAt(0)=="无"){
                    //无数据的时候；添加blank_Div的，删除分页栏
                    if(flag==0){
                    $("#medicine_list_div").append($("<div id='blank_div'  class='hero-unit'>  <h1>无任何数据</h1>  <p>No thing</p></div> "));
                   	flag=1;
                    }
                    }
                    else{
                    //删除blank_Div的
                    if(flag==1){
                     $("#blank_div").remove();  
                    
                    }
                    
                    
                        
                    //添加分页
            
                    loadPage(data.substring(1,data.indexOf("=")));
                    //解析字符串
                    	//将+和  +之间的有用数据取出
                    var medicine_data_by_page=data.substring((data.indexOf("+")+1),data.lastIndexOf("+"));
                    
                    	//将每一行的数据分割存放在数组中
					var medicine_list_array_by_page=medicine_data_by_page.split("|");
                   		//药品目录的表头的复选框归为默认的没有选中状态
      			document.getElementById("add_medicine_Id_all").checked=false;
                   		
                  
                   	
                   //遍历行
                    for(var i=0;i<medicine_list_array_by_page.length;i++){
                    		
                    		var attribute=$("<tr class=' odd gradeX'></tr>");
                    		//将该行中的属性分割存放在数组中
                    		
                    	var medicine_attribute_array=medicine_list_array_by_page[i].split("·");
                    		
                    		
                    			if(medicine_attribute_array[medicine_attribute_array.length-1]=="接受预定"||medicine_attribute_array[medicine_attribute_array.length-1]=="正常交易"){
                    				attribute.append($("<td><input type='checkbox' class='add_medicine_Id_list'/></td>"));
                    			}
                    			if(medicine_attribute_array[medicine_attribute_array.length-1]=="暂停交易"){
                    				attribute.append($("<td></td>"));
                    		
                    				}
                    
                    		//遍历属性
                    		for(var j=0;j<medicine_attribute_array.length;j++){
                    		
                    				attribute.append($("<td>"+medicine_attribute_array[j]+"</td>"));
		
                    			
                    		}
                    
                    $("#medicine_list_tbody").append(attribute);
                    }
                   
                    
                    		
                    
                    }
}



 //价格排序按钮js
 	$("#conditionPrice2").click(function(){
 				$("#inputPriceSort").val("asc");
 				$("#conditionPriceTest").text("价格从低到高");
 	
 	});
 	$("#conditionPrice1").click(function(){
 				$("#inputPriceSort").val("desc");
 				$("#conditionPriceTest").text("价格从高到低");
 
 	});
 	//交易状态排序按钮js
 	$("#conditionStatus1").click(function(){
 		$("#conditionStatus").val("0");	
 		$("#conditionStatusText").text("正常供货"); 	
 	});
 	$("#conditionStatus2").click(function(){
 			$("#conditionStatus").val("1");	
 			$("#conditionStatusText").text("暂停交易"); 
 			
 	});
 	$("#conditionStatus3").click(function(){
 		$("#conditionStatus").val("2");	
 		$("#conditionStatusText").text("接受预定"); 
 		
 	});

 		$("#conditionStatus0").click(function(){
 		$("#conditionStatus").val("3");	
 		$("#conditionStatusText").text("全部"); 
 		
 	});
 	 	//药品类型排序
 	function aClick(e){
 		var str=e.text;
 		$("#conditionTypeText").text(str);
 		$("#conditionType").val(str);
 	
 	};
 	function allTypeClick(){
 	
 	$("#conditionTypeText").text("全部");
 		$("#conditionType").val("0");
 	
 	}
 	//查找按钮触发时间      （改变条件）
 	$("#btn_ajax_medicine").click(function(){
 	$("#pageInput").val(0);
 	 $.ajax({
                cache: false,
                type: "POST",
                url:"<c:url value='/hospital/null_ajax_medicine_search.action'/>",
                data:$("#myForm").serialize(),// 你的formid
                async: true,
                success:function (data){
               //此处当前页状态必须归0
                page=1;
               
                load_medicine_list(data);
                
                }
                
            });
 	
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
                url:"<c:url value='/hospital/null_ajax_medicine_search.action'/>?page="+page,
                async:true,
                success:function (data){
                load_medicine_list(data);
                }
            });
};

//总的复选框触发其他复选框反选操作
$("#add_medicine_Id_all").change(function(){
var list=$(".add_medicine_Id_list");

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
//加入购物车
//判断add_medicine_Id_list复选框是否选，被选则索引他改项其number值
//将所有的选中medicineid组织成字符串用·隔开，然后后台解析。。。。格式： id·id1·id2
$("#btn_ajax_add_medicine").click(function(){
var medicine_id_data="";
var list=$(".add_medicine_Id_list");
for(var i=0;i<list.length;i++){
//直接使用js 判断复选框add_medicine_Id_lis是否被选中，选中就将该项的id添加到字符串之中并用·隔开
	if(	list[i].checked==true){
		medicine_id_data+=$(list[i]).parent().next().text();
		medicine_id_data+="·";
		
	}
}

//若无选择则不需要ajax
if(medicine_id_data==""){
$("#btn_ajax_add_medicine_information").text("请选择药品");

}
else{
//将字符串最后一个·去掉
medicine_id_data=medicine_id_data.substring(0,(medicine_id_data.length-1));
	$.ajax({
				cache:false,
				type:"POST",
				url:"<c:url value='/hospital/null_ajax_purchase_new.action'/>",
				data:{
					medicineIdStr : medicine_id_data
				},
				async:true,
				success:function(data){
				if(data=="1"){
					
					$("#btn_ajax_add_medicine_information").text("添加成功");
				
				}
				else{
				$("#btn_ajax_add_medicine_information").text("添加失败,请重新添加");
				}
					
				
				}
		
	})
}
	
});

 
 
 </script>
</html>

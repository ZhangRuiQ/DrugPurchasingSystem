<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>    
    <head>
        <title>药品集中采购系统</title>
        <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
        <!-- Bootstrap -->
        <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap-responsive.min.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/vendors/easypiechart/jquery.easy-pie-chart.css'/>" rel="stylesheet" media="screen">
        <link href="<c:url value='/bootstrap/vendors/jGrowl/jquery.jgrowl.css'/>" rel="stylesheet" media="screen">
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
      <form action="<c:url value='/healthBureau/medicine_search.action' />"  method="post" id="form">
        <table class="table table-unbordered"> 
            <tr>
                <td>
                 <div class="" id="div_name">
                    <label class="control-label" for="name">通用名 :</label>
                    <input name="medicineDto.name" type="text" id="name" onblur="input_check(0)" value="">
                 </div>
                </td>
                <td>
                 <div class="" id="div_type">
                    <label class="control-label" for="type">剂型 :</label>
                    <input name="medicineDto.type" type="text" id="type" onblur="input_check(1)" value="">
                 </div>
                </td>
                <td>
                 <div class="" id="div_standard">
                    <label class="control-label" for="standard">规格 :</label>
                    <input name="medicineDto.standard" type="text" id="standard" onblur="input_check(2)" value="">
                 </div>
                </td>
                <td>
                 <div class="" id="div_stockBlance">
                    <label class="control-label" for="stock_Balance">转换系数 :</label>
                    <input name="medicineDto.stock_Balance" type="text" id="stockBalance" onblur="input_check(3)" value="">
                 </div>
                </td>
            </tr>
            <tr>
                <td>
                 <div class="" id="div_number">
                    <label class="control-label" for="number">流水号 :</label>
                    <input name="medicineDto.number" type="text" id="number" onblur="input_check(4)" value="">
                 </div>
                </td>
                <td>
                 <div class="" id="div_manufacturer">
                    <label class="control-label" for="manufacturer">生产企业 :</label>
                    <input name="medicineDto.manufacturer.number" type="text" id="manufacturer" onblur="input_check(5)" value="">
                 </div>
                </td>
                <td>
                 <div class="" id="div_price">
                    <label class="control-label" for="price">价格 :</label>
                    <input name="medicineDto.price" type="text" id="price" onblur="input_check(6)" value="" placeholder="eg:12.0" class="tooltip-top" data-original-title="价格为整数或小数">
                 </div>
                </td>
                <td>
                   <!--  <label >价格 :</label>
                    <input name="medicineDto.price" type="text" id="price" > -->
                </td>
            </tr>
            <tr>
                <td>
	                    <label >药品类别 :</label>
                    <input type="hidden" name="" id="" value="">
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown" href="#" id="div_type"> 
                        全部
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#" id="div_type1" onclick="click_div(this.id)">固体</a></li>
                            <li><a href="#" id="div_type2" onclick="click_div(this.id)">液体</a></li>
                        </ul>
                    </div>
                </td>
                <td>
                    <label  >交易状态 :</label>  
                    <input type="hidden" name="medicineDto.status" id="medicineDto.status" value="" >
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown" href="#" id="div_status">
                        全部
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#" id="div_status1" onclick="click_div(this.id)">正常</a></li>
                            <li><a href="#" id="div_status2" onclick="click_div(this.id)">暂停交易</a></li>
                            <li><a href="#" id="div_status3" onclick="click_div(this.id)">接受预定</a></li>
                        </ul>
                    </div>
                </td>
                <td>
                    <label >质量层次 :</label>
                    <input type="hidden" name="" id="" value="">
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-success" data-toggle="dropdown" href="#" id="div_quality">
                        全部
                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#" id="div_quality1" onclick="click_div(this.id)">优秀</a></li>
                            <li><a href="#" id="div_quality2" onclick="click_div(this.id)">良好</a></li>
                        </ul>
                    </div>
                </td>
                <td> 
                   <br/>
                    <button class="btn btn-primary" type="submit">查询</button>
                </td>
            </tr>
        </table>
      </form>
      <div class="navbar navbar-inner">
            <div class="muted pull-left" >药品目录列表</div> 	
     </div>
     
     <!-- block -->
     <!-- 测试样板 -->
	   <!--   <div class="block">
	       <div class="navbar navbar-inner block-header">
	           <div class="muted pull-left">Modals & Notifications</div>
	       </div>
	       <div class="block-content collapse in">
	           <div class="span12">
				<a href="#myModal" data-toggle="modal" class="btn btn-primary">失败</a>
				<a href="#myAlert" data-toggle="modal" class="btn btn-danger">Alert</a>
				
				<div id="myModal" class="modal hide">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">&times;</button>
						<h3 class="text-error">错误提示</h3>
					</div>
					<div class="modal-body">
						<p>操作失败了，请重新再试！</p>
					</div>
				</div>
				<div id="myAlert" class="modal hide">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">&times;</button>
						<h3>Alert modal</h3>
					</div>
					<div class="modal-body">
						<p>Lorem ipsum dolor sit amet...</p>
					</div>
					<div class="modal-footer">
						<a data-dismiss="modal" class="btn btn-primary" href="#">Confirm</a>
						<a data-dismiss="modal" class="btn" href="#">Cancel</a>
					</div>
				</div>
	
				<div style="margin-top: 20px;">
					<button class="btn notification" id="notification">Notification</button><br />
					<button class="btn notification" id="notification-sticky">Sticky Notification</button><br />
					<button class="btn notification" id="notification-header">Notification With Header</button>
				</div>
	
	           </div>
	       </div>
	     </div> -->
     <!-- /block -->
     
     
	                            
     <div class="block-content collapse in">
        <div >    
            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="all" /></th>
                        <th>流水号</th>
                        <th>通用名</th>
                        <th>规格</th>
                        <th>转换系数</th>
                        <th>价格</th>
                        <th>剂型</th>
                        <th>交易状态</th>
                        <th>生产企业</th>
                        <th>药品类别</th>
                        <th>质量层次</th>
                    </tr>
                </thead>
                 <tbody id="tbody" >                  
					<s:iterator value="pageBean.list" >
						<tr class="gradeA">
							<td><input type="checkbox" /></td>
						 	<td><s:property value="number" /></td>
                        	<td><s:property value="name" /></td>
                        	<td><s:property value="standard" /></td>
                       	    <td><s:property value="stockBalance" /></td>
                        	<td><s:property value="price" /></td>
                       	 	<td><s:property value="type" /></td>
                       	    <td><s:property value="status" /></td>
                        	<td><s:property value="manufacturer.number" /></td>
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
            	<a href="<c:url value='/healthBureau/medicine_search.action?page=1' />">首页</a>
			</li>
			<!-- 上一页 --> 
            <li>
				<c:choose>
					<c:when test="${pageBean.currentPage == 1 }"><a href="javascipt:void(0)" class="previous disabled">上一页</a></c:when>
					<c:otherwise><a href="<c:url value='/healthBureau/medicine_search.action?page=${pageBean.currentPage - 1 }' />" >上一页</a></c:otherwise>
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
			   	    <li><a href="<c:url value='/healthBureau/medicine_search.action?page=${i }' /> ">${i }</a></li>
			   	  </c:otherwise>
			   </c:choose>
			 </c:forEach>
			    
			
            <!-- 下一页 -->
            <li>
          	  <c:choose>
				<c:when test="${pageBean.currentPage == pageBean.totalPage }"><a href="javascipt:void(0)" class="previous disabled">下一页</a></c:when>
				<c:otherwise><a href="<c:url value='/healthBureau/medicine_search.action?page=${pageBean.currentPage + 1 }' />">下一页</a></c:otherwise>
			  </c:choose>
            	
            </li>
            <!-- 尾页 -->
            <li>
            	<a href="<c:url value='/healthBureau/medicine_search.action?page=${pageBean.totalPage }' /> ">尾页</a>
            </li>
        </ul>
    </div>
    
    </body>
    <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/assets/scripts.js'/>"></script>
    <script src="<c:url value='/bootstrap/vendors/jGrowl/jquery.jgrowl.js'/>"></script>
    <script type="text/javascript">
		
		
		window.onload = function(){		//页面加载后立即获取所需的变量值（如下变量）
		
		//全选、全不选和反选	
		var tbody = document.getElementById("tbody");	//获取CheckBox的父元素
		
		var all = document.getElementById("all");		//获取可以进行全选的那个CheckBox
		
		var CheckBoxs = tbody.getElementsByTagName("input");		//将要被勾选的元素集合
		
		all.onclick = function(){
			
			for(i=0;i<CheckBoxs.length;i++){
				
				if( CheckBoxs[i].checked ){			//如果原来已经选上的，就会去掉；原来没有选上的，就会被选上。
					
					CheckBoxs[i].checked = false;
					
				}else{
					
					CheckBoxs[i].checked = true;
					
				}
		    };
		};
		
		//翻译药品的硬编码(转换状态硬编码)
		var tds = tbody.getElementsByTagName("td");		//td的元素集合
			
			for(var i = 7; i < tds.length; i+=11){
				
				var status = tds[i].innerHTML;
				
				switch ( status )
				{
				case "0":
					tds[i].innerHTML = "正常";
				  break;
				case "1":
					tds[i].innerHTML = "暂停交易";
				  break;
				case "2":
					tds[i].innerHTML = "接受预定";
				  break;
				}
			}
		
		};
		
		
		//搜索框的输入验证js事件
		function input_check(i){
			
			var form = document.getElementById("form");
			
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
		
		$(function() {

			$('.notification').click(function() {
				var $id = $(this).attr('id');
				switch($id) {
					case 'notification-sticky':
						$.jGrowl("Stick this!", { sticky: true });
					break;

					case 'notification-header':
						$.jGrowl("A message with a header", { header: 'Important' });
					break;

					default:
						$.jGrowl("Hello world!");
					break;
				}
			});
        });
		
		jQuery(document).ready(function() {   
			   FormValidation.init();
			});
		
		
		//下拉框的点击事件
		function click_div(id){
			
			var text = document.getElementById(id).innerHTML;		//下拉框点击了的元素的内容
			
			document.getElementById(id.substring(0,id.length-1)).innerHTML = text;	//改变下拉框显示内容为点击的选项的内容
			
			var name = "medicineDto."+id.substring(4,id.length-1);		//隐藏的input的元素的id
			
			if( "正常" == text ){
				text = 0;
			}else if( "暂停交易" == text ){
				text = 1;
			}else if( "接受预定" == text ){
				text = 2;
			}
			
			document.getElementById(name).value = text;	//将text赋值给id为“name”的值中
		}
		
		
	</script>

</html>
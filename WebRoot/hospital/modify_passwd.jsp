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
	

	
	</style>
<link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">
         <style type="text/css">
         #information,#information1,#information2{
	color: red;}
	
	#information3{
	
	color: red;
	}
	
  #modify{ margin:5% 25% 0 25%;}
  </style>
  </head>
       <body>
    <div id="modify">
   <form id="myForm" class="form-horizontal" action=""> 
   <div class="control-group">
    <label " class="control-label" ></label>
    <div class="controls col-xs-4">
      <h3 id="information3" ></h3>
       <span  class="help-inline"></span>
    </div>
    </div>
  <div class="control-group">
    <label class="control-label col-xs-2" for="inputOldPasswd">旧密码</label>
    <div class="controls col-xs-4">
      <input type="password" id="inputOldPasswd" name="oldPasswd"  placeholder="输入旧密码"/>
       <span id="information" class="help-inline"></span>
    </div>

  </div>
  <div class="control-group">
    <label class="control-label" for="inputNewPassword">新密码</label>
    <div class="controls">
      <input type="password" id="inputNewPassword" name="newPasswd" placeholder="输入新密码">
       <span class="help-inline" id="information1"></span>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputNewPasswordAgain">再次输入新密码</label>
    <div class="controls">
      <input type="password" id="inputNewPasswordAgain" name="newPasswdAgain" placeholder="再次输入新密码">
      <span class="help-inline"id="information2"></span>
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button id="btn" type="button" disabled="disabled" class="btn btn-primary btn-large">修改</button>
    </div>
  </div>
</form>
</div>

  </body>
   <script src="<c:url value='/bootstrap/vendors/jquery-1.9.1.min.js'/>"></script>
        <script src="<c:url value='/bootstrap/bootstrap/js/bootstrap.min.js'/>"></script>
       <script type="text/javascript">
       //判断新密码框是否正确
       //0为正确，1、2为no
        var ss=0;
        //当数组元素都为1的时候，按钮可用   第一个是旧密码  第二个是新密码  第三个是再次新密码
      var flag=new Array(0,0,0);
        //三个框的数据
    
        //新密码框获得焦点
        $("#inputNewPassword").focus(function(){
        	$("#information1").text("");
        
        });
        //再次输入密码框获得焦点
       $("#inputNewPasswordAgain").focus(function(){
        	$("#information2").text("");
        
        });
        //旧密码框获得焦点
       $("#inputOldPasswd").focus(function(){
        	$("#information").text("");
        
        });
        
         //旧密码框失去焦点
     
       $("#inputOldPasswd").blur(function(){
      
    	   var oldPasswd=$("#inputOldPasswd").val();
       			
       			
       			if(oldPasswd.length!=0){
       				flag[0]=1;
       				
       			
       			}
       			else{
       			
       			flag[0]=0;
       			$("#information").text("密码不为空");
       			}
       			
       		if(flag[0]==1&&flag[1]==1&&flag[2]==1){
    	   			$("#btn").removeAttr("disabled");
    	   	}
    	   	else{
    	   	 $("#btn").attr("disabled","disabled");
    	   	
    	   	}
       			
       });
       
        
        //新密码框失去焦点
        
       $("#inputNewPassword").blur(function(){
           var passwdnew=$("#inputNewPassword").val();
    	   var passwdnewAgain=$("#inputNewPasswordAgain").val();
    	   
       
       			ss=0
       			//判断是否为空
       			for(i=0;i<passwdnew.length;i++){
       			 if(passwdnew.charAt(i)==" "){ss=1;}
       			}
       			//**********
       			if(ss==1)
       				{
       				flag[1]=0;
       				$("#information1").text("密码不允许空格");
       				}
       			else if(passwdnew.length<6||passwdnew.length>13){
       				flag[1]=0;
       				$("#information1").text("密码位数为6~13");
       				ss=2;
    		   
    	   }
    	   else{
    	   	flag[1]=1;
    	   	
    	   }
    	   if(ss==0){
    	   if(passwdnewAgain==passwdnew){
       				flag[2]=1;
       				$("#information2").text("");
       				}
       				else{
       				flag[2]=0;
       				$("#information2").text("两次密码输入不一致");
       				}
    	   
    	   }
 			if(flag[0]==1&&flag[1]==1&&flag[2]==1){
    	   			$("#btn").removeAttr("disabled");
    	   		}
    	   		else{
    	   	 $("#btn").attr("disabled","disabled");
    	   	
    	   	}
       		
       });
       
       //再次输入密码框失去焦点
     
       $("#inputNewPasswordAgain").blur(function(){
           var passwdnew=$("#inputNewPassword").val();
    	   var passwdnewAgain=$("#inputNewPasswordAgain").val();
    	 
    
       			
       			if(ss==1||ss==2){
       			flag[1]=0;
       				$("#information2").text("");
       			}
    	   
       			if(ss==0){
       			
       				if(passwdnewAgain==passwdnew){
       					flag[2]=1;	
       			
       				}
       				else{
       				flag[2]=0;
       				$("#information2").text("两次密码输入不一致");
       				}
       			
       			}
       			if(flag[0]==1&&flag[1]==1&&flag[2]==1){
    	   			$("#btn").removeAttr("disabled");
    	   		}
    	   		else{
    	   	 $("#btn").attr("disabled","disabled");
    	   	
    	   	}
       		
    	   
 
       });
       
             
     
       
       
       
       
       
       $("#btn").click(function(){
         $.ajax({
                cache: false,
                type: "POST",
                url:"<c:url value='/hospital/null_modifyPasswd.action'/>",
                data:$("#myForm").serialize(),// 你的formid
                async: true,
                success: function(data) {
                if(data=="密码修改成功"){
                	alert(data);
                	window.top.location='<c:url value='/common/logout.action'/>';
                }
                else{
                	$("#information3").text(data);
                }
                    
                }
            });
       
       
       
    	 //  $("#bto").attr("disabled","disabled");
    	//   $("#myForm").submit();
       })
      
		
		
       </script>
</html>

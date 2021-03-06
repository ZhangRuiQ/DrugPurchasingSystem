<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
     <link href="<c:url value='/bootstrap/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" media="screen">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <form>
<table class="table table-bordered">
<tr>
<td>
    <label for="BeginYearInput">开始时间 :</label>
      <select name="beginYear" id="BeginYearInput" class="span2 ">
      <option value="">2016</option>
      <option value="">2017</option>
        <option value="">2018</option>
        <option value="">2019</option>
      </select>
<span>年</span>
   <select name="beginMoney" id="BeginYearInput" class="span1 ">
      <option value="">01</option>
      <option value="">02</option>
      <option value="">03</option>
      <option value="">04</option>
      <option value="">05</option>
      <option value="">06</option>
      <option value="">07</option>
      <option value="">08</option>
      <option value="">09</option>
      <option value="">10</option>
      <option value="">11</option>
      <option value="">12</option>>
      </select>
<span>月</span>
   <select name="beginDay" id="BeginYearInput" class="span1 ">
      <option value="">01</option>
      <option value="">02</option>
      <option value="">03</option>
      <option value="">04</option>
      <option value="">05</option>
      <option value="">06</option>
      <option value="">07</option>
      <option value="">08</option>
      <option value="">09</option>
      <option value="">10</option>
      <option value="">11</option>
      <option value="">12</option>
      <option value="">13</option>
      <option value="">14</option>
      <option value="">15</option>
      <option value="">16</option>
      <option value="">17</option>
      <option value="">18</option>
      <option value="">19</option>
      <option value="">20</option>
      <option value="">21</option>
      <option value="">22</option>
      <option value="">23</option>
      <option value="">24</option>
      <option value="">25</option>
      <option value="">26</option>
      <option value="">27</option>
      <option value="">28</option>
      <option value="">29</option>
      <option value="">30</option>
      <option value="">31</option>
      </select>
<span>日</span>
    </td>
<td>
    <label for="ENDYearInput">结束时间 :</label>
      <select name="endYear" id="ENDBeginYearInput" class="span2 ">
      <option value="">2016</option>
      <option value="">2017</option>
        <option value="">2018</option>
        <option value="">2019</option>
      </select>
<span>年</span>
   <select name="endMoney" id="BeginYearInput" class="span1 ">
      <option value="">01</option>
      <option value="">02</option>
      <option value="">03</option>
      <option value="">04</option>
      <option value="">05</option>
      <option value="">06</option>
      <option value="">07</option>
      <option value="">08</option>
      <option value="">09</option>
      <option value="">10</option>
      <option value="">11</option>
      <option value="">12</option>>
      </select>
<span>月</span>
   <select name="endDay" id="BeginYearInput" class="span1 ">
      <option value="">01</option>
      <option value="">02</option>
      <option value="">03</option>
      <option value="">04</option>
      <option value="">05</option>
      <option value="">06</option>
      <option value="">07</option>
      <option value="">08</option>
      <option value="">09</option>
      <option value="">10</option>
      <option value="">11</option>
      <option value="">12</option>
      <option value="">13</option>
      <option value="">14</option>
      <option value="">15</option>
      <option value="">16</option>
      <option value="">17</option>
      <option value="">18</option>
      <option value="">19</option>
      <option value="">20</option>
      <option value="">21</option>
      <option value="">22</option>
      <option value="">23</option>
      <option value="">24</option>
      <option value="">25</option>
      <option value="">26</option>
      <option value="">27</option>
      <option value="">28</option>
      <option value="">29</option>
      <option value="">30</option>
      <option value="">31</option>
      </select>
<span>日</span>
    </td>
<td>
<input type="submit" class="btn btn-primary " value="查询">

</td>
  </tr>

<tr>


      <td>
    <label for="StateInput">状态 :</label>
      <select name="State" id="StateInput">
      <option value="">全部</option>
      <option value="">已读</option>
       <option value="">未读</option>
      </select>
    </td>
         <td>
    <label for="purchasingStatusInput">时间段选择</label>
      <select name="purchasingStatus" id="purchasingStatusInput">
      <option value=""></option>
      <option value="">近一个星期</option>
        <option value="">近一年</option>
        <option value="">近三个月</option>
        <option value="">近一个月</option>
      </select>
    </td>
<td>
<button class="btn btn-primary " >导出</button>
</td>
  </tr>



  </table>
</form>
<div class="navbar navbar-inner ">
            <a class="brand" href="#">建议列表</a>
     </div>

     <table class="table table-bordered">
<thead>
  <tr>
    <th>时间</th>
    <th>建议者</th>
    <th>建议流水号</th>
    <th>主题</th>
    <th>状态</th>
  </tr>
</thead>
<tbody>

<tr>
  <td>2016/08/08 20:15</td>
  <td>root</td>
  <td>201608080001</td>
  <td>符合会计师的回复看见爱上对方空间和的回复会计师的回复框架是对话框就发货速度快解放和考试等级划分</td>
  <td>已读</td>
  <td><a href="#myModal" class="btn btn-primary" role="button" data-toggle="modal">查看详情</a></td>
</tr>

<tr>
  <td>2016/08/08 20:15</td>
  <td>root</td>
  <td>201608080002</td>
  <td>符合会计师的回复看见爱上对方空间和的回复会计师的回复框架是对话框就发货速度快解放和考试等级划分</td>
  <td>已读</td>
  <td><a href="#myModal1" class="btn btn-primary" role="button" data-toggle="modal">查看详情</a></td>
</tr>

<tr>
  <td>2016/08/08 20:15</td>
  <td>root</td>
  <td>201608080003</td>
  <td>符合会计师的回复看见爱上对方空间和的回复会计师的回复框架是对话框就发货速度快解放和考试等级划分</td>
  <td>已读</td>
  <td><a href="#myModal2" class="btn btn-primary" role="button" data-toggle="modal">查看详情</a></td>
</tr>

<tr>
  <td>2016/08/08 20:15</td>
  <td>root</td>
  <td>201608080004</td>
  <td>符合会计师的回复看见爱上对方空间和的回复会计师的回复框架是对话框就发货速度快解放和考试等级划分</td>
  <td>已读</td>
  <td><a href="#myModal3" class="btn btn-primary" role="button" data-toggle="modal">查看详情</a></td>
</tr>

<tr>
  <td>2016/08/08 20:15</td>
  <td>root</td>
  <td>201608080005</td>
  <td>符合会计师的回复看见爱上对方空间和的回复会计师的回复框架是对话框就发货速度快解放和考试等级划分</td>
  <td>已读</td>
  <td><a href="#myModal4" class="btn btn-primary" role="button" data-toggle="modal">查看详情</a></td>
</tr>

<tr>
  <td>2016/08/08 20:15</td>
  <td>root</td>
  <td>201608080006</td>
  <td>符合会计师的回复看见爱上对方空间和的回复会计师的回复框架是对话框就发货速度快解放和考试等级划分</td>
  <td>已读</td>
  <td><a href="#myModal5" class="btn btn-primary" role="button" data-toggle="modal">查看详情</a></td>
</tr>

<tr>
  <td>2016/08/08 20:15</td>
  <td>root</td>
  <td>201608080007</td>
  <td>符合会计师的回复看见爱上对方空间和的回复会计师的回复框架是对话框就发货速度快解放和考试等级划分</td>
  <td>已读</td>
  <td><a href="#myModal6" class="btn btn-primary" role="button" data-toggle="modal">查看详情</a></td>
</tr>

<tr>
  <td>2016/08/08 20:15</td>
  <td>root</td>
  <td>201608080008</td>
  <td>符合会计师的回复看见爱上对方空间和的回复会计师的回复框架是对话框就发货速度快解放和考试等级划分</td>
  <td>已读</td>
  <td><a href="#myModal7" class="btn btn-primary" role="button" data-toggle="modal">查看详情</a></td>
</tr>
</tbody>
     </table>
  <div class="pagination pagination-right">
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


<!--模态框0-->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel">流水号<small>201608080001</small></h4>
  </div>
  <div class="modal-body">
    <h5>时间：<span>2016/08/08 20：15</span></h5>
      <h5>建议者：<span>root</span></h5>
      <h5>内容：</h5>
        <p>jsdfljlskajfklasjflkajsldkfjslkfjlksjfklsjflkjslkfjslkfjlskjflksjflksjflksj设计费快乐撒娇付款了圣诞节福利卡圣诞节疯狂理解是打开了附件是打开了飞机快乐圣诞节福利开始的减肥快乐是减肥了开始减肥了开始减肥开始减肥快乐是减肥了卡机了咖啡加萨洛克离开房间卡拉是大家分开了付款啦数据库了</p>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<!--模态框1-->
<div id="myModal1" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel">流水号<small>201608080002</small></h4>
  </div>
  <div class="modal-body">
    <h5>时间：<span>2016/08/08 20：15</span></h5>
      <h5>建议者：<span>root</span></h5>
      <h5>内容：</h5>
        <p>jsdfljlskajfklasjflkajsldkfjslkfjlksjfklsjflkjslkfjslkfjlskjflksjflksjflksj设计费快乐撒娇付款了圣诞节福利卡圣诞节疯狂理解是打开了附件是打开了飞机快乐圣诞节福利开始的减肥快乐是减肥了开始减肥了开始减肥开始减肥快乐是减肥了卡机了咖啡加萨洛克离开房间卡拉是大家分开了付款啦数据库了</p>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<!--模态框2-->
<div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel">流水号<small>201608080003</small></h4>
  </div>
  <div class="modal-body">
    <h5>时间：<span>2016/08/08 20：15</span></h5>
      <h5>建议者：<span>root</span></h5>
      <h5>内容：</h5>
        <p>jsdfljlskajfklasjflkajsldkfjslkfjlksjfklsjflkjslkfjslkfjlskjflksjflksjflksj设计费快乐撒娇付款了圣诞节福利卡圣诞节疯狂理解是打开了附件是打开了飞机快乐圣诞节福利开始的减肥快乐是减肥了开始减肥了开始减肥开始减肥快乐是减肥了卡机了咖啡加萨洛克离开房间卡拉是大家分开了付款啦数据库了</p>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<!--模态框3-->
<div id="myModal3" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel">流水号<small>201608080004</small></h4>
  </div>
  <div class="modal-body">
    <h5>时间：<span>2016/08/08 20：15</span></h5>
      <h5>建议者：<span>root</span></h5>
      <h5>内容：</h5>
        <p>jsdfljlskajfklasjflkajsldkfjslkfjlksjfklsjflkjslkfjslkfjlskjflksjflksjflksj设计费快乐撒娇付款了圣诞节福利卡圣诞节疯狂理解是打开了附件是打开了飞机快乐圣诞节福利开始的减肥快乐是减肥了开始减肥了开始减肥开始减肥快乐是减肥了卡机了咖啡加萨洛克离开房间卡拉是大家分开了付款啦数据库了</p>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<!--模态框4-->
<div id="myModal4" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel">流水号<small>201608080005</small></h4>
  </div>
  <div class="modal-body">
    <h5>时间：<span>2016/08/08 20：15</span></h5>
      <h5>建议者：<span>root</span></h5>
      <h5>内容：</h5>
        <p>jsdfljlskajfklasjflkajsldkfjslkfjlksjfklsjflkjslkfjslkfjlskjflksjflksjflksj设计费快乐撒娇付款了圣诞节福利卡圣诞节疯狂理解是打开了附件是打开了飞机快乐圣诞节福利开始的减肥快乐是减肥了开始减肥了开始减肥开始减肥快乐是减肥了卡机了咖啡加萨洛克离开房间卡拉是大家分开了付款啦数据库了</p>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<!--模态框5-->
<div id="myModal5" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel">流水号<small>201608080006</small></h4>
  </div>
  <div class="modal-body">
    <h5>时间：<span>2016/08/08 20：15</span></h5>
      <h5>建议者：<span>root</span></h5>
      <h5>内容：</h5>
        <p>jsdfljlskajfklasjflkajsldkfjslkfjlksjfklsjflkjslkfjslkfjlskjflksjflksjflksj设计费快乐撒娇付款了圣诞节福利卡圣诞节疯狂理解是打开了附件是打开了飞机快乐圣诞节福利开始的减肥快乐是减肥了开始减肥了开始减肥开始减肥快乐是减肥了卡机了咖啡加萨洛克离开房间卡拉是大家分开了付款啦数据库了</p>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<!--模态框6-->
<div id="myModal6" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel">流水号<small>201608080007</small></h4>
  </div>
  <div class="modal-body">
    <h5>时间：<span>2016/08/08 20：15</span></h5>
      <h5>建议者：<span>root</span></h5>
      <h5>内容：</h5>
        <p>jsdfljlskajfklasjflkajsldkfjslkfjlksjfklsjflkjslkfjslkfjlskjflksjflksjflksj设计费快乐撒娇付款了圣诞节福利卡圣诞节疯狂理解是打开了附件是打开了飞机快乐圣诞节福利开始的减肥快乐是减肥了开始减肥了开始减肥开始减肥快乐是减肥了卡机了咖啡加萨洛克离开房间卡拉是大家分开了付款啦数据库了</p>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<!--模态框7-->
<div id="myModal7" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel">流水号<small>201608080001</small></h4>
  </div>
  <div class="modal-body">
    <h5>时间：<span>2016/08/08 20：15</span></h5>
      <h5>建议者：<span>root</span></h5>
      <h5>内容：</h5>
        <p>jsdfljlskajfklasjflkajsldkfjslkfjlksjfklsjflkjslkfjslkfjlskjflksjflksjflksj设计费快乐撒娇付款了圣诞节福利卡圣诞节疯狂理解是打开了附件是打开了飞机快乐圣诞节福利开始的减肥快乐是减肥了开始减肥了开始减肥开始减肥快乐是减肥了卡机了咖啡加萨洛克离开房间卡拉是大家分开了付款啦数据库了</p>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>





    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
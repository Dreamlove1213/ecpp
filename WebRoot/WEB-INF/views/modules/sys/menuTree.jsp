<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><%--
<html>
<head>
	<title>菜单导航</title>
	<meta name="decorator" content="blank"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".accordion-heading a").click(function(){
				$('.accordion-toggle i').removeClass('icon-chevron-down');
				$('.accordion-toggle i').addClass('icon-chevron-right');
				if(!$($(this).attr('href')).hasClass('in')){
					$(this).children('i').removeClass('icon-chevron-right');
					$(this).children('i').addClass('icon-chevron-down');
				}
			});
			$(".accordion-body a").click(function(){
				$("#menu-${param.parentId} li").removeClass("active");
				$("#menu-${param.parentId} li i").removeClass("icon-white");
				$(this).parent().addClass("active");
				$(this).children("i").addClass("icon-white");
				//loading('正在执行，请稍等...');
			});
			//$(".accordion-body a:first i").click();
			//$(".accordion-body li:first li:first a:first i").click();
		});
	</script>
</head>
<body> --%>


  <div class="accordion" id="menu-${param.parentId}">
	<c:set var="menuList" value="${fns:getMenuList()}"/>
	<c:set var="firstMenu" value="true"/>
	
	<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
	<c:if test="${menu.parent.id eq (not empty param.parentId ? param.parentId:1)&&menu.isShow eq '1'}">
	
		<div class="accordion-group">
		    <div class="accordion-heading">
		    	<!-- <i class="menu-item-icon ion-ios-pie-outline tx-20"></i> -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
		    	<%-- <a class="accordion-toggle" data-toggle="collapse" data-parent="#menu-${param.parentId}" data-href="#collapse-${menu.id}" href="#collapse-${menu.id}" title="${menu.remarks}"> --%>
		    	<a class="accordion-toggle" data-toggle="collapse" data-parent="#menu-${param.parentId}" data-href="#collapse-${menu.id}" title="${menu.remarks}" style="color:black !important;">
		    	${menu.name}</a> 
		    	<i class="icon-chevron-${not empty firstMenu && firstMenu ? 'down' : 'right'}"></i>&nbsp;</a>
		    </div>
		    <div id="collapse-${menu.id}" class="accordion-body collapse ${not empty firstMenu && firstMenu ? 'in' : ''}" style="display:block;">
				<div class="accordion-inner">
					<ul class="nav nav-list">
					<c:forEach items="${menuList}" var="menu2">
					<c:if test="${menu2.parent.id eq menu.id&&menu2.isShow eq '1'}">
						<li>
							<a data-href=".menu3-${menu2.id}" href="${fn:indexOf(menu2.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '/404'}" target="${not empty menu2.target ? menu2.target : 'mainFrame'}" ><i class="icon-${not empty menu2.icon ? menu2.icon : 'circle-arrow-right'}"></i>&nbsp;&nbsp;&nbsp;${menu2.name}</a>
							<ul class="nav nav-list hide" style="margin:0;padding-right:0;">
								<c:forEach items="${menuList}" var="menu3">
									<c:if test="${menu3.parent.id eq menu2.id&&menu3.isShow eq '1'}">
										<li class="menu3-${menu2.id} hide">
											<a href="${fn:indexOf(menu3.href, '://') eq -1 ? ctx : ''}${not empty menu3.href ? menu3.href : '/404'}" target="${not empty menu3.target ? menu3.target : 'mainFrame'}" ><i class="icon-${not empty menu3.icon ? menu3.icon : 'circle-arrow-right'}"></i>&nbsp;${menu3.name}</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
							<c:set var="firstMenu" value="false"/>
					</c:if>
					</c:forEach>
					</ul>
				</div>
		    </div>
		</div>
	</c:if>
	</c:forEach>
	</div>
	
	
<%-- 	
  	<c:set var="menuList" value="${fns:getMenuList()}"/>
	<c:set var="firstMenu" value="true"/>
	
	<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
		<c:if test="${menu.parent.id eq (not empty param.parentId ? param.parentId:1)&&menu.isShow eq '1'}">
	
		    <a href="#" class="sl-menu-link">
	            <div class="sl-menu-item">
	                <i class="menu-item-icon ion-ios-pie-outline tx-20"></i>
	                <span class="menu-item-label">${menu.name}</span>
	                <i class="menu-item-arrow fa fa-angle-down"></i>
	            </div><!-- menu-item -->
	        </a><!-- sl-menu-link -->
	        <ul class="sl-menu-sub nav flex-column">
		        <c:forEach items="${menuList}" var="menu2">
					<c:if test="${menu2.parent.id eq menu.id&&menu2.isShow eq '1'}"> 
					<li class="nav-item"><a href="chart-morris.html" class="nav-link">${menu2.name}</a></li>   
				            <li class="nav-item"><a class="nav-link" data-href=".menu3-${menu2.id}" href="${fn:indexOf(menu2.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '/404'}" target="${not empty menu2.target ? menu2.target : 'mainFrame'}">${menu2.name}</a></li>
			        </c:if>
				</c:forEach>
        	</ul>
        </c:if>
	
	</c:forEach> --%>
	
	
	<%--
</body>
</html> --%>
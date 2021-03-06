<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function Foo() 
		{ 
			
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a  onclick="javascript:Foo();return false;" href="#">信息列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="information" action="${ctx}/ecpp/information/checkInfoList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>信息标题：</label>
				<form:input path="informationtitle" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th width="50" style="text-align:center">序号</th>
				<th>归属部门/企业</th>
				<th>信息标题</th>
				<th>信息审核状态</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>删除</th>
				
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="information" varStatus="i">
			<tr>
				<td style="text-align:center">
					${i.index+1}
				</td>
				<td>
					${information.unit.name}
				</td>
				<td><a href="${ctx}/ecpp/information/informationCheck?id=${information.id}">
					${information.informationtitle}</a>
				</td>
				<td class="alignCenter">
					${fns:getDictLabel(information.status, 'ecpp_info_status', '')}
				</td>
				<td class="alignCenter">
					${information.user.name}
				</td>
				<td class="alignCenter">
					<fmt:formatDate value="${information.createDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td class="alignCenter">
					<a href="${ctx}/ecpp/information/delete?id=${information.id}&&todo=true" onclick="return confirmx('确认要删除此信息吗？', this.href)">删除</a>
				</td>
				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
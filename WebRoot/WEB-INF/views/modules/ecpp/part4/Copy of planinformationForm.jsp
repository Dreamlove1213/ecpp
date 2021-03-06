<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>目标改进项管理</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
		p.con{
			margin: 5px 0px 10px;
		}
		.changeMargin{margin-left:20px !important;}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
                    loadingTimeOut('正在保存，请稍等...',form);
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
	<style type="text/css">
		.control-label{color:black !important;}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/ecpp/planinformation/u4List">目标列表</a></li>
		<li class="active"><a href="${ctx}/ecpp/planinformation/u4Form?id=${planinformation.id}">目标改进项<shiro:hasPermission name="ecpp:planinformation:edit">${not empty planinformation.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="ecpp:planinformation:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="planinformation" action="${ctx}/ecpp/planinformation/u4Save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">目标标题：</label>
			<div class="controls">
				<p class="con">${planinformation.plantitle}</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">问题描述：</label>
			<div class="controls">
				<p class="con">${planinformation.problemdescription}</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">目标类型：</label>
			<div class="controls">
				<p class="con">${fns:getDictLabel(planinformation.plantype, 'ecpp_plan_type', '')}</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">总体目标：</label>
			<div class="controls">
				<p class="con">${planinformation.overallgoals}</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">总进度：</label>
			<div class="controls">
				<c:choose>
					<c:when test = "${empty planinformation.plannedprogress}">
						<p class="con">0%</p>
					</c:when>
					<c:otherwise>
						<p class="con">${planinformation.plannedprogress}%</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">负责人：</label>
			<div class="controls">
				<p class="con">${planinformation.planprincipal}</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">改进项：</label><br>
			<div class="controls">
				<table id="contentTable">
					<tbody id="improvementsList">
					</tbody>
				</table>
				<script type="text/template" id="improvementsTpl">//<!--
						<tr id="improvementsList{{idx}}">
							<td class="hide">
								<input id="improvementsList{{idx}}_id" name="improvementsList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="improvementsList{{idx}}_delFlag" name="improvementsList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<div class="control-group" style="border-bottom:0px;padding-bottom:0px;">
									<label class="control-label" style="width:60px;">标题：</label>
									<div class="controls" style="margin-left:60px;">
										<input id="improvementsList{{idx}}_improvedtitle" readonly name="improvementsList[{{idx}}].improvedtitle" type="text" value="{{row.improvedtitle}}" class="input-small "/>
									</div>
								</div>
							</td>
							<td>
								<div class="control-group" style="border-bottom:0px;padding-bottom:0px;">
									<label class="control-label" >权重：</label>
									<div class="controls">
										<input id="improvementsList{{idx}}_weight" readonly name="improvementsList[{{idx}}].weight" style="width:80px;" type="text" value="{{row.weight}}" class="input-small "/>%
									</div>
								</div>
							</td>
							<td>
								<div class="control-group" style="border-bottom:0px;padding-bottom:0px;">
									<label class="control-label" style="width:70px;">责任人：</label>
									<div class="controls" style="margin-left:70px;">
										<input id="improvementsList{{idx}}_principal" readonly name="improvementsList[{{idx}}].principal" style="width:80px;" type="text" value="{{row.principal}}" class="input-small "/>
									</div>
								</div>
							</td>
							<td>
								<div class="control-group" style="border-bottom:0px;padding-bottom:0px;">
									<label class="control-label" >改进项进度：</label>
									<div class="controls" >
										<div class="progress clearMar">
					  						<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: {{row.improvementprogress}}%;">
					    						{{row.improvementprogress}}%
					  					</div>
									</div>
								</div>
							</td>
							<td>
								<div class="control-group" style="border-bottom:0px;padding-bottom:0px;">
									<label class="control-label" style="padding-top:0px;">完成时间：</label>
									<div class="controls" style="width:100px;">
										{{row.finishtime}}
									</div>
								</div>
							</td>
						</tr>
						<tr id="improvementsListText{{idx}}">
							<td style="text-align:right;">改进项内容：</td>
							<td colspan="4">
								<textarea id="improvementsList{{idx}}_content" readonly name="improvementsList[{{idx}}].content" rows="5" style="width:98%;margin-bottom:18px;" cols="1000" maxlength="50000">{{row.content}}</textarea>
							</td>
						</tr>
						<tr id="improvementsListText{{idx}}">
							<td style="text-align:right;">定期记录改进措施实施情况：</td>
							<td colspan="4">
								<textarea id="improvementsList{{idx}}_content" readonly name="improvementsList[{{idx}}].content" rows="5" style="width:98%;margin-bottom:18px;" cols="1000" maxlength="50000">{{row.content}}</textarea>
							</td>
						</tr>
						<tr id="improvementsListText{{idx}}">
							<td style="text-align:right;">1阶段措施实施情况小结：</td>
							<td colspan="4">
								<textarea id="improvementsList{{idx}}_content" readonly name="improvementsList[{{idx}}].content" rows="5" style="width:98%;margin-bottom:18px;" cols="1000" maxlength="50000">{{row.content}}</textarea>
							</td>
						</tr>
						<tr id="improvementsListText{{idx}}">
							<td style="text-align:right;">2阶段措施实施情况小结：</td>
							<td colspan="4">
								<textarea id="improvementsList{{idx}}_content" readonly name="improvementsList[{{idx}}].content" rows="5" style="width:98%;margin-bottom:18px;" cols="1000" maxlength="50000">{{row.content}}</textarea>
							</td>
						</tr>
						<tr id="improvementsListText{{idx}}" style="border-top:1px solid #e2e2e2 !important;margin-bottom:20px !important;height:15px;">
							<td colspan="5">
							</td>
						</tr>
						//-->
					</script>
				<script type="text/javascript">
					var improvementsRowIdx = 0, improvementsTpl = $("#improvementsTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
					$(document).ready(function() {
						var data = ${fns:toJson(planinformation.improvementsList)};
						for (var i=0; i<data.length; i++){
							addRow('#improvementsList', improvementsRowIdx, improvementsTpl, data[i]);
							improvementsRowIdx = improvementsRowIdx + 1;
						}
					});
				</script>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<p class="con">${planinformation.remarks}</p>
			</div>
		</div>
			<div class="control-group">
			<label class="control-label">得分：</label>
			<div class="controls">
				<form:input path="selfevaluationscore" htmlEscape="false" rows="4" cols="300" maxlength="2048" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">自我评价：</label>
			<%-- <div class="controls">
				<form:textarea path="selfevaluation" htmlEscape="false" rows="4" cols="300" maxlength="2048" class="input-xxlarge "/>
			</div> --%>
			<div class="controls changeMargin">
				<form:hidden id="selfevaluation" path="selfevaluation" htmlEscape="false" maxlength="200" class="input-xlarge"/>
				<sys:ckfinder input="selfevaluation" type="files" uploadPath="/ecpp/planinformation" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="ecpp:planinformation:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>在线人员名单</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="showIndex.do">人名列表</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<form action="insertPeople.do" method="POST"
						class="navbar-form navbar-left">
						<div class="form-group">
							<input type="text" name="peopleName" class="form-control"
								placeholder="请输入人名"> <input type="text" name="peopleSex"
								class="form-control" placeholder="请输入性别"> <input
								type="number" name="peopleAge" class="form-control"
								placeholder="请输入年龄">
						</div>
						<button type="submit" class="btn btn-default">新增</button>
					</form>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<c:if test="${result =='SUCCESS' }">
			<div class="alert alert-success" role="alert">提示：操作成功</div>
		</c:if>
		<c:if test="${result=='ERROR' }">
			<div class="alert alert-danger" role="alert">警告：操作失败</div>
		</c:if>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th> </th>
							<th>ID</th>
							<th>NAME</th>
							<th>SEX</th>
							<th>AGE</th>
							<th>操作</th>
						</tr>
					</thead>
				
					<tbody>
						<c:forEach items="${peoples }" var="p">
						<tr>
							<td><input type="checkbox" id="subcheck" name="subcheck" value="${p.peoplesId }"></td>
							<td>${p.peoplesId}</td>
							<td>${p.peoplesName }</td>
							<td>${p.peoplesSex }</td>
							<td>${p.peoplesAge }</td>
							<td><a href="removePeople.do?peoplesId=${p.peoplesId }"><span class="glyphicon glyphicon-remove"></span>删除</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" onclick="batchRemoves()">删除</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function batchRemoves() {
		var checkedNum = $("input[name='subcheck']:checked").length;
		if(checkedNum==0) {
			alert("请至少选择一项");
			return false;
		}
		if(confirm("确定删除？")) {
			var checkedList = new Array();
			$("input[name='subcheck']:checked").each(function(){
				checkedList.push($(this).val());
			});
		$.ajax({
			url:'batchRemoves.ajax',
			type:'POST',
			data:{
				"delitems":checkedList.toString()
			},
			dataType:'html',
			success:function(res){
				 location.reload();
			},
			error:function(){
				art.dialog.tips('删除失败!');
			}
		});
		}
	}
</script>
</html>
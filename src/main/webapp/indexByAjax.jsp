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
					<button type="button" onclick="show()">人名列表</button>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<div class="form-group">
							<input type="text" id="peopleName" class="form-control" placeholder="请输入人名"> 
							<input type="text" id="peopleSex" class="form-control" placeholder="请输入性别">
							<input type="number" id="peopleAge" class="form-control" placeholder="请输入年龄">
						</div>
						<button type="button" class="btn btn-default" onclick="f()">新增</button>
				</div>
				
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>SEX</th>
							<th>AGE</th>
							<th>操作</th>
						</tr>
					</thead>
				
					<tbody id="ss">
					</tbody>
					
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	function f() {
		$(function() {
			show();
		})
		var peopleName = $("#peopleName").val();
		var peopleSex = $("#peopleSex").val();
		var peopleAge = $("#peopleAge").val();
		$.ajax({
			url:'insertPeopleByAjax.ajax',
			type:'post',
			dataType:'text',
			data:{
				peopleName:peopleName,
				peopleSex:peopleSex,
				peopleAge:peopleAge
			},
			success:function(res){
				if(res=="SUCCESS"){
					show();
				}
			},
			error:function(){
				alert("添加失败");
			}
			
		})
		function show(){
			$.ajax({
				url:'showIndexByAjax.ajax',
				type:'post',
				dataType:'text',
				data:{},
				success:function(res){
					$("#ss").html("");
					var json = eval("("+res+")");
					for(var i=0;i<json.length;i++){
						$("#ss").append("<tr><td>"+json[i].peoplesId+"</td><td>"+json[i].peoplesName+"</td><td>"+json[i].peoplesSex+"</td><td>"+json[i].peoplesAge+"</td><td><a href='removePeople.do?peoplesId="+json[i].peoplesId+"'><span class='glyphicon glyphicon-remove'></span>删除</a></td></tr>");
					}
				},
				error:function(){
					
				}
			})
		}
	}
</script>
</html>
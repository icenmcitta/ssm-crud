<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>员工列表</title>
		<%
			pageContext.setAttribute("APP_PATH", request.getContextPath());
		%>
		<!-- Bootstrap -->
		<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<!-- 员工修改的模态框 -->
		<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">员工修改</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
								<div class="col-sm-10">
									<p class="form-control-static" id="empName_update_static"></p>
								</div>
							</div>
							<div class="form-group">
								<label for="email_add_input" class="col-sm-2 control-label">电子邮箱</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="email" id="email_update_input" placeholder="email@qq.com">
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<label class="radio-inline">
										<input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">男
									</label>
									<label class="radio-inline">
										<input type="radio" name="gender" id="gender2_update_input" value="W">女
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">部门名称</label>
								<div class="col-sm-4">
									<select class="form-control" name="dId" id="dept_update_select"></select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 员工添加的模态框 -->
		<div class="modal fade" id=empAddModal tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">员工添加</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
								<div class="col-sm-10">
									<input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
									<span id="helpBlock2" class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="email_add_input" class="col-sm-2 control-label">电子邮箱</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" name="email" id="email_add_input" placeholder="email@qq.com">
									<span class="help-block"></span>
									<span id="helpBlock2" class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<label class="radio-inline">
										<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">男
									</label>
									<label class="radio-inline">
										<input type="radio" name="gender" id="gender2_add_input" value="W">女
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">部门名称</label>
								<div class="col-sm-4">
									<select class="form-control" name="dId" id="dept_add_select"></select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 搭建页面 -->
		<div class="container">
			<!-- 标题 -->
			<div class="row">
				<div class="col-md-12">
					<h1>企业人事管理系统</h1>
				</div>
			</div>
			<!-- 按钮 -->
			<div class="row">
				<div class="col-md-4 col-md-offset-8">
					<button id="emp_add_modal_btn" class="btn btn-primary">添加</button>
					<button id="emp_delete_all_btn" class="btn btn-danger">删除</button>
				</div>
			</div>
			<!-- 显示表格数据 -->
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="emps-table">
						<thead>
							<tr>
								<th><input type="checkbox" id="check_all"></th>
								<th>员工ID</th>
								<th>员工姓名</th>
								<th>性别</th>
								<th>电子邮箱</th>
								<th>部门名称</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 显示分页信息 -->
			<div class="row">
				<!-- 分页文字信息 -->
				<div class="col-md-6" id="page-info-area"></div>
				<!-- 分页条信息 -->
				<div class="col-md-6" id="page_nav_area"></div>
			</div>
		</div>
		<!--引入jquery-->
		<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
		<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			var totalRecord, currentPage;
			//页面加载完成以后，直接发送ajax请求，要到分页数据
			$(function() {
				to_page(1);
			})

			function to_page(pageNumber) {
				$.ajax({
					url: "${APP_PATH}/emps/",
					data: "pageNumber=" + pageNumber,
					type: "GET",
					success: function(result) {
						//console.log(result);
						//解析并显示员工数据
						bulid_emps_table(result);
						//解析并显示分页信息
						bulid_page_info(result);
						//解析并显示分页条数据
						bulid_page_nav(result);
					}
				});
			}

			function bulid_emps_table(result) {
				//先清空数据
				$("#emps-table tbody").empty();
				var emps = result.extend.pageInfo.list;
				//遍历数据
				$.each(emps, function(index, item) {
					var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item'/>");
					var empIdTd = $("<td></td>").append(item.empId);
					var empNameTd = $("<td></td>").append(item.empName);
					var empGenderTd = $("<td></td>").append(item.gender == "M" ? '男' : "女");
					var empEmailTd = $("<td></td>").append(item.email);
					var deptNameTd = $("<td></td>").append(item.department.deptName);
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
					//为编辑按钮添加一个自定义的属性，来表示当前员工id
					editBtn.attr("edit_id", item.empId);
					var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
					//为删除按钮添加属性表示id
					delBtn.attr("del_id", item.empId);
					var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
					//append方法执行完成后还是返回原来的元素
					$("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(empGenderTd).append(empEmailTd).append(deptNameTd).append(btnTd)
							.appendTo("#emps-table tbody");
				})
			}

			function bulid_page_info(result) {
				$("#page-info-area").empty();
				$("#page-info-area").append("第" + result.extend.pageInfo.pageNum + "页/共" + result.extend.pageInfo.pages + "页；共" + result.extend.pageInfo.total + "条记录");
				totalRecord = result.extend.pageInfo.total;
				//更新员工信息后，需返回显示当前页
				currentPage = result.extend.pageInfo.pageNum;
			}

			function bulid_page_nav(result) {
				$("#page_nav_area").empty();
				var ul = $("<ul></ul>").addClass("pagination");
				//构建元素
				var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
				var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
				if (result.extend.pageInfo.hasPreviousPage == false) {
					firstPageLi.addClass("disabled");
					prePageLi.addClass("disabled");
				} else {//为元素添加翻页事件
					firstPageLi.click(function() {
						to_page(1);
					});
					prePageLi.click(function() {
						to_page(result.extend.pageInfo.pageNum - 1);
					});
				}
				var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
				var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
				if (!result.extend.pageInfo.hasNextPage) {
					nextPageLi.addClass("disabled");
					lastPageLi.addClass("disabled");
				} else {
					nextPageLi.click(function() {
						to_page(result.extend.pageInfo.pageNum + 1);
					});
					lastPageLi.click(function() {
						to_page(result.extend.pageInfo.pages);
					});
				}
				//添加首页和前一页的提示
				ul.append(firstPageLi).append(prePageLi);
				//遍历给ul中添加页码提示
				$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {
					var numLi = $("<li></li>").append($("<a></a>").append(item));
					if (result.extend.pageInfo.pageNum == item) {
						numLi.addClass("active");
					}
					numLi.click(function() {
						to_page(item);
					});
					ul.append(numLi);
				});
				//添加下一页和尾页的提示
				ul.append(nextPageLi).append(lastPageLi);
				//把ul加入到nav
				var navEle = $("<nav></nav>").append(ul);
				navEle.appendTo("#page_nav_area");
			}

			//清空表单内容及样式
			function reset_form(ele) {
				//清空表单内容
				$(ele)[0].reset();
				//清空表单样式
				$(ele).find("*").removeClass("has-error has-success");
				$(ele).find(".help-block").text("");
			}

			//点击新增按钮弹出模态框
			$("#emp_add_modal_btn").click(function() {
				//清除表单数据（表单完整重置：表单数据、表单样式）
				//$("#empAddModal form")[0].reset();
				reset_form("#empAddModal form");
				//发送ajax请求，查出部门信息，显示在下拉列表中
				getDepts("#empAddModal select");
				//弹出模态框
				$("#empAddModal").modal({
					backdrop: "static"
				});
			});
			//查出所有部门信息，显示在下拉列表中
			function getDepts(selectName) {
				$.ajax({
					url: "${APP_PATH}/depts",
					type: "GET",
					success: function(result) {
						$(selectName).empty();
						//显示部门信息在下拉列表中
						$.each(result.extend.depts, function() {
							var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
							optionEle.appendTo(selectName);
						});
					}
				});
			}

			$(document).on("click", ".edit_btn", function() {
				//查出部门信息，显示部门列表
				getDepts("#empUpdateModal select");
				//查出员工信息，显示员工信息
				getEmp($(this).attr("edit_id"));
				//把员工的id传递给模态框的更新按钮
				$("#empUpdateModal").modal({
					backdrop: "static"
				});
			})

			function getEmp(id) {
				$.ajax({
					url: "${APP_PATH}/emp/" + id,
					type: "GET",
					success: function(result) {
						//console.log(result);
						var empData = result.extend.emp;
						$("#empName_update_static").text(empData.empName);
						$("#email_update_input").val(empData.email);
						$("#empUpdateModal input[name=empGender]").val([empData.gender]);
						$("#empUpdateModal select").val([empData.dId]);
					}
				})
			}

			//显示校验结果的提示信息
			function show_validate_msg(ele, status, msg) {
				//首先清空当前元素的校验状态
				$(ele).parent().removeClass("has-success has-error");
				$(ele).next("span").text("");
				if ("success" == status) {
					$(ele).parent().addClass("has-success");
				} else if ("error" == status) {
					$(ele).parent().addClass("has-error");
				}
				$(ele).next("span").text(msg);
			}

			//校验表单数据
			function validate_add_form() {
				//拿到要校验的数据，使用正则表达式
				var empName = $("#empName_add_input").val();
				var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
				if (!regName.test(empName)) {
					show_validate_msg("#empName_add_input", "error", "用户名必须是6-16位字母和数字的组合或2-5位中文");
					return false;
				}
				//校验邮箱信息
				var empEmail = $("#email_add_input").val();
				var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				if (!regEmail.test(empEmail)) {
					show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
					return false;
				} else {
					show_validate_msg("#email_add_input", "success", "");
				}
				return true;
			}

			//校验用户名是否可用
			$("#empName_add_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var empName = this.value;
					$.ajax({
						url: "${APP_PATH}/checkuser/",
						data: "empName=" + empName,
						type: "POST",
						success: function(result) {
							if (result.code == 100) {
								show_validate_msg("#empName_add_input", "success", "用户名可用");
								$("#emp_save_btn").attr("ajax-va", "success");
							} else {
								show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
								$("#emp_save_btn").attr("ajax-va", "error");
							}
						}
					})
				});

			//点击保存，保存员工
			$("#emp_save_btn").click(function() {
				if (!validate_add_form()) {
					return false;
				}
				//判断之前的ajax用户名校验是否成功
				if ($(this).attr("ajax-va") == "error") {
					// console.log("用户名判断校验错误");
					return false;
				}
				//alert($("#empAddModal form").serialize());
				//console.log($("#empAddModal form").serialize());
				$.ajax({
					url: "${APP_PATH}/emp/",
					type: "POST",
					data: $("#empAddModal form").serialize(),
					success: function(result) {
						if (result.code == 100) {
							//员工保存成功
							//关闭模态框
							$("#empAddModal").modal('hide');
							//来到最后一页，显示刚才保存的数据
							//发送ajax请求显示最后一页数据即可
							//to_page(9999);
							to_page(totalRecord);
						} else {
							// 显示失败信息
							//console.log(result);
							if (undefined != result.extend.errorFields.email) {
								//显示邮箱的错误信息
								show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
							}
							if (undefined != result.extend.errorFields.empName) {
								//显示员工姓名的错误信息
								show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
							}
						}
					}
				});
			})

			$(document).on("click", ".edit_btn", function() {
				// alert("edit");
				//查出部门信息，显示部门列表
				getDepts("#empUpdateModal select");
				//查出员工信息，显示员工信息
				getEmp($(this).attr("edit_id"));
				//把员工的id传递给模态框的更新按钮
				$("#emp_update_btn").attr("edit_id", $(this).attr("edit_id"));
				$("#empUpdateModal").modal({
					backdrop: "static"
				});
			});

			function getEmp(id) {
				$.ajax({
					url: "${APP_PATH}/emp/" + id,
					type: "GET",
					success: function(result) {
						//console.log(result);
						var empData = result.extend.emp;
						$("#empName_update_static").text(empData.empName);
						$("#email_update_input").val(empData.email);
						$("#empUpdateModal input[name=empGender]").val([empData.gender]);
						$("#empUpdateModal select").val([empData.dId]);
					}
				});
			}

			//点击更新，更新员工信息
			$("#emp_update_btn").click(function() {
				//验证邮箱是否合法
				var empEmail = $("#email_update_input").val();
				var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
				if (!regEmail.test(empEmail)) {
					show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
					return false;
				} else {
					show_validate_msg("#email_update_input", "success", "");
				}
				//发送ajax请求，保存更新员工信息
				$.ajax({
					url: "${APP_PATH}/emp/" + $(this).attr("edit_id"),
					type: "POST",
					data: $("#empUpdateModal form").serialize() + "&_method=PUT",
					success: function() {
						// alert(result.msg);
						$("#empUpdateModal").modal("hide");
						to_page(currentPage);
					}
				});
			});

			//单个删除
			$(document).on("click", ".delete_btn", function() {
				//弹出确认删除对话框
				var empName = $(this).parents("tr").find("td:eq(2)").text();
				var empId = $(this).attr("del_id");
				if (confirm("确认删除【" + empName + "】吗？")) {
					//发送ajax请求删除
					$.ajax({
						url: "${APP_PATH}/emp/" + empId,
						type: "DELETE",
						success: function(result) {
							alert(result.msg);
							//回到本页
							to_page(currentPage);
						}
					});
				}
			});

			//完成全选/全不选功能
			$("#check_all").click(function() {
				var is_All_Check = $(this).prop("checked");
				$(".check_item").prop("checked", is_All_Check);
			});

			//check_item，复选框选择操作
			$(document).on("click", ".check_item", function() {
				//判断当前选择中的元素是否选满
				var flag = $(".check_item:checked").length == $(".check_item").length;
				$("#check_all").prop("checked", flag);
			});

			//点击全部删除，就批量删除
			$("#emp_delete_all_btn").click(function() {
				var empNames = "";
				var del_idstr = "";
				$.each($(".check_item:checked"), function() {
					//组装员工字符串
					empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
					//组织员工id字符串
					del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
				});
				//去除员工姓名多余的","
				empNames = empNames.substring(0, empNames.length - 1);
				//去除员工id多余的"-"
				del_idstr = del_idstr.substring(0, del_idstr.length - 1);
				if (confirm("确认删除【" + empNames + "】吗？")) {
					//发送ajax请求
					$.ajax({
						url: "${APP_PATH}/emp/" + del_idstr,
						type: "DELETE",
						success: function(result) {
							alert(result.msg);
							//回到当前页面
							to_page(currentPage);
							$("#check_all").prop("checked", false);
						}
					})

				}
			});
		</script>
	</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>My Login Page &mdash; Bootstrap 4 Login Page Snippet</title>
	<link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/css/my-login.css">
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center align-items-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="/img/logo.jpg" alt="bootstrap 4 login page">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">忘记密码</h4>
							<form id="forgetForm" method="POST" class="my-login-validation" novalidate="" onclick="forget()">
								<div class="form-group">
									<label for="username">用户名</label>
									<input id="username" type="text" class="form-control" name="username" value="" required autofocus>
									<div class="invalid-feedback">
										用户名不合法！
									</div>
									<div class="form-text text-muted">
										请点击重置密码按钮，我们会跳转重置密码网页。
									</div>
								</div>

								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										重置密码
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2020 &mdash; CJLU
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 提示框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body" id="message"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>

	<script src="/js/jquery/jquery-3.3.1.min.js"></script>
	<script src="/js/my-login.js"></script>
</body>
</html>
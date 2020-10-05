
$(function() {

	//为空检查
	$("input[type='password'][data-eye]").each(function(i) {
		let $this = $(this),
			id = 'eye-password-' + i,
			el = $('#' + id);

		$this.wrap($("<div/>", {
			style: 'position:relative',
			id: id
		}));

		$this.css({
			paddingRight: 60
		});
		$this.after($("<div/>", {
			html: '显示',
			class: 'btn btn-primary btn-sm',
			id: 'passeye-toggle-'+i,
		}).css({
				position: 'absolute',
				right: 10,
				top: ($this.outerHeight() / 2) - 12,
				padding: '2px 7px',
				fontSize: 12,
				cursor: 'pointer',
		}));

		$this.after($("<input/>", {
			type: 'hidden',
			id: 'passeye-' + i
		}));

		let invalid_feedback = $this.parent().parent().find('.invalid-feedback');

		if(invalid_feedback.length) {
			$this.after(invalid_feedback.clone());
		}

		$this.on("keyup paste", function() {
			$("#passeye-"+i).val($(this).val());
		});
		$("#passeye-toggle-"+i).on("click", function() {
			if($this.hasClass("show")) {
				$this.attr('type', 'password');
				$this.removeClass("show");
				$(this).removeClass("btn-outline-primary");
			}else{
				$this.attr('type', 'text');
				$this.val($("#passeye-"+i).val());				
				$this.addClass("show");
				$(this).addClass("btn-outline-primary");
			}
		});
	});

	//登录表单提交事件
	$(".my-login-validation").submit(function() {
		let form = $(this);
		event.preventDefault();
		if (form[0].checkValidity() === false) {
          event.stopPropagation();
        }else{
			loginM();
		}
		form.addClass('was-validated');
	});

	//注册表单提交事件
	$(".my-register-validation").submit(function() {
		let form = $(this);
		event.preventDefault();
		if (form[0].checkValidity() === false) {
			event.stopPropagation();
		}else{
			register();
		}
		form.addClass('was-validated');
	});

	//忘记密码表单提交事件
	$(".my-forget-validation").submit(function() {
		let form = $(this);
		event.preventDefault();
		if (form[0].checkValidity() === false) {
			event.stopPropagation();
		}else{
			forget();
		}
		form.addClass('was-validated');
	});

	//密码重置表单提交事件
	$(".my-reset-validation").submit(function() {
		let form = $(this);
		event.preventDefault();
		if (form[0].checkValidity() === false) {
			event.stopPropagation();
		}else{
			reset();
		}
		form.addClass('was-validated');
	});

});

//登录表单提交方法
function loginM(){
	let fields = $("#loginForm").serializeArray();
	let obj = {};
	$.each(fields, function(index, field) {
		obj[field.name] = field.value;
	})
	$.ajax({
		type: "post",
		url: "/user/login",
		contentType: "application/json;charset=UTF-8",
		data: JSON.stringify(obj),
		datatype: "json",
		success:function (data){
			$("#message").append(this.data).modal();
		}
	})
}

//注册表单提交方法
function register(){
	let fields = $("#registerForm").serializeArray();
	let obj = {};
	$.each(fields, function(index, field) {
		obj[field.name] = field.value;
	})
	$.ajax({
		type: "post",
		url: "/user/register",
		contentType: "application/json;charset=UTF-8",
		data: JSON.stringify(obj),
		datatype: "json",
		success:function (data){
			$("#message").append(this.data).modal();
		}
	})
}

//忘记密码表单提交方法
function forget(){
	let fields = $("#forgetForm").serializeArray();
	let obj = {};
	$.each(fields, function(index, field) {
		obj[field.name] = field.value;
	})
	$.ajax({
		type: "post",
		url: "/user/forget",
		contentType: "application/json;charset=UTF-8",
		data: JSON.stringify(obj),
		datatype: "json",
		success:function (data){
			$("#message").append(this.data).modal();
		}
	})
}

//重置密码表单提交方法
function reset(){
	let fields = $("#resetForm").serializeArray();
	let obj = {};
	$.each(fields, function(index, field) {
		obj[field.name] = field.value;
	})
	$.ajax({
		type: "post",
		url: "/user/reset",
		contentType: "application/json;charset=UTF-8",
		data: JSON.stringify(obj),
		datatype: "json",
		success:function (data){
			$("#message").append(this.data).modal();
		}
	})
}
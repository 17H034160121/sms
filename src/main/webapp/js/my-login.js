
$(function() {

	//为空检查
	$("input[type='password'][data-eye]").each(function(i) {
		var $this = $(this),
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
			html: 'Show',
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

		var invalid_feedback = $this.parent().parent().find('.invalid-feedback');

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
		var form = $(this);
        if (form[0].checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
		form.addClass('was-validated');
	});

});

//登录表单提交方法
function loginM(){
	event.preventDefault();
	$.ajax({
		type: "post",
		url: "/user/login",
		contentType: "application/json;charse=UTF-8",
		data: $('#loginForm').serializeArray(),
		success:function (data){

		}
	})
}

//注册表单提交方法
function register(){
	event.preventDefault();
	$.ajax({
		type: "post",
		url: "/user/register",
		contentType: "application/json;charse=UTF-8",
		data: $('#registerForm').serializeArray(),
		success:function (data){

		}
	})
}

//忘记密码表单提交方法
function forget(){
	event.preventDefault();
	$.ajax({
		type: "post",
		url: "/user/forget",
		contentType: "application/json;charse=UTF-8",
		data: $('#forgetForm').serializeArray(),
		success:function (data){

		}
	})
}

//重置密码表单提交方法
function reset(){
	event.preventDefault();
	$.ajax({
		type: "post",
		url: "/user/reset",
		contentType: "application/json;charse=UTF-8",
		data: $('#resetForm').serializeArray(),
		success:function (data){

		}
	})
}
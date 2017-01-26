$(function() {
	$("#validImg").click(function() {
		this.src = this.src.replace(/\?r=.*$/, '') + "?r=" + Math.random();
	});
	var uName = $("#logname");
	var uPswd = $("#password");
	uName.focus(function() {
		if (this.value == '用户名')
			this.value = '';
	});
	uPswd.focus(function() {
		if (this.value == '输入密码')
			this.value = '';
	});
	$("#validator").focus(function() {
		if (this.value == '请输入验证码')
			this.value = '';
	}).keydown(function(event) {
		var kc = event.keyCode || event.which;
		if (kc == 13) {
			$("#btnLogin").click();
		}
	});
	var loginFrm = $("#loginFrm");
	var chk = function() {
		var ret = true;
		$("#logname,#password").each(
				function() {
					if ($.trim(this.value) == '' || this.value == '用户名'
							|| this.value == '输入密码') {
						$(this).css("border-color", "red").focus();
						ret = false;
						return false;
					} else {
						$(this).css("border-color", "#ccc");
					}
				});
		return ret;
	};
	$("#btnLogin").click(function() {
		//if (chk()) {
			loginFrm.submit();
		// }
	});
	$("A[mid]").css("cursor", "pointer").hover(function(event) {
		this.className = "on";
	}, function(event) {
		if (this.getAttribute("mid") != mid)
			this.className = "";
	});
	if (mid == '')
		mid = 'index';
	$("A[mid='" + mid + "']").addClass("on");
});

function setCookie(name, value) {
	var todayDate = new Date();
	document.cookie = name + "=" + escape(value) + ";expires=-1;";
	alert(document.cookie);
}

function getCookie(Name) {
	var search = Name + "=";
	if (document.cookie.length > 0) {
		offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1)
				end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		}
	}
}

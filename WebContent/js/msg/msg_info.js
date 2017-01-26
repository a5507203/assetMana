$(function() {
	var frm = document.frmNew;
	$(frm).submit(function() {
		return false;
	});
	$("#miSubmit_up,#miSubmit_down").click(function() {
		if ($.trim($("input[name='title']").val()) == '') {
			alert("请填写消息标题");
			return false;
		}
		if ($.trim($("textarea[name='body']").val()) == '') {
			alert("请填写消息内容");
			return false;
		}
		var mbIds = '';
		var rs = $("#rightList option");
		$.each(rs, function(i, op) {
			mbIds += (op.value + ',');
		});
		if (mbIds == '') {
			alert('请选择消息接收人');
			return false;
		}
		frm.toMbids.value = mbIds;
		frm.submit();
	});
});

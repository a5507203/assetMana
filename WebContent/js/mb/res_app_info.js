$(function() {
	var frm = document.frmNew;
	$(frm).submit(function() {
		return false;
	});
	$("#ckAll").click(function() {
		var cked = this.checked;
		$(":checkbox[name='resIds']").each(function() {
			this.checked = cked;
		});
	});
	$("#miSubmit").click(function() {
		if ($(":checked[name='resIds']").length) {
			var inp;
			if ($(":checked[restp='1']").length > 1) {
				alert('只能选择一个车辆');
				return false;
			}
			$(":input[name='orderNums']").each(function() {
				if (!isNumber(this.value) || parseInt(this.value) == 0) {
					inp = this;
					return false;
				}
			});
			if (typeof inp != 'undefined') {
				alert('申请数目填写不对');
				inp.focus();
				return false;
			}
			frm.submit();
		} else {
			alert('请选择资源');
			return false;
		}
	});

	$("#theLink_next").click(function() {

		if ($(":checked[name='resIds']").length) {
			var inp;
			if ($(":checked[restp='1']").length > 1) {
				alert('只能选择一个车辆');
				return false;
			}
			$(":input[name='orderNums']").each(function() {
				if (!isNumber(this.value) || parseInt(this.value) == 0) {
					inp = this;
					return false;
				}
			});
			if (typeof inp != 'undefined') {
				alert('申请数目填写不对');
				inp.focus();
				return false;
			}
			frm.submit();
		} else {
			alert('请选择资源');
			return false;
		}
	});

	$("#theLink_next2").click(function() {
		frm.submit();
	});

});

function reconfirm(count, maxCount) {

	var frm = document.frmNew;
	var nCur = $(":checked[name='resIds']").length;

	if (nCur < count || nCur > maxCount) {
		var msg = "您申请了" + nCur + "件展品,本车辆类型要求至少申请" + count + "件展品,至多"
				+ maxCount + "件展品";
		alert(msg);
		return false;
	}
	frm.submit();
}

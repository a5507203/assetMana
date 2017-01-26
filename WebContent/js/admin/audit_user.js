$(function(){
   var frm = document.frmNew; 
   $(frm).submit(function(){return false;});
   $("#branchList").click(function(){
	   window.open(ctx+"admin/branchList.form");
   });
   $("#batchList").click(function(){
	   window.open(ctx+"admin/batchList.form");
   });
   $("#addUser").click(function(){
	   window.location=ctx+'admin/register.form';
   });
   $("A[did]").click(function(){
	   var mbId = this.getAttribute('did');
	   frm.mbId.value=mbId;
	   frm.action=ctx+"admin/deleteMb.form";
	   frm.submit();
   });
   $("A[rsid]").click(function(){
	   var pwd = window.prompt("请输入密码","");
	   var mbId = this.getAttribute('rsid');
	   if(pwd && pwd!=''){
		   $.ajax({
			   type:'POST',
			   dataType:'json',
			   url:ctx + 'admin/resetPswd.form',
			   data:{'pswd':pwd,'mbId':mbId},
			   success:function(data){
				   alert('修改成功');
			   }
		   });
	   }
   });
});
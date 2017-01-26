$(function(){
   if(stu)
	   $("#login_in_stu").show();
   if(teach)
	   $("#login_in_teach").show();
   if(stu || teach){
	   $("#login_out").hide();
	   $(".linkus").css("height","90px");
	   $("#username").val(name);
   }
   $("#pg1,#pg2").mouseover(function(){
      var seq = parseInt(this.getAttribute("id").substr(2),10);
      this.className = "selected1";
      $("#tch" + seq).removeClass("unblock").addClass("block");
      $("#pg" + (3 - seq)).removeClass("selected1").addClass("noselected1");
      $("#tch" + (3 - seq)).removeClass("block").addClass("unblock");
   });
   $("#validImg").click(function(){
	   this.src = this.src.replace(/\?r=.*$/,'') +"?r="+ Math.random();
   });
   var uName = $("#username");
   var uPswd = $("#password");
   uName.focus(function(){
	   if(this.value == '用户名')
		   this.value = '';
   });
   $("#validator").focus(function(){
	   if(this.value == '请输入验证码')
		   this.value = '';
   });
   var loginFrm = $("#loginFrm"); 
   var chk = function(){
	   var ret = true;
	   $("#username,#password").each(function(){
		   if($.trim(this.value) == ''){
			   $(this).css("border-color","red").focus();
			   ret = false;
			   return false;
		   }else{
			   $(this).css("border-color","#ccc");			   
		   }
	   });
	   return ret;
   };
   $("#stuLogin").click(function(){
	   if(chk()){
		   loginFrm.get(0).memberTp.value = '1';
		   loginFrm.submit();
	   }
   });
   $("#teachFrm").click(function(){
	   if(chk()){
		   loginFrm.get(0).memberTp.value = '2';
		   loginFrm.submit();
	   }
   });
});

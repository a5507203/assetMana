$(function(){
   var frm = document.frmNew; 
   $(frm).submit(function(){return false;});
   $("#miSubmit_up,#miSubmit_down").click(function(){
	  /* if($.trim($("input[name='title']").val()) == ''){
		   alert("请填写新闻标预1�7");
		   return false;
	   }
	   if($.trim($("textarea[name='desc']").val()) == ''){
		   alert("请填写新闻内宄1�7");
		   return false;
	   }*/
	   frm.submit();
   });
});
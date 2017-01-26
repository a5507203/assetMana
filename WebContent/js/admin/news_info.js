$(function(){
   var frm = document.frmNew; 
   $(frm).submit(function(){return false;});
   $("#miSubmit_up,#miSubmit_down").click(function(){
	/*   if($.trim($("input[name='title']").val()) == ''){
		   alert("请填写新闻标题");
		   return false;
	   }
	   if($.trim($("textarea[name='desc']").val()) == ''){
		   alert("请填写新闻内容");
		   return false;
	   }*/
	   frm.submit();
   });
});
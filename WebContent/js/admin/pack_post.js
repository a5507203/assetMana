$(function(){
   var frm = document.frmNew; 
   $(frm).submit(function(){return false;});
   $("#miSubmit_up,#miSubmit_down").click(function(){
	  /* if($.trim($("input[name='title']").val()) == ''){
		   alert("璇峰～鍐欐柊闂绘爣棰�");
		   return false;
	   }
	   if($.trim($("textarea[name='desc']").val()) == ''){
		   alert("璇峰～鍐欐柊闂诲唴瀹�");
		   return false;
	   }*/
	   frm.submit();
   });
});
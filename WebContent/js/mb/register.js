$(function(){
   var frm = document.frmNew; 
   $(frm).submit(function(){return false;});
   $("#miSubmit").click(function(){
	   var ret = $.validateForm(frm);
	   if(ret){
		   frm.submit();
	   }
   });
   $("#modifyPhoto").click(function(){
	   $("li[block_photo]").show(100);
   });
});
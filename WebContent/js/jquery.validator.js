String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
};
/*
 * If blank or white space
 * */
function isNull(str) {
	if (str == "")
		return true;
	var regu = "^[ \f\n\r\t]+$";
	var re = new RegExp(regu);
	return re.test(str);
}
/**
 * if it is a integer type
 * 
 * @param str
 * @return
 */
function isInteger(str) {
	var regu = /^[-]{0,1}[0-9]{1,}$/;
	return regu.test(str);
}
/**
 * if non-minus number
 * 
 * @param s
 * @return
 */
function isNumber(s) {
	var regu = "^[0-9]+$";
	var re = new RegExp(regu);
	if (s.search(re) != -1) {
		return true;
	} else {
		return false;
	}
}
/**
 * if a decimal
 * 
 * @param str
 * @return
 */
function isDecimal(str) {
	if (isInteger(str))
		return true;
	var re = /^[-]{0,1}(\d+)[\.]+(\d+)$/;
	if (re.test(str)) {
		if (RegExp.$1 == 0 && RegExp.$2 == 0)
			return false;
		return true;
	} else {
		return false;
	}
}
/**
 * if a valid phone number
 * 
 * @param str
 * @return
 */
function isPhone(str) {
	var re = /(\d{3,4}-){1}\d{8}/;
	return re.test(str);
}
/**
 * if a valid mobile number
 * 
 * @param str
 * @return
 */
function isMobile(str) {
	var re = /^1([0-9]{10})$/;
	return re.test(str);
}
/**
 * if a email address
 * 
 * @param str
 * @return
 */
function isEmail(strEmail) {
	var emailReg = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
	if (emailReg.test(strEmail)) {
		return true;
	} else {
		return false;
	}
}
/**
 * return the real length of a given string in bytes
 * @param str
 * @return
 */
function lengthOf(str){
	var ret = 0;
	for(var e = 0;e< str.length;e++){
		if(/[^\x00-\xff]/.test(str.charAt(e))){
			ret+=2;
		}else
			ret+=1;
	}
	return ret;
}
$.extend({
	msgModal : {
	   alert : function(s){
	     window.alert(s);
	   },
	   label : function(s, attachTo){
	     $(attachTo).html(s);
		 }
	},	
	/* *
	 * return of validator method: 
	 * if having wrong message then return the message otherwise return null
	 * */
	validator : {
		    validName : function(val, defAttVal){
		        if(defAttVal == '1' && (val == '' ||val.trim() == ''))
		        	return null;
		 
		        var nameOk = null;
		        $.ajax(
		        		{
		        		   async : false,
		 				   type:"GET",
		 				   url: ctx+"mb/checkName.form",
		 				   cache:false,
		 				   data: {'name':val},
		 				   dataType: 'text',
		 				   success: function(data){
		        			if(data != '' && data.trim() != defAttVal)
		        			 nameOk = "1";
		 				   }
		 				}
		        );
		        return nameOk;
			},
			repPswd : function(val, defAttVal) {
				if($("#"+defAttVal).val() != val)
					return "1";
				return null;
			},			
		    number : function(val) {
		        if('' !=  val && !isNumber(val))
		        	return "应为数字。";
		        return null;
			},
			phone : function(val) {
				if('' !=  val && !isPhone(val))
					return "错误的电话号码格式。";
				return null;
			},
			mobile : function(val) {
				if('' !=  val && !isMobile(val))
					return "错误的手机号码格式。";
				return null;
			},
			email : function(val) {
				if('' !=  val && !isEmail(val))
				   return "的格式不对。";
				return null;
			},
			validGender : function(val,defAttVal){
				if(-1 == $.inArray(val,defAttVal.split(',')))
					return "需要指定性别";
				return null;
			},
			validEmail : function(val,defAttVal){
				    var nameOk = null;
			        $.ajax(
			        		{
			        		   async : false,
			 				   type:"GET",
			 				   url: ctx+"mb/checkEmail.form",
			 				   processData: false,
			 				   cache:false,
			 				   data: "email=" + val,
			 				   dataType: 'text',
			 				   success: function(data){
			        			if(data != '' && data.trim() != defAttVal)
			        			 nameOk = "1";
			 				   }
			 				}
			        );
			        return nameOk;
			},
			 validShopName : function(val, defAttVal){
			 		        if(defAttVal == '1' && (val == '' ||val.trim() == ''))
					        	return null;
			 		       var nameOk = null;
					        $.ajax(
					        		{
					        		   async : false,
					 				   type:"POST",
					 				   url: ctx+"admin/checkShopName.form",
					 				   cache:false,
					 				   data: {'name':val.trim(),'id':defAttVal},
					 				   dataType: 'text',
					 				   success: function(data){
					        			if(data != '' && parseInt(data.trim()) > 0)
					        			 nameOk = "1";
					 				   }
					 				}
					        );
					        return nameOk;
			},
			len : function(val, defAttVal) {
				if(defAttVal != lengthOf(val))
					return "的长度应为" +defAttVal+ "。";
				return null;
			},
			maxlen : function(val, defAttVal) {
				if(lengthOf(val) > parseInt(defAttVal, 10))
					return "的最大长度应为" +defAttVal+ "。";
				return null;
			},
			minlen : function(val, defAttVal) {
				if(lengthOf(val) < parseInt(defAttVal, 10))
					return "的最小长度应为" +defAttVal+ "。";
				return null;
			},
			decimal : function(val, defAttVal) {
				if(!isDecimal(val))
					return "应为数值";
				return null;
			}
	}	
});

$.extend({
	  frms : [],
	  registForm : function(frm){
	    $.frms[frm.getAttribute('name')] = frm;
	  },
	  deRegistForm : function(frm){
	    $.frms[frm.getAttribute('name')] = null;
	  },
	  judgement : function(caller, frm, valiFuncName){
			var me$ = caller;
			frm = frm.jquery?frm[0] : frm;
			if (!me$.attr(valiFuncName))
				return true;
			var frmName = frm.getAttribute("name");
			var output = $.msgModal[frm.getAttribute("msgModal")];
			if (!output) {
				output = function() {
				};
			}
			var vRet = $.validator[valiFuncName](me$.val(), me$.attr(valiFuncName));
			if(vRet)
				return false;
			return true;
	   },
	   validateForm : function(frm){
		   if(!frm){
			   var ret = true;
			   var myfrms = [];
			   for(var e in $.frms)
				   myfrms.push($.frms[e]);
			   $.each(myfrms, function(i,n){
				   ret = validateFrm(this);
				   if(!ret)
					   return false;
			   });  	
		   }else{
			   return validateFrm(frm);
		   }
	   }
	});
	$.fn.extend({
	  validate : function(frm){
	    var caller = $(this);
	    var ret = true;
	    $.each($.validator, function(i,n){
	       if(caller.get(0).getAttribute(''+i) != 'undefined'){
	    	  var jRt = $.judgement(caller,frm,i);
	    	  if(typeof jRt == 'undefined' || jRt == null)
	    		  jRt = false;
	          if(!jRt && ret)
	    	   ret = false;
	       }
	    });
	    var attachTo;
		var msgTarget = $("#msg_" + caller.attr('name'));
		if(!msgTarget.size()){
			msgTarget = $('#' + caller.attr('msg'));
		}
		if(msgTarget.size())
		  attachTo = msgTarget[0];
	    if (!ret) {
			attachTo.className = "chk_no";
	    } else if (attachTo) {
			attachTo.className = "chk_ok";
	    }   
	    return ret;  
}});

function validateFrm(frm){
  var frm$ = $(frm);
  var ret = true;
  var trimBeforecheck = ("true" == frm$.attr("trimField") || true == frm$.attr("trimField"));
  frm$.find(":input,select").not(":button").each(function(i){
	  var me$ = $(this);
	  if(trimBeforecheck){
		  if(typeof me$[0] != 'undefined' && me$[0].value != '')
		    me$[0].value = (''+me$[0].value).trim();
	  }
	  var res = me$.validate(frm);
	  if(!res)
		  ret = res;
  });
  return ret;
}

$(document).ready(function(){
   $("form[validate='true']").each(function(n){
     var frm = this;
     $.registForm(frm);
     $(this).find(":input,select").not(":button,:hidden").blur(function(){
        $(this).validate(frm);
     });
   });
});

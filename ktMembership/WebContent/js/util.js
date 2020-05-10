/**
 * 
 */
$.fn.serializeObject = function() {
	  "use strict"
	  var result = {}
	  var extend = function(i, element) {
	    var node = result[element.name]
	    if ("undefined" !== typeof node && node !== null) {
	      if ($.isArray(node)) {
	        node.push(element.value)
	      } else {
	        result[element.name] = [node, element.value]
	      }
	    } else {
	      result[element.name] = element.value
	    }
	  }

	  $.each(this.serializeArray(), extend)
	  return result
}

function submitForm(elementId)
{
	$("#" + elementId).submit();
}
function submitAjax( url, type, async, param)
{
	return $.ajax({
		url      : url
      , type   : type
      , async : async
      , data	 : $.param(param)
      //, data	 : VestAjax(typeof(param)=='object'?$.param(param):param)
      , error	 :function( data)
      {
    	  alert("시스템 오류가 발생했습니다.");
      }
	});
}

function getParamInfo(formId){
	var formData = $("#"+formId).serializeArray();
	var formData1 = JSON.stringify(formData);
	var paramData = JSON.parse(formData1);
	return paramData;
}
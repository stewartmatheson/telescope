// public/javascripts/application.js
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

$(document).ready(function(){
	$('textarea.tinymce').tinymce({
		script_url : "/javascripts/tiny_mce/tiny_mce.js",
		theme : "advanced",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,bullist,numlist,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontselect,fontsizeselect,forecolor",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : ""
	});
});
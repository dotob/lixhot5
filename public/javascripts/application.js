// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// check existing email then show step two
var memo = { url: '',
  init: function(url){
    memo.url = url;
  }
}
$(function(){
	$("#search").focus();
	$("#two").hide();
  $("#search").live("keyup", function(){
		$("#two").hide();
		var searchPattern = $(this).val();
            if (searchPattern.length > 0) {
                $.getJSON(memo.url + '?search=' + searchPattern,
                	function (found) {
										if (found >= 0){
											$("#two").show();
											$("#guest_id").val(found);
                		}
									}
            		)
            }
	});
});

// expect iscoming true then show step three
$(function(){
  $("#three_yes,#three_no").hide();
  $("#iscoming_0,#iscoming_1").live("change", function(){
    $("#three_yes,#three_no").hide(); 
    var iscoming = $(this).val(); 
            if (iscoming == 1) {
            	$("#three_yes").show();
            } else{
            	$("#three_no").show();
						}
  });
});

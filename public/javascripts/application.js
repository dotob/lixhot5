// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// check existing email then show step two
$(function(){
	$("#search").focus();
	$("#two").hide();
  $("#search").live("keyup", function(){
		$("#two").hide();
		var searchPattern = $(this).val();
            if (searchPattern.length > 0) {
                $.getJSON('http://localhost:3000/findguest?search=' + searchPattern,
                	function (found) {
										if (found){
											$("#two").show();
                		}
									}
            		)
            }
	});
});

// expect iscoming true then show step three
$(function(){
  $("#three").hide();
  $("#iscoming_0,#iscoming_1").live("change", function(){
    $("#three").hide(); 
    var iscoming = $(this).val(); 
            if (iscoming == 1) {
            	$("#three").show();
            }
  });
});

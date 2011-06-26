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
  $("#three_yes,#three_no").hide();
  $("#search").live("keyup", function(){
		$("#two").hide();
  	$("#three_yes,#three_no").hide();
		var searchPattern = $(this).val();
            if (searchPattern.length > 0) {
                $.getJSON(memo.url + '?search=' + searchPattern,
                	function (found) {
										if (found){
											// if there is guest found, show step two
											$("#two").show();
											// set hidden field guest_id
											$("#guest_id").val(found[0].guest.id);
											// add gift of guest and select it if guest comes here again
											if(found[1] != null){
												$("<option value=\""+found[1].gift.id+"\">"+found[1].gift.name+" für "+found[1].gift.price+"€</option>").appendTo("#gift_id");
												$("#gift_id").val(found[1].gift.id);
											}
											// if guest already logged in select if he wanted to come or not
											if (found[0].guest.iscoming != null){
												found[0].guest.iscoming ? $("#iscoming_1").attr("checked","checked") : $("#iscoming_0").attr("checked","checked");
											} else {
												// if guest hadnt logged in in the past reset radio buttons
												$("#iscoming_0, #iscoming_1").attr("checked", false)	
											}
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

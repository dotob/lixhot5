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
											$("#two_link").hide();
											$("#two").fadeIn();
											// set hidden field guest_id
											$("#guest_id").val(found[0].guest.id);
											// show message
											$("#message").val(found[0].guest.message);
											// add gift of guest and select it if guest comes here again
											if(found[1] != null){
												$("<option value=\""+found[1].gift.id+"\">"+found[1].gift.name+" für "+found[1].gift.price+"€</option>").appendTo("#gift_id");
												$("#gift_id").val(found[1].gift.id);
											}
											// if guest already logged in select if he wanted to come or not
											if (found[0].guest.iscoming != null){
												found[0].guest.iscoming ? $("#iscoming_1").attr("checked","checked") : $("#iscoming_0").attr("checked","checked");
												found[0].guest.iscoming ? $("#three_yes").fadeIn() : $("#three_no").fadeIn();
												$("#three_link").hide();
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
						$("#three_link").hide();
            if (iscoming == 1) {
            	$("#three_yes").fadeIn();
            } else{
            	$("#three_no").fadeIn();
						}
  });
});

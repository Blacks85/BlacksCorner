$(document).ready(function(){

	// Make floating tooltip
	function simple_tooltip(target_items, name){
	 $(target_items).each(function(i){
			$("body").append("<div class='"+name+"' id='"+name+i+"'><p>"+$(this).attr('title')+"</p></div>");
			var my_tooltip = $("#"+name+i);
			// checks if there is a title
			if($(this).attr("title") != null){ 
				$(this).removeAttr("title").mouseover(function(){
						my_tooltip.css({opacity:0.8, display:"none"}).fadeIn(400);
				}).mousemove(function(kmouse){
						my_tooltip.css({left:kmouse.pageX+15, top:kmouse.pageY+15});
				}).mouseout(function(){
						my_tooltip.fadeOut(400);
				});
			}
		});
	}
 	
	// Search for all tooltips
	simple_tooltip("a","tooltip");

});
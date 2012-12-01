$(document).ready(function(){
	
	// Fill the chart
	function fillPieChart(myMin) {
		// By default...20
	    if(myMin==null)myMin = '10';
		// Fill the arr of foods
		var tmpFoods = [["Foods","Top eaters"]];
		$.getJSON("/foods.json?min=" + myMin, function(data) {
				$.each(data, function(key, val) {
		    	tmpFoods.push(['[' + val[1] + '] ' + val[0],val[1]]);
				drawChart(tmpFoods);
		  	});						
		});	
	}

	// Draw the pie chart
	function drawChart(theData) {
		// By default...std value
	    if(theData==null)theData = topFoods;
		// Draw the chart
		var data = google.visualization.arrayToDataTable(theData);
		var options = { title: 'Best eaters' };		
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
	    chart.draw(data, options);
	}
	
	// Draw Pie chart
	google.load("visualization", "1", {packages:["corechart"], "callback":fillPieChart});	
	
	// Filter the pie chart
	$('#FilterPieChart').click(function() {
		fillPieChart($('#foodUsageQuantity').val());
	});
			
});
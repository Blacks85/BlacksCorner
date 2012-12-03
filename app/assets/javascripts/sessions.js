$(document).ready(function(){
	
	var MinFoodsQuantity = 10;
	
	// Load charts lib
	google.load("visualization", "1", {packages:["corechart"], "callback":fillCharts});
	
	// Draw the pie chart
	function drawChart(theType, theID, theData, theTitle) {
		// By default...std value
	    if(theData==null)theData = topFoods;
		if(theTitle==null)theTitle = 'Best eaters';
		// Draw the chart
		var data = google.visualization.arrayToDataTable(theData);
		var options = { title: theTitle };		
		// Prepare the chart
		switch(theType) {
			case "pie":
 				var chart = new google.visualization.PieChart(document.getElementById(theID));
			  	break;
			case "line":
 				var chart = new google.visualization.LineChart(document.getElementById(theID));
			  	break;
			// Default pie
			default:
			  	var chart = new google.visualization.PieChart(document.getElementById('foodsUsage_Chart'));
		}		 
		chart.draw(data, options);
	}
	
	// Fill the charts
	function fillCharts() {		
		// FOODS
		$.getJSON("/foods.json?min=" + MinFoodsQuantity, function(data) {
			var tmpFoods = [["Foods","Top eaters"]];
			$.each(data, function(key, val) {
		    	tmpFoods.push(['[' + val[1] + '] ' + val[0],val[1]]);				
		  	});						
			drawChart('pie', 'foodsUsage_Chart', tmpFoods, "Most eaten food");
		});			
		// SYMPTONS & MEDICINES
		$.getJSON("/smfr.json", function(data) {
			var tmpData = [["Day", "Meals", "Symptons", "Medicines"]];
			$.each(data, function(key, val) {
	    		tmpData.push([val[0].toString(),val[1],val[2],val[3]]);	
	  		});	
			drawChart('line', 'SymptonsMedicinesRelations', tmpData, "Symptons/Medicines relationships");
		});		
	}
		
	// FOODS USAGE PIE CHARAT
	
	// Filter the pie chart
	$('#FilterFoodsUsage').click(function() {
		MinFoodsQuantity = $('#foodUsageQuantity').val();
		fillCharts();
	});
			
});
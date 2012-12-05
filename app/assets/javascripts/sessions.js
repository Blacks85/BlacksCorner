$(document).ready(function(){

	// Load charts lib
	google.load("visualization", "1", {packages:["corechart"], "callback":fillCharts});
	google.load('visualization', '1', {packages:['table'], "callback":fillCharts});
	
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
	
	// Draw table data
	function drawTableChart(theID, theData) {
		var table = new google.visualization.Table(document.getElementById(theID));
        table.draw(theData, {showRowNumber: true});
	}
	
	// Fill the charts
	function fillCharts() {		
		// FOODS
		fillUsedFoodsPieChart(15);
		// MORE STATISTICS
		fillStatisticsLineChart("0","1","1","0","0");
		// Relation between foods and symptons
		fillFoodsSymptonsTableChart(15);
	}
		
	// FOODS USAGE PIE CHARAT
	
	function fillUsedFoodsPieChart(quantity) {
		$.getJSON("/foods.json?min=" + quantity, function(data) {
			var tmpFoods = [["Foods","Top eaters"]];
			$.each(data, function(key, val) {
		    	tmpFoods.push(['[' + val[1] + '] ' + val[0],val[1]]);				
		  	});						
			drawChart('pie', 'foodsUsage_Chart', tmpFoods, "Most eaten food");
		});
	}
	
	// Filter the pie chart, foods usage and the table chart
	$('#foodUsageQuantity').keyup(function() {
		fillUsedFoodsPieChart($('#foodUsageQuantity').val());
		fillFoodsSymptonsTableChart($('#foodUsageQuantity').val());
	});
	
	// RELATIONSHIPS LINE CHART
	
	function fillStatisticsLineChart(Meals, Symps, Meds, Shits, Temps) {
		$.getJSON("/smfr.json?Meals="+Meals+"&Symps="+Symps+"&Meds="+Meds+"&Shits="+Shits+"&Temps="+Temps, function(data) {
			var tmpData = [["Day", "Meals", "Symptoms", "Medicines", "Shit", "Temperature"]];
			$.each(data, function(key, val) {
	    		tmpData.push([val[0].toString(),val[1],val[2],val[3], val[4], val[5]]);	
	  		});	
			drawChart('line', 'SymptonsMedicinesRelations', tmpData, "Symptoms/Medicines relationships");
		});
	}
	
	// Filter the relationship charts
	$('#SymptonsMedicinesRelationsFilter').change(function() {	
		var Meals = ($('#Chart_Meals').is(":checked")) ? "1" : "0";
		var Symps = ($('#Chart_Symps').is(":checked")) ? "1" : "0";
		var Meds  = ($('#Chart_Meds').is(":checked"))  ? "1" : "0";
		var Shits = ($('#Chart_Shits').is(":checked")) ? "1" : "0";
		var Temps = ($('#Chart_Temps').is(":checked")) ? "1" : "0";		
		fillStatisticsLineChart(Meals,Symps,Meds,Shits,Temps);
	});
	
	// RELATIONSHIP FOOD/SYMPTONS... LIST CHART
	
	function fillFoodsSymptonsTableChart(quantity) {
		$.getJSON("/sfr.json?min=" + quantity, function(data) {
			var tmpData = new google.visualization.DataTable();
	        tmpData.addColumn('string', 'Name');
	        tmpData.addColumn('number', 'Disease %');
			tmpData.addColumn('number', 'Symptoms');
			tmpData.addColumn('number', 'Eaten');
			$.each(data, function(key, val) {
	    		tmpData.addRows([[val[0].toString(),val[1],val[3],val[2]]]);				
	  		});	
			drawTableChart('foodSymptons_Chart', tmpData);			
		});
	}
});
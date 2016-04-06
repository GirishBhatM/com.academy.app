/**
 * 
 */
// = require jquery
$(document).ready(function() {
	$("#slot").click(function() {
		$("list").removeClass("active");
		$("#slot").parent().addClass("active");
	});
	$("#slotaCreate").click(function() {
		$("list").removeClass("active");
		$("#slotaCreate").parent().addClass("active");
	});
	$('#spinner').hide();
	$(document).ajaxStart(function() {
		$(".spinner").show();
	});

	$(document).ajaxStop(function() {
		$(".spinner").hide();
	});

});
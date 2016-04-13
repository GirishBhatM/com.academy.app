/**
 * 
 */
// = require jquery
$(document)
		.ready(
				function() {
					$('#spinner').hide();
					$(document).ajaxStart(function() {
						$(".spinner").show();
					});

					$(document).ajaxStop(function() {
						$(".spinner").hide();
					});

					$(document).on(
							"click",
							"#slotDelete",
							function() {
								var row = $(this).parent().parent();
								$.ajax({
									type : "POST",
									url : "/com.academy.app/"
											+ "slot/delete?slotID="
											+ $(this).attr("name"),
									sync : true,
									cache : false,
									success : function(response) {
										if ('Deleted' == response) {
											$(row).remove();
										}
										$("#message").empty();
										$("#message").append(response);
									},
									failure : function(response) {
										$("#message").empty();
										$("#message").append(response);
									}
								});
							});
					$(document).on(
							"click",
							"#slotEdit",
							function() {
								$.ajax({
									type : "POST",
									url : "/com.academy.app/"
											+ "slot/edit?slotID="
											+ $(this).attr("name"),
									sync : true,
									cache : false,
									success : function(response) {
										$("#content").empty();
										$("#content").append(response);
									},
									failure : function(response) {
										alert("Error occured");
									}
								});
							});

					$(document).on(
							"click",
							"#courseDelete",
							function() {
								var row = $(this).parent().parent();
								$.ajax({
									type : "POST",
									url : "/com.academy.app/"
											+ "course/delete?courseID="
											+ $(this).attr("name"),
									sync : true,
									cache : false,
									success : function(response) {
										if ('Deleted' == response) {
											$(row).remove();
										}
										$("#message").empty();
										$("#message").append(response);
									},
									failure : function(response) {
										$("#message").empty();
										$("#message").append(response);
									}
								});
							});

					$(document).on(
							"click",
							"#courseEdit",
							function() {
								$.ajax({
									type : "POST",
									url : "/com.academy.app/"
											+ "course/edit?courseID="
											+ $(this).attr("name"),
									sync : true,
									cache : false,
									success : function(response) {
										$("#content").empty();
										$("#content").append(response);
									},
									failure : function(response) {
										alert("Error occured");
									}
								});
							});
					$(document).on(
							"click",
							"#studentDelete",
							function() {
								var row = $(this).parent().parent();
								$.ajax({
									type : "POST",
									url : "/com.academy.app/"
											+ "student/delete?studentID="
											+ $(this).attr("name"),
									sync : true,
									cache : false,
									success : function(response) {
										if ('Deleted' == response) {
											$(row).remove();
										}
										$("#message").empty();
										$("#message").append(response);
									},
									failure : function(response) {
										$("#message").empty();
										$("#message").append(response);
									}
								});
							});
					$(document).on(
							"click",
							"#studentEdit",
							function() {
								$.ajax({
									type : "POST",
									url : "/com.academy.app/"
											+ "student/edit?studentID="
											+ $(this).attr("name"),
									sync : true,
									cache : false,
									success : function(response) {
										$("#content").empty();
										$("#content").append(response);
									},
									failure : function(response) {
										alert("Error occured");
									}
								});
							});
					$(document).on(
							"click",
							"#previous",
							function() {
								var controller = $("#controller").val();
								var offset = $("#offset").val();
								$.ajax({
									type : "POST",
									url : "/com.academy.app/" + controller
											+ "/list?offset=" + offset
											+ "&type=previous",
									sync : true,
									cache : false,
									success : function(response) {
										var id = "#" + controller + "Content"
										$(id).empty();
										$(id).append(response);
									}
								});
							});
					$(document).on(
							"click",
							"#next",
							function() {
								var controller = $("#controller").val();
								var offset = $("#offset").val();
								$.ajax({
									type : "POST",
									url : "/com.academy.app/" + controller
											+ "/list?offset=" + offset
											+ "&type=next",
									sync : true,
									cache : false,
									success : function(response) {
										var id = "#" + controller + "Content"
										$(id).empty();
										$(id).append(response);
									}
								});
							});

					$(document)
							.on(
									"change",
									"#slotDaySelect",
									function() {
										var day = $(this).val();
										$
												.ajax({
													type : "POST",
													url : "/com.academy.app/dashBoard/slotsPerDay?day="
															+ day,
													sync : true,
													cache : false,
													success : function(response) {
														$(".slotSelect")
																.remove();
														$("#slotSelectDiv")
																.append(
																		response)
													}
												});
									});

					$(document)
							.on(
									"click",
									"#add",
									function() {
										var day = $("#slotDaySelect :selected")
												.val();
										var slot = $("#slotSelect :selected")
												.val();
										var slotText = $(
												"#slotSelect :selected").text();
										$("#selectedSlotTable tbody")
												.append(
														"<tr><td>"
																+ day
																+ "</td><td>"
																+ slotText
																+ "</td><td id=\""
																+ slot
																+ "\">"
																+ "<input type=\"button\" name=\"Remove\" value=\"Remove\" class=\"btn btn-primary removeSlot\"></td></tr>");
									});
					$(document).on("click", ".removeSlot", function() {
						$(this).parent().parent().remove();
					});

					$(document).on(
							"click",
							".saveUser",
							function() {
								var jsonOBJ = {};
								jsonOBJ.studentName = $("#studentName").val();
								jsonOBJ.schoolName = $("#schoolName").val();
								jsonOBJ.course = $("#courseSelect :selected").val();
								jsonOBJ.level=$("#levelSelect :selected").val();
								jsonOBJ.dob=$("#dob").val();
								jsonOBJ.fee = $("#fee").val();
								jsonOBJ.studentID=$("#studentID").val();
								var slots = []
								var controller=$("#action").val()
								$("#selectedSlotTable tbody tr").each(
										function(i, row) {
											var slot = {}
											slot.day = $(row).children('td')
													.eq(0).text();
											slot.slotId = $(row).children('td')
													.eq(2).attr("id");
											slots.push(slot)
										});
								jsonOBJ.slots = slots
								var jsonData = JSON.stringify(jsonOBJ);
								$.ajax({
									type : "POST",
									url : "/com.academy.app/student/"+controller,
									data : {jsonData:jsonData},
									success : function(response) {
										$("#message").empty();
										$("#message").append(response);
									}
								});
							});

				});
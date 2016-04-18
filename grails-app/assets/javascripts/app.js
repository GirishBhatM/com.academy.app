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
								var form_data= new FormData();
								form_data.append("studentName" , $("#studentName").val());
								form_data.append("schoolName" , $("#schoolName").val());
								form_data.append("course" ,$("#courseSelect :selected").val());
								form_data.append("level",$("#levelSelect :selected").val());
								form_data.append("dob" , $("#dob").val());
								form_data.append("fee" , $("#fee").val());
								form_data.append("studentID", $("#studentID").val());
								form_data.append("studentPhone",$("#phoneNum").val());
								var slots = []
								var controller = $("#action").val()
								$("#selectedSlotTable tbody tr").each(
										function(i, row) {
											var slot = {}
											slot.day = $(row).children('td')
													.eq(0).text();
											slot.slotId = $(row).children('td')
													.eq(2).attr("id");
											slots.push(slot)
										});
								form_data.append("slots" , JSON.stringify(slots));
								form_data.append("file",$("#imageBrowsebtn")[0].files[0]);
								$.ajax({
									type : "POST",
									url : "/com.academy.app/student/"
											+ controller,
									data : form_data,
					                contentType: false,
					                processData: false,
									success : function(response) {
										$("#message").empty();
										$("#message").append(response);
									}
								});
							});

					$(document)
							.on(
									"change",
									"#imageBrowsebtn",
									function() {
										if ($(this)[0].files[0]) {
											var reader = new FileReader();
											reader.onload = function(e) {
												$("#preview").attr(
														'src', e.target.result);
											}
											reader
													.readAsDataURL($("#imageBrowsebtn")[0].files[0]);
										} else {
											preview.attr('src', '');
										}
									})

				});
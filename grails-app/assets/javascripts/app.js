/**
 * 
 */
// = require jquery
$(document).ready(
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
							url : "/com.academy.app/" + "slot/delete?slotID="
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
							url : "/com.academy.app/" + "slot/edit?slotID="
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
							url : "/com.academy.app/" + "course/edit?courseID="
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
							url : "/com.academy.app/" + "student/edit?studentID="
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
		});
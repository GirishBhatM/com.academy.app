package com.academy.app.domain

class Course {
	String title
	String description
	Integer duration
	BigDecimal fee
	static constraints = {
		title blank:false, nullable:false,size:5..15
		description blank:false,nullable:true,size:5..250
		duration nullable:false,blank:false,min:1
		fee blank:false,min:100.0,scale:2
	}
}

package com.academy.app.domain

class Student {
	String name
	String schoolName
	Date dateOfBirth
	Level level
	static constraints = {
		name blank:false ,nullbale:false,unique:true
		schoolName blank:false ,nullable:false
		dateOfBirth blank:false,nullable:false
		level nullable:false 
	}
}

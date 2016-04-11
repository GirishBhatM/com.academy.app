package com.academy.app.domain

class Student {
	String name
	String schoolName
	String dateOfBirth
	Level level
	Course course
	Slot slot
	BigDecimal feePaid
	static constraints = {
		name blank:false ,nullbale:false,unique:true,maxLength:250
		schoolName blank:false ,nullable:false,maxLength:250
		dateOfBirth blank:false,nullable:false
		level nullable:false
		course blank:false
		slot blank:false
		feePaid blank:false,min:new BigDecimal(0)
	}
	//static mapping = [course(lazy:false),slot(lazy:false)]
}

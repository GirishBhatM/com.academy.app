package com.academy.app.domain


class Student {
	String name
	String schoolName
	String dateOfBirth
	String courseStartDate
	String phoneNumber
	Byte[]  picture
	Level level
	Course course
	List<SlotDay> slot=[]
	BigDecimal feePaid
	String extension
	static hasMany =[slot:SlotDay]
	static constraints = {
		name blank:false ,nullbale:false,unique:true,maxLength:250
		schoolName blank:false ,nullable:false,maxLength:250
		dateOfBirth blank:false,nullable:false
		level nullable:false
		course blank:false
		slot blank:false,minSize:1
		feePaid blank:false,min:new BigDecimal(0)
		courseStartDate blank:false,nullable:false
		phoneNumber blank:true,nullable:true
		picture nullable:true,blank:true
		extension nullable:true 
	}

	static mapping = { picture sqlType: 'mediumblob' }
}

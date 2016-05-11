package com.academy.app.domain

import groovy.transform.ToString;

@ToString(excludes="description,duration,metaClass,class")
class Course {
	String title
	String description
	Integer duration
	BigDecimal fee
	static constraints = {
		title blank:false, nullable:false,size:1..15,unique:true
		description blank:false,nullable:true,maxLength:250
		duration nullable:false,blank:false,min:1
		fee blank:false,min:100.0,scale:2
	}
	@Override
	public String toString() {
		return "title=" + title + ", duration= " + duration + ", fee= "+ fee ;
	}
	
	
}

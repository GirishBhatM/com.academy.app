package com.academy.app.domain

import groovy.transform.ToString


@ToString(excludes="sType,eType,metaClass,class")
class Slot {
	String startTime
	String endTime
	TimeType sType
	TimeType eType
	List<Day> days=[]
	static hasMany = [days:Day]
	static constraints = {
		startTime blank:false
		endTime blank:false
		sType nullable:false
		eType nullable:false
		days unique:false,nullable:false,minSize:1
	}
	@Override
	public String toString() {
		return startTime +" "+sType+ " to "  + endTime+" "+eType + " "+days;
	}
}

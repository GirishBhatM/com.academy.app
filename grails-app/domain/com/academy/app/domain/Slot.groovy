package com.academy.app.domain

import groovy.transform.ToString


@ToString(excludes="sType,eType,metaClass,class")
class Slot {
	String startTime
	String endTime
	TimeType sType
	TimeType eType
	static constraints = {
		startTime blank:false
		endTime blank:false
		sType nullable:false
		eType nullable:false
	}
}

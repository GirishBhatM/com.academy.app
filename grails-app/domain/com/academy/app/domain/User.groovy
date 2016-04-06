package com.academy.app.domain
class User {
	String loginId
	String password
	String userName
	static constraints = {
		password blank:false, nullable:false,size:5..8
		loginId blank:false ,nullable:false,size:5..15
		userName nullable:true 
	}
}

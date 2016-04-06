package com.academy.app.controller

class BaseController {

	def beforeInterceptor = [action:this.&checkUser]
	def checkUser(){
		if(!session.user){
			redirect(controller:'user',action:'login')
		}
	}
}

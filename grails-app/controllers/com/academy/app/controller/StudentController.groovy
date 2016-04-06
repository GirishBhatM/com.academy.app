package com.academy.app.controller

class StudentController extends BaseController{
	

	def index(){
		render view:"index"
	}

	def create() {
		render (view:"create")
	}
	
}

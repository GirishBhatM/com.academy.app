package com.academy.app.controller

import org.springframework.beans.factory.annotation.Autowired;

import com.academy.app.domain.User
import com.academy.app.service.UserService;

class UserController {

	@Autowired
	UserService userService

	def login() {
		'login'
	}

	def validate(){
		User user=new User(params.user)
		if(!user.validate()){
			flash.error='User id or password is invalid'
			redirect (action:'login',id:params.id)
		}else{
			user=userService.findUser(user.loginId, user.password)
			if(user?.userName!=null){
				session.user=user
				render view:"home",model:[name:user.userName]
				return
			}else{
				flash.error='User id or password is invalid'
				redirect (action:'login')
			}
		}
	}

	def logout(){
		session.removeAttribute("user")
		render view:"login"
	}
}

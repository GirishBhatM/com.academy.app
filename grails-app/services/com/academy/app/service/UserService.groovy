package com.academy.app.service

import grails.transaction.Transactional

import com.academy.app.domain.User

@Transactional
class UserService {

	@Transactional(readOnly=true)
	User findUser(String loginId,String password) {
		User.withCriteria {
			eq("loginId", loginId)
			eq("password",password)
		}.find()
	}
}

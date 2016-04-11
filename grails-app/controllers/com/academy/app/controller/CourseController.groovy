package com.academy.app.controller

import com.academy.app.domain.Course;

class CourseController extends BaseController{

	def index() {
		render view:"index"
	}

	def create(){
		render view:"create"
	}

	def save(){
		Course course=new Course(title:params.title,description:params.description,duration:params.duration,fee:params.fee)
		Course exist=Course.findByTitle(course.title)
		if(exist){
			render 'Course with above title exists...!!!'
			return
		}
		if(course.validate()){
			course.save(flush:true)
			render 'Course created successfully...!!!'
		}else if(course.hasErrors()){
			course.errors.each { println it }
			render 'Please correct all the fields'
			return
		}
	}

	def list(){
		render view:"list",model:[model:Course.list()]
	}

	def edit(){
		Course course=Course.load(new Long(params.courseID))
		render view:'edit',model:[course:course]
	}

	def update(){
		Course course=Course.load(new Long(params.courseID))
		course.title=params.title
		course.description=params.description
		course.duration=new Integer(params.duration)
		course.fee=new BigDecimal(params.fee)
		if(course.validate()){
			if(course.save(flush:true)){
				render 'Course updated successfully..!!!'
				return
			}
			render 'Course with the above title already exists...!!!'
			return
		}
		render 'Please correct all the fields...!!!'
	}
	def delete(){
		Course course=Course.load(new Long(params.courseID))
		if(course?.id){
			course.delete(flush:true)
			render 'Deleted'
			return
		}
		render "Course doesn't exists..!!!"
	}
}

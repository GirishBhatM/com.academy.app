package com.academy.app.controller



import java.text.DateFormat
import java.text.SimpleDateFormat

import com.academy.app.domain.Course
import com.academy.app.domain.Level
import com.academy.app.domain.Slot
import com.academy.app.domain.Student

class StudentController extends BaseController{


	def index(){
		render view:"index"
	}

	def create() {
		List courseList=Course.list()
		List slotList=Slot.list()
		render (view:"create",model:[courses:courseList,slots:slotList])
	}

	def save(){
		Student student=new Student()
		Course course=Course.get(new Long(params.course))
		Slot slot=Slot.get(new Long(params.slot))
		student.course=course
		student.slot=slot
		student.name=params.studentName
		student.schoolName=params.schoolName
		student.dateOfBirth=params.date
		student.feePaid=new BigDecimal(params.fee)
		student.level=Level.valueOf(params.level)
		if(student.validate()){
			if(student.save(flush:true)){
				render 'Student created successfully...!!!'
				return
			}else{
				render 'Student with given name already exists..!!!'
				return
			}
		}else{
			render 'Please provide valid data...!!!'
		}
	}

	def list(){
		List studentList=Student.list()
		render view:"list",model:[model:studentList]
	}

	def delete(){
		Student student=Student.load(new Long(params.studentID))
		if(student?.id){
			student.delete(flush:true)
			render "Deleted"
			return
		}else{
			render "Student doesn't exists...!!!"
		}
		return
	}

	def edit(){
		Student student=Student.load(new Long(params.studentID))
		student.getCourse()
		student.getSlot()
		List courseList=Course.list()
		List slotList=Slot.list()
		render view:"edit",model:[student:student,courses:courseList,slots:slotList]
	}

	def update(){
		Student student=Student.load(new Long(params.studentID))
		student.feePaid=new BigDecimal(params.fee)
		student.course=Course.get(params.course)
		student.slot=Slot.get(params.slot)
		student.dateOfBirth=params.date
		student.level=Level.valueOf(params.level)
		println params.course
		if(student.validate()){
			if(student.save(flush:true)){
				render "Successfully updated...!!!"
			}else{
				render "Unable to update..!!!"
			}
		}else{
			render "Please provide valid data...!!!"
		}
	}
}

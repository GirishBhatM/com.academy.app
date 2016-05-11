package com.academy.app.controller

import org.apache.ivy.core.module.descriptor.ExtendsDescriptor;

import com.academy.app.domain.FeeUnit;
import com.academy.app.domain.Student
import com.sun.xml.internal.ws.developer.MemberSubmissionEndpointReference.Elements;

class FeeController extends BaseController{

    def index() { 
		Long id=Long.parseLong(params.studentId)
		if(id==null){
			render "No fee unit found"
			return
		}
		Student student=Student.load(id)
		List<FeeUnit> feeUnits=student.feeUnits
		render view:"index",model:[model:feeUnits,name:student.name,title:student.course.title,id:student.id]
	}
	
	def print(){
		render view:"reciept",model:[name:params.name,title:params.title,fee:params.feepaid,date:params.date]
	}
	
	def printAll(){
		Long id=Long.parseLong(params.id)
		if(id==null){
			render "No fee unit found"
			return
		}
		Student student=Student.load(id)
		List<FeeUnit> feeUnits=student.feeUnits
		render view:"totalreciept",model:[model:feeUnits,name:student.name,title:student.course.title]
	}
}

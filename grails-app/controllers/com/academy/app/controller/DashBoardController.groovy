package com.academy.app.controller

import org.hibernate.annotations.FetchMode

import com.academy.app.QueryDump;
import com.academy.app.domain.Course
import com.academy.app.domain.Slot
import com.academy.app.domain.Student

class DashBoardController {

	def index() { }

	def totalStudentsCount(){
		render Student.count()
	}

	def totalSlotsCount(){
		render Slot.count()
	}

	def totalCourseCount(){
		render Course.count()
	}

	def totalAmount(){
		def criteria=Student.createCriteria()
		BigDecimal amount=criteria.list {
			projections { sum("feePaid") }
		}.first()
		render amount
	}

	def usersPerCourse(){
		def criteria=Student.createCriteria()
		def outPut=criteria.list {
			projections {
				count("id","course")
				groupProperty("course")
			}
		}
		List toReturn=[]
		QueryDump queryDump
		for (Object[] result : outPut) {
			queryDump=new QueryDump()
			Long total = (Long)result[0];
			Course course = (Course)result[1];
			queryDump.count=total
			queryDump.title=course.title
			queryDump.fee=course.fee
			toReturn<<queryDump
		}
		render view:'list_user_per_course',model:[model:toReturn]
	}
}

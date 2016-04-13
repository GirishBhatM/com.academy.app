package com.academy.app.controller

import com.academy.app.QueryDump
import com.academy.app.domain.Course
import com.academy.app.domain.Day
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
			Long total = (Long)result[0]
			Course course = (Course)result[1]
			queryDump.count=total
			queryDump.title=course.title
			queryDump.fee=course.fee
			toReturn<<queryDump
		}
		render view:'list_user_per_course',model:[model:toReturn]
	}
	def slotsPerDay(){
		Day day=Day.valueOf(params.day)
		render view:"slot_list_per_day",model:[model: Slot.findAll("from Slot s where :days in elements(s.days)", [days:day.name])]
	}
	def studentsWithDue(){
		def outPut=Student.executeQuery("select s.name,s.feePaid,c.title,c.fee from Student s left join  s.course c  where (s.feePaid-c.fee)<0")
		List toReturn=[]
		QueryDump queryDump
		for (Object[] result : outPut) {
			queryDump=new QueryDump()
			queryDump.name=(String)result[0]
			queryDump.feePaid=(BigDecimal)result[1]
			queryDump.title=(String)result[2]
			queryDump.fee=(BigDecimal)result[3]
			queryDump.difference=queryDump.fee-queryDump.feePaid
			toReturn<<queryDump
		}
		println toReturn
		render view:"due",model:[model:toReturn]
	}
}

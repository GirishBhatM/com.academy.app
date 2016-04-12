package com.academy.app.controller

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
}

package com.academy.app.controller



import grails.converters.JSON

import java.text.SimpleDateFormat

import org.apache.poi.hssf.usermodel.HSSFSheet
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.Row

import com.academy.app.domain.Course
import com.academy.app.domain.Day
import com.academy.app.domain.Level
import com.academy.app.domain.Slot
import com.academy.app.domain.SlotDay
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
		def jsonData=JSON.parse(params.jsonData)
		Course course=Course.get(new Long(jsonData.course))
		student.course=course
		student.name=jsonData.studentName
		student.schoolName=jsonData.schoolName
		student.dateOfBirth=jsonData.dob
		student.feePaid=new BigDecimal(jsonData.fee)
		student.level=Level.valueOf(jsonData.level)
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy")
		student.courseStartDate=dateFormat.format(new Date())
		List slots=jsonData.slots
		if(slots.isEmpty()){
			render 'Please select atleast one slot..!!!'
			return
		}
		slots.each{
			Slot slot=Slot.get(it.slotId)
			SlotDay slotDay=[slot:slot,day:Day.valueOf(it.day)]
			student.slot<<slotDay
		}

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
			return
		}
	}

	def list(){
		int offset=params.offset==null?0:Integer.parseInt(params.offset)
		int nextOffset=offset
		if("previous".equals(params.type)){
			if(offset>0){
				nextOffset-=5
			}
		}else if("next".equals(params.type)){
			if(offset<Student.count()-1){
				nextOffset+=5
				offset=nextOffset
			}
		}
		List students=Student.list(max:5,offset:offset,sort:"name")
		println students
		render view:"list",model:[model:students,offset:nextOffset]
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
		render view:"edit",model:[student:student,courses:courseList]
	}

	def update(){
		def jsonData=JSON.parse(params.jsonData)
		println jsonData.studentID
		Student student=Student.load(new Long(jsonData.studentID))
		Course course=Course.get(new Long(jsonData.course))
		student.course=course
		student.name=jsonData.studentName
		student.schoolName=jsonData.schoolName
		student.dateOfBirth=jsonData.dob
		student.feePaid=new BigDecimal(jsonData.fee)
		student.level=Level.valueOf(jsonData.level)
		List slots=jsonData.slots
		if(slots.isEmpty()){
			render 'Please select atleast one slot..!!!'
			return
		}
		slots.each{
			Slot slot=Slot.get(it.slotId)
			SlotDay slotDay=[slot:slot,day:Day.valueOf(it.day)]
			student.slot<<slotDay
		}

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

	def export(){
		response.setContentType('application/application/excel')
		response.setHeader("Content-disposition", "attachment; filename=Student_List.xls")
		List studentList=Student.list(sort:"name")
		HSSFWorkbook workBook=new HSSFWorkbook()
		HSSFSheet sheet=workBook.createSheet("Student List")
		int rowNum=0
		Row header=sheet.createRow(rowNum++)
		Cell nameH=header.createCell(0)
		nameH.setCellValue("Student Name")
		Cell schoolNameH=header.createCell(1)
		schoolNameH.setCellValue("School Name")
		Cell dobH=header.createCell(2)
		dobH.setCellValue("Date pf Birth(mm/dd/yyy)")
		Cell courseNameH=header.createCell(3)
		courseNameH.setCellValue("Course Title")
		Cell feeH=header.createCell(4)
		feeH.setCellValue("Fee Paid")
		studentList?.each {
			Row row=sheet.createRow(rowNum++)
			Cell name=row.createCell(0)
			name.setCellValue(it.name)
			Cell schoolName=row.createCell(1)
			schoolName.setCellValue(it.schoolName)
			Cell dob=row.createCell(2)
			dob.setCellValue(it.dateOfBirth)
			Cell courseName=row.createCell(3)
			Cell fee=row.createCell(4)
			fee.setCellValue(it.feePaid.toString())
		}
		try{
			workBook.write(response.outputStream)
		}catch(IOException e){
			render "Error occured"
		}finally{
			response.outputStream.close()
		}
	}
}

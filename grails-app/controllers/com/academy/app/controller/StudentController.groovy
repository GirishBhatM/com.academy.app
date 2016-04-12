package com.academy.app.controller



import org.apache.poi.hssf.usermodel.HSSFSheet
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.Row

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
		List studentList=Student.list(max:10,offset:0,sort:"name")
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

	def export(){
		response.setContentType('application/application/excel')
		response.setHeader("Content-disposition", "attachment; filename=Student_List.xls")
		List studentList=Student.list()
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
		Cell slotH=header.createCell(4)
		slotH.setCellValue("Slot")
		Cell feeH=header.createCell(5)
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
			courseName.setCellValue(it.course.title)
			Cell slot=row.createCell(4)
			slot.setCellValue(it.slot.startTime+" "+it.slot.sType+"-"+it.slot.endTime+" "+it.slot.eType)
			Cell fee=row.createCell(5)
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

package com.academy.app.controller

import grails.converters.JSON

import com.academy.app.domain.Slot
import com.academy.app.domain.TimeType

class SlotController extends BaseController{

	def index() {
		render view:"index"
	}

	def create(){
		render view:"create"
	}

	def save(){
		String start=params.sh+":"+params.sm
		String end=params.eh+":"+params.em
		TimeType sType=TimeType.valueOf(params.st)
		TimeType eType=TimeType.valueOf(params.et)
		Slot slot=new Slot(startTime:start,endTime:end,sType:sType,eType:eType)
		String tempS=start+" "+params.st
		String tempE=end+" "+params.et
		if(tempS.equals(tempE)){
			render "Unable to create slot..!!!"
			return
		}

		Slot exist=Slot.withCriteria {
			eq("startTime",start)
			eq("endTime",end)
			eq("sType",sType)
			eq("eType",eType)
		}.find()

		if(exist){
			render "Slot with above specification already exists...!!!"
			return
		}else{
			slot.save(flush:true)
			render "Slot successfully created...!!!"
			return
		}
	}

	def list(){
		render view:"list",model:[model:Slot.list()]
	}

	def delete(){
		Slot slot=Slot.load(new Long(params.slotID))
		try{
			if(slot?.id){
				slot.delete(flush:true)
				render "Slot deleted successfully..!!!.View slot again for the update"
				return
			}else{
				render "Slot doesn't exists...!!!"
			}
		}catch(Exception e){
			render "Unable to delete the Slot.Please check the slot association with Players...!!"
			return
		}
	}
}

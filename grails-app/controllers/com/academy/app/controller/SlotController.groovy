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
		int offset=params.offset==null?0:Integer.parseInt(params.offset)
		int nextOffset=offset
		if("previous".equals(params.type)){
			if(offset>0){
				nextOffset-=5
			}
		}else if("next".equals(params.type)){
			if(offset<Slot.count()-1){
				nextOffset+=5
				offset=nextOffset
			}
		}
		List slots=Slot.list(max:5,offset:offset,sort:"startTime")
		render view:"list",model:[model:slots,offset:nextOffset]
	}

	def delete(){
		Slot slot=Slot.load(new Long(params.slotID))
		try{
			if(slot?.id){
				slot.delete(flush:true)
				render "Deleted"
				return
			}else{
				render "Slot doesn't exists...!!!"
			}
		}catch(Exception e){
			render "Unable to delete the Slot.Please check the slot association with Players...!!"
			return
		}
	}

	def edit(){
		Slot slot=Slot.load(new Long(params.slotID))
		render view:"edit",model:[slot:slot]
	}

	def update(){
		Slot slot=Slot.load(new Long(params.slotID))
		if(slot?.id){
			slot.startTime=params.sh+':'+params.sm
			slot.sType=TimeType.valueOf(params.st)
			slot.eType=TimeType.valueOf(params.et)
			slot.endTime=params.eh+':'+params.em
			Slot exist=Slot.withCriteria {
				eq("startTime",slot.startTime)
				eq("endTime",slot.endTime)
				eq("sType",slot.sType)
				eq("eType",slot.eType)
			}.find()

			if(exist){
				render "Slot with above specification already exists...!!!"
				return
			}else{
				slot.save(flush:true)
				if(slot.hasErrors()){
					render "Please correct the errors...!!!"
					return
				}
				render "Slot successfully updated...!!!"
				return
			}
		}
	}
}

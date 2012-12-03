class MedicinesController < ApplicationController
  
  before_filter :authenticate_user
  
  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(params[:medicine])
    if @medicine.save
			flash[:notice] = "Medicine added"
			flash[:color]= "valid"
		else
			flash[:notice] = "Medicine is invalid"
			flash[:color]= "invalid"
		end
	  redirect_to(:action => 'show')
  end
  
  def show
    @medicines = Medicine.order("description")
  end

  def destroy
    @medicine = Medicine.find_by_id(params[:id]).destroy
    redirect_to(:action => 'show')
  end
  
end

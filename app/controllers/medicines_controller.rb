class MedicinesController < ApplicationController
  
  before_filter :authenticate_user
  
  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(params[:medicine])
    if @medicine.save 
      redirect_to show_medicines_path, :flash => { :success => "Created new medicine: #{@medicine.description}" }
    else
      render 'new'
    end
  end
  
  def show
    @medicines = Medicine.order("description")
  end

  def destroy
    @medicine = Medicine.find(params[:id]).destroy
    redirect_to show_medicines_path, :flash => { :success => "Deleted medicine: #{@medicine.description}" }
  end
  
  def edit
    @medicine = Medicine.find(params[:id])
  end
  
  def update
    @medicine = Medicine.find(params[:id])
    if @medicine.update_attributes(params[:medicine])
      redirect_to show_medicines_path, :flash => { :success => "Medicine: #{@medicine.description} updated successful" }
    else
      render 'edit'
    end    
  end
  
end

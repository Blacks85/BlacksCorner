class SymptonsController < ApplicationController
  
  before_filter :authenticate_user
  
  def new
    @sympton = Sympton.new
  end

  def create
    @sympton = Sympton.new(params[:sympton])
    if @sympton.save
			redirect_to show_symptons_path, :flash => { :success => "Created new symptom: #{@sympton.description}" }
		else
			render 'new'
		end
  end
  
  def show
    @symptons = Sympton.order("description")
  end

  def destroy
    @sympton = Sympton.find(params[:id]).destroy
    redirect_to show_symptons_path, :flash => { :success => "Deleted symptom: #{@sympton.description}" }
  end
  
  def edit
    @sympton = Sympton.find(params[:id])
  end
  
  def update
    @sympton = Sympton.find(params[:id])
    if @sympton.update_attributes(params[:sympton])
      redirect_to show_symptons_path, :flash => { :success => "symptom: #{@sympton.description} updated successful" }
    else
      render 'edit'
    end    
  end
end

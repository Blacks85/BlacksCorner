class SymptonsController < ApplicationController
  
  before_filter :authenticate_user
  
  def new
    @sympton = Sympton.new
  end

  def create
    @sympton = Sympton.new(params[:sympton])
    if @sympton.save
			flash[:notice] = "Sympton added"
			flash[:color]= "valid"
		else
			flash[:notice] = "Sympton is invalid"
			flash[:color]= "invalid"
		end
	  redirect_to(:action => 'show')
  end
  
  def show
    @symptons = Sympton.order("description")
  end

  def destroy
    @sympton = Sympton.find_by_id(params[:id]).destroy
    redirect_to(:action => 'show')
  end
end

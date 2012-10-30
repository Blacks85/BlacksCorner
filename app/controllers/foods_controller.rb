class FoodsController < ApplicationController
  
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(params[:food])
    if @food.save
			flash[:notice] = "Food added"
			flash[:color]= "valid"
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
		end
	  redirect_to(:action => 'show')
  end
  
  def show
    @foods = Food.all
  end

  def destroy
    @food = Food.find_by_id(params[:id]).destroy
    redirect_to(:action => 'show')
  end 
end

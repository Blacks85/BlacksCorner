class FoodsController < ApplicationController
  
  before_filter :authenticate_user
  
  def index  
    # Autocomplete in formato JSON, per query foods
	  myFood = Array.new
		Food.all.each do |f|
      myFood << [f.description, f.meals.size] if f.meals.size > params[:min].to_i
    end
    myFood.sort! { |a,b| b[1] <=> a[1] }
    respond_to do |format|  
       format.json { render :json => myFood.to_json }
    end
  end
    
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(params[:food])
    if @food.save
			flash[:notice] = "Food added"
			flash[:color]= "valid"
		else
			flash[:notice] = "Meal is invalid"
			flash[:color]= "invalid"
		end
	  redirect_to(:action => 'show')
  end
  
  def show
    @foods = Food.order("description")
  end

  def destroy
    @food = Food.find_by_id(params[:id]).destroy
    redirect_to(:action => 'show')
  end 
end

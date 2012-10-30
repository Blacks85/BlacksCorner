class MealsController < ApplicationController
  
  before_filter :authenticate_user
  
  def new
    @meal = Meal.new
  end
  
  def create
    @meal = Meal.new(params[:meal])
    @meal.user_id = @current_user.id
    # Aggiunto cibi del pasto
    params[:foods].each do |i, f|
      if f == '1'
        @food = Food.find_by_id(i) 
        @meal.foods << @food if !@food.nil?
      end
    end
    if @meal.save
			flash[:notice] = "Meal added"
			flash[:color]= "valid"
		else
			flash[:notice] = "Meal is invalid"
			flash[:color]= "invalid"
		end
	  redirect_to :action => 'show'
  end
  
  def show
    @meals = Meal.all
  end

  def destroy
    @meal = Meal.find_by_id(params[:id]).destroy
    redirect_to(:action => 'show')
  end
  
end

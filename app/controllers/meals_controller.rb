class MealsController < ApplicationController
  
  before_filter :authenticate_user
  
  def new
    @meal = Meal.new
  end
  
  def create
    @meal = Meal.new(params[:meal])
    @meal.user_id = @current_user.id
    fill_meal_with_data(@meal)
    # Salvo il pasto
    if @meal.save
			redirect_to show_meals_path, :flash => { :success => "Created new meal: #{@meal.meal_type}" }
		else
			render 'new'
		end
  end
  
  def show
    @meals = Meal.order(:consumed)
  end

  def destroy
    @meal = Meal.find(params[:id]).destroy
    redirect_to show_meals_path, :flash => { :success => "Deleted meal: #{@meal.id}" }
  end
  
  def single_day
    tmpMeal = Meal.find(params[:id])
    @meals = Meal.where("consumed = ?", tmpMeal.consumed)
  end
  
  def edit
    @meal = Meal.find(params[:id])
  end
  
  def update
    @meal = Meal.find(params[:id])    
    if @meal.update_attributes(params[:meal])
      fill_meal_with_data(@meal)
      redirect_to show_single_day_path :id => @meal.id, :flash => { :success => "Meal: #{@meal.id} updated successful" }
    else
      render 'edit'
    end
  end
  
  private
  
    def fill_meal_with_data(myMeal)
      myMeal.foods.destroy_all
      myMeal.medicines.destroy_all
      myMeal.symptons.destroy_all
      # Aggiunto cibi del pasto
      if !params[:foods].nil?
        params[:foods].each do |i, f|
          if f == '1'
            @food = Food.find_by_id(i) 
            myMeal.foods << @food if !@food.nil?
          end
        end
      end
      # Aggiunto medicine del pasto
      if !params[:medicines].nil?
        params[:medicines].each do |i, f|
          if f == '1'
            @medicine = Medicine.find_by_id(i) 
            myMeal.medicines << @medicine if !@medicine.nil?
          end
        end
      end
      # Aggiunto sintomi del pasto
      if !params[:symptons].nil?
        params[:symptons].each do |i, f|
          if f == '1'
            @sympton = Sympton.find_by_id(i) 
            myMeal.symptons << @sympton if !@sympton.nil?
          end
        end 
      end     
    end
  
end

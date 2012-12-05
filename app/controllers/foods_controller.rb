class FoodsController < ApplicationController
  
  before_filter :authenticate_user
  
  def index  
    # Autocomplete in formato JSON, per query foods
	  myFood = Array.new
		Food.all.each do |f|
      myFood << [f.description, f.meals.size] if f.meals.size >= params[:min].to_i
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
			redirect_to show_foods_path, :flash => { :success => "Created new food: #{@food.description}" }
		else
			render 'new'
		end
  end
  
  def show
    @foods = Food.order("description")
  end

  def destroy
    @food = Food.find(params[:id]).destroy
    redirect_to show_foods_path, :flash => { :success => "Deleted food: #{@food.description}" }
  end 
  
  def edit
    @food = Food.find(params[:id])
  end
  
  def update
    @food = Food.find(params[:id])
    if @food.update_attributes(params[:food])
      redirect_to show_foods_path, :flash => { :success => "Food: #{@food.description} updated successful" }
    else
      render 'edit'
    end    
  end
end

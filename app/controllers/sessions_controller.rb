class SessionsController < ApplicationController
  	
	before_filter :authenticate_user, :only => [:home]
	before_filter :save_login_state, :only => [:login, :login_attempt]
  	
	def login
		render 'login'
	end
	
	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
			redirect_to(:action => 'home')
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color]= "invalid"
			render "login"	
		end
	end
	
	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end
	
  def home
  end
  
  def symptons_medicines_foods_relationships  
    # Autocomplete in formato JSON, per query
	  myData = Array.new
    myDates = getMealsDates
	  # Count the staff for all day
	  myDates.each do |d|
	    tmpMeals = Meal.where("consumed =?", d)
	    tmpSymps = 0
	    tmpMeds  = 0
	    tmpShits = 0
	    tmpTemps = 0
	    tmpMeals.each do |m|	   
	      tmpShits += 1 if m.feci != "Nothing" and !m.feci.nil?  
	      tmpTemps += m.temperature
	      tmpSymps += m.symptons.size
	      m.medicines.all.each do |tmpM|
	        tmpMeds += tmpM.power
	      end	      
	    end
      # Mean the temperature
      tmpTemps = (tmpTemps / tmpMeals.count) / 5
      # Keep only user requested data
      tmpMeals = [] if params[:Meals] != '1'
      tmpSymps = 0  if params[:Symps] != '1'
      tmpMeds  = 0  if params[:Meds]  != '1'
      tmpShits = 0  if params[:Shits] != '1'
      tmpTemps = 0  if params[:Temps] != '1'
      # Put data togheter
	    myData << [d.strftime('%d/%m'), tmpMeals.count, tmpSymps, tmpMeds, tmpShits, tmpTemps]
	  end	  	
    respond_to do |format|  
       format.json { render :json => myData.to_json }
    end
  end
  
  def symptons_food_relationships  
    # Conto i sintomi di ogni cibo
    myData = Hash.new
    Meal.all.each do |m|
      m.foods.each do |f|
        myData[f.id] = 0 if myData[f.id].nil?
        myData[f.id] += m.symptons.size
      end
    end  
    # Medio per quante volte ho mangiato il cibo e riempio l'array
    myArr = Array.new
    myData.each do |i, v|
      tmpFood = Food.find(i)
      tmpPercentage = (v.to_f / tmpFood.meals.size).round(2)
      myArr << [tmpFood.description, tmpPercentage, tmpFood.meals.size, myData[i]] if tmpFood.meals.size >= params[:min].to_i
    end  
    myArr.sort! { |a,b| b[1] <=> a[1] }
    respond_to do |format|  
       format.json { render :json => myArr.to_json }
    end
  end
  
  private
  
    def getMealsDates
      # Find all day with at least one meal
  	  myDates = Array.new
  	  tmpDate = ""
  	  Meal.all.each do |m|
  	    if tmpDate != m.consumed
  	      tmpDate = m.consumed
  	      myDates << m.consumed
  	    end
  	  end
  	  myDates
  	end

end

# == Schema Information
#
# Table name: foods_meals
#
#  id         :integer          not null, primary key
#  food_id    :integer
#  meal_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodsMeals < ActiveRecord::Base
  attr_accessible :food_id, :meal_id
end

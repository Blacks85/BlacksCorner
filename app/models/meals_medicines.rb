# == Schema Information
#
# Table name: meals_medicines
#
#  id          :integer          not null, primary key
#  meal_id     :integer
#  medicine_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class MealsMedicines < ActiveRecord::Base
  attr_accessible :meal_id, :medicine_id
end

# == Schema Information
#
# Table name: meals_symptons
#
#  id         :integer          not null, primary key
#  meal_id    :integer
#  sympton_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class MealsSymptons < ActiveRecord::Base
  attr_accessible :meal_id, :sympton_id
end

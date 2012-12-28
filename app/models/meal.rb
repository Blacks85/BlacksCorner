# == Schema Information
#
# Table name: meals
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  temperature      :integer
#  consumed         :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  meal_type        :string(255)
#  feci             :string(255)
#  bloodpressuremin :integer
#  bloodpressuremax :integer
#

class Meal < ActiveRecord::Base
  attr_accessible :bloodpressuremin, :bloodpressuremax, :consumed, :temperature, :user_id, :meal_type, :feci
  
  has_and_belongs_to_many :foods
  has_and_belongs_to_many :medicines
  has_and_belongs_to_many :symptons
  belongs_to :user
end

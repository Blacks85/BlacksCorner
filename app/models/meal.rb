# == Schema Information
#
# Table name: meals
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  climate     :string(255)
#  temperature :integer
#  consumed    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Meal < ActiveRecord::Base
  attr_accessible :climate, :consumed, :temperature, :user_id
  
  has_and_belongs_to_many :foods
  has_and_belongs_to_many :medicines
  has_and_belongs_to_many :symptons
  belongs_to :user
end

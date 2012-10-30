# == Schema Information
#
# Table name: foods
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Food < ActiveRecord::Base
  attr_accessible :description
  
  has_and_belongs_to_many :meals
end

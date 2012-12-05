# == Schema Information
#
# Table name: symptons
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gravity     :integer
#

class Sympton < ActiveRecord::Base
  attr_accessible :description, :gravity
  
  has_and_belongs_to_many :meals
  
  validates :description, :presence => true, 
						              :uniqueness => true
end

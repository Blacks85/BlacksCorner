# == Schema Information
#
# Table name: medicines
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  power       :float
#

class Medicine < ActiveRecord::Base
  attr_accessible :description, :power
  
  has_and_belongs_to_many :meals
  
  validates :description, :presence => true, 
						              :uniqueness => true
						              
	validates :power, :presence => true
end

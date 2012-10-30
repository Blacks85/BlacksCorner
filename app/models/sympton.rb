# == Schema Information
#
# Table name: symptons
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sympton < ActiveRecord::Base
  attr_accessible :description
  
  has_and_belongs_to_many :meals
end

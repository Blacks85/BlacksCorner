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

require 'test_helper'

class MealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

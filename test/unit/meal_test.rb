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

require 'test_helper'

class MealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

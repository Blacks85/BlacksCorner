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

require 'test_helper'

class MedicineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

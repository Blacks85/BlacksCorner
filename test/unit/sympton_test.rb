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

require 'test_helper'

class SymptonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

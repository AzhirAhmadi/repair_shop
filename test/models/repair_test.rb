# == Schema Information
#
# Table name: repairs
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  car_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class RepairTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

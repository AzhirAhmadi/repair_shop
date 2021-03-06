# == Schema Information
#
# Table name: repairs
#
#  id          :integer          not null, primary key
#  description :text
#  car_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  kilometer   :integer
#
require 'rails_helper'

RSpec.describe Repair, type: :model do
  it { should belong_to(:car) }
  it { should have_many(:spare_parts) }
  it { should have_many(:payments) }
end

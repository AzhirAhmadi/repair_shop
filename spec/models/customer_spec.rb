# == Schema Information
#
# Table name: customers
#
#  id            :integer          not null, primary key
#  name          :string
#  mobile_number :string
#  shop_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should belong_to(:shop) }
  it { should have_many(:cars) }
  it { should validate_uniqueness_of(:name).scoped_to(:shop_id) }
  it { should validate_presence_of(:name) }
end

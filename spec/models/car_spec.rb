# == Schema Information
#
# Table name: cars
#
#  id          :integer          not null, primary key
#  number      :string
#  type        :string
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should belong_to(:customer) }
  it { should have_many(:repairs) }
end

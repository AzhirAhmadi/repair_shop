# == Schema Information
#
# Table name: financial_accounts
#
#  id         :integer          not null, primary key
#  value      :integer
#  repair_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should belong_to(:repair) }
end

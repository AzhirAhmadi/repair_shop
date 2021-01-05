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
class Payment < ApplicationRecord
    belongs_to :repair
end

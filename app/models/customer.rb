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
class Customer < ApplicationRecord
    validates :name, presence: true, :uniqueness => { :scope => :shop_id }

    belongs_to :shop
    has_many :cars, dependent: :destroy
end

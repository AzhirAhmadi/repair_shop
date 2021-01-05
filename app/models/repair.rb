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
class Repair < ApplicationRecord
  belongs_to :car
  has_many :spare_parts, dependent: :destroy
  has_many :payments, dependent: :destroy


  def total_account
    cost = spare_parts.pluck(:cost).inject(0){|sum,x| sum + x }
    paymant = payments.pluck(:value).inject(0){|sum,x| sum + x }
    paymant - cost
  end
end

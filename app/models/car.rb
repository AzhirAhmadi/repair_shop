# == Schema Information
#
# Table name: cars
#
#  id          :integer          not null, primary key
#  number      :string
#  car_type    :string
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Car < ApplicationRecord
  belongs_to :customer
  has_many :repairs, dependent: :destroy

  def total_account
    repairs.map{|x| x.total_account}.inject(0){|sum,x| sum + x }
  end
end

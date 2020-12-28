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
class Car < ApplicationRecord
end

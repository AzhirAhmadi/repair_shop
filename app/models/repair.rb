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
class Repair < ApplicationRecord
end

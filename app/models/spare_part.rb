# == Schema Information
#
# Table name: spare_parts
#
#  id            :integer          not null, primary key
#  name          :string
#  cost          :integer
#  serial_number :string
#  repair_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class SparePart < ApplicationRecord
end

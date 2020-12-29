# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Shop < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    belongs_to :user
    has_many :customers
end

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
require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:customers) }
    it { should validate_uniqueness_of(:name)}
    it { should validate_presence_of(:name) }
  end
end

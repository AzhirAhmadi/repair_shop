require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should belong_to(:shop) }
  it { should have_many(:cars) }
end

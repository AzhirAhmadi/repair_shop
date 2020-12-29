require 'rails_helper'

RSpec.describe Repair, type: :model do
  it { should belong_to(:car) }
  it { should have_many(:spare_parts) }
  it { should have_many(:financial_accounts) }
end

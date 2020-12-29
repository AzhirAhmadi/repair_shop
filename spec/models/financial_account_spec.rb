require 'rails_helper'

RSpec.describe FinancialAccount, type: :model do
  it { should belong_to(:repair) }
end

require 'rails_helper'

RSpec.describe SparePart, type: :model do
  it { should belong_to(:repair) }
end

class RepairSerializer < ActiveModel::Serializer
  type :repair

  attributes :id, :description, :kilometer, :total_account
end

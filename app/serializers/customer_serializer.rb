class CustomerSerializer < ActiveModel::Serializer
  type :customer

  attributes :id, :name, :mobile_number, :total_account
end

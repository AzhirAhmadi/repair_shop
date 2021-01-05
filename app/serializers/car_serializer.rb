class CarSerializer < ActiveModel::Serializer
  type :car

  attributes :id, :number, :car_type, :total_account
end

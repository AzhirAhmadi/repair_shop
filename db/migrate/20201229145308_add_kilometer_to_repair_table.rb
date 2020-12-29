class AddKilometerToRepairTable < ActiveRecord::Migration[6.0]
  def change
    add_column :repairs, :kilometer, :integer
    remove_column :repairs, :name
  end
end

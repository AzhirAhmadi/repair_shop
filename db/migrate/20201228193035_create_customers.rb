class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :mobile_number

      t.references :shop

      t.timestamps
    end
  end
end

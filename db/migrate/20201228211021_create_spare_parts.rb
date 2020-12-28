class CreateSpareParts < ActiveRecord::Migration[6.0]
  def change
    create_table :spare_parts do |t|
      t.string :name
      t.integer :cost
      t.string :serial_number

      t.references :repair

      t.timestamps
    end
  end
end

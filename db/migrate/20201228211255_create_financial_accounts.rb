class CreateFinancialAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_accounts do |t|
      t.integer :value

      t.references :repair

      t.timestamps
    end
  end
end

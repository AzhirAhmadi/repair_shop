class ChangeFinancialAccountsTableName < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :financial_accounts, :payments
  end

  def self.down
    rename_table :payments, :financial_accounts
  end
end

class RemoveDetailsFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :last_name, :string
    remove_column :customers, :first_name, :string
    remove_column :customers, :last_name_kana, :string
    remove_column :customers, :first_name_kana, :string
  end
end

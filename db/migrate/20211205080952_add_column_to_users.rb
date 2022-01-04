class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer, null: false
    add_column :users, :name, :string
  end
end

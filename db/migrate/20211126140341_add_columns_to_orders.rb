class AddColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :time, :integer
    add_column :orders, :qty, :integer
    add_column :orders, :cart, :boolean
  end
end

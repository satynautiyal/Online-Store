class AddColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :duration, :integer
  end
end

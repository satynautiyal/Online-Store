class RemoveColumnsFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :code, :string
    remove_column :products, :price, :float
    remove_column :products, :quantity, :integer
  end
end

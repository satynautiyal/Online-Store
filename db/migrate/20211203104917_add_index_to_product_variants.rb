class AddIndexToProductVariants < ActiveRecord::Migration[6.1]
  def change
    change_column :product_variants, :batch_no, :string, unique: true
  end
end

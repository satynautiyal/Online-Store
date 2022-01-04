class AddSoftDelete < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :discarded_at, :datetime
    add_index :users, :discarded_at

    add_column :products, :discarded_at, :datetime
    add_index :products, :discarded_at

    add_column :product_variants, :discarded_at, :datetime
    add_index :product_variants, :discarded_at
    
    add_column :product_services, :discarded_at, :datetime
    add_index :product_services, :discarded_at

    add_column :categories, :discarded_at, :datetime
    add_index :categories, :discarded_at
  end
end

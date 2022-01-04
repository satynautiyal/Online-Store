class CreateWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product_variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end

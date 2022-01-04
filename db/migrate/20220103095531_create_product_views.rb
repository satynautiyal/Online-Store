class CreateProductViews < ActiveRecord::Migration[6.1]
  def change
    create_table :product_views do |t|
      t.references :viewable, polymorphic: true, null: false
      t.string :user_ip

      t.timestamps
    end
  end
end

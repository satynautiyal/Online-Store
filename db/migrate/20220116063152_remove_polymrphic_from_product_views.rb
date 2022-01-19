class RemovePolymrphicFromProductViews < ActiveRecord::Migration[6.1]
  def change
    remove_reference :product_views, :viewable, polymorphic: true, index: true
    add_reference :product_views, :product_variant, null: false, foreign_key: true
  end
end

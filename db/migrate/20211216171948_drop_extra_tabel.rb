class DropExtraTabel < ActiveRecord::Migration[6.1]
  def change
    drop_table :notification_belong_tos
    drop_table :notification_for_users
  end
end

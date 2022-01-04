class CreateNotificationBelongs < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_belongs do |t|
      t.boolean :readed
      t.references :user, null: false, foreign_key: true
      t.references :notification, null: false, foreign_key: true

      t.timestamps
    end
  end
end

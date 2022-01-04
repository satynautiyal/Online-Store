class ChangeColumnsOfTables < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :time, :time
    change_column :services, :time, :integer
    add_column :orders, :end_time, :time
    add_column :services, :start_time, :time
    add_column :services, :end_time, :time
    rename_column :services, :time, :duration
    rename_column :orders, :time, :start_time
  end
end

class Dropping < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :event_id
  end
end

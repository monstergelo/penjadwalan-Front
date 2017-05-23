class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.string :name
      t.integer :event_id
      t.integer :event_type
      t.string :owner_id

      t.timestamps
    end
  end
end

class CreateScheduledEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :scheduled_events do |t|
      t.datetime :end
      t.datetime :start
      t.string :student_id
      t.string :pembimbing_id
      t.string :penguji_id
      t.string :room_id
      t.integer :event_type
      t.string :event_name
      t.string :kategori

      t.timestamps
    end
  end
end

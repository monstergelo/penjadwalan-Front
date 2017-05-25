class CreateCalendarEvents < ActiveRecord::Migration[5.0]
  def self.up
    create_table :calendar_events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :text

      t.timestamps
    end
  end

  def self.down
    drop_table :calendars_events
  end
end

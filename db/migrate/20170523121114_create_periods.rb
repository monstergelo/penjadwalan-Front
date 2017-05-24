class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.datetime :start
      t.datetime :end
      t.integer :period_type

      t.timestamps
    end
  end
end

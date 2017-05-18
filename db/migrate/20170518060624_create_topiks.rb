class CreateTopiks < ActiveRecord::Migration[5.0]
  def change
    create_table :topiks do |t|
      t.string :nama

      t.timestamps
    end
  end
end

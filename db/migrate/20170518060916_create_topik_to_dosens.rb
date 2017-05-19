class CreateTopikToDosens < ActiveRecord::Migration[5.0]
  def change
    create_table :topik_to_dosens do |t|
      t.integer :topik_id
      t.integer :dosen_id

      t.timestamps
    end
  end
end

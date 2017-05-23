class DropTopic < ActiveRecord::Migration[5.0]
  def change
    drop_table :topiks
    drop_table :topik_to_dosens
    drop_table :topik_to_mahasiswas
  end
end

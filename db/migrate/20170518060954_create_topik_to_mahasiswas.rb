class CreateTopikToMahasiswas < ActiveRecord::Migration[5.0]
  def change
    create_table :topik_to_mahasiswas do |t|
      t.integer :topik_id
      t.integer :mahasiswa_id

      t.timestamps
    end
  end
end

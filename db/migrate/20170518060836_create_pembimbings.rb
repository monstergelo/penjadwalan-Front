class CreatePembimbings < ActiveRecord::Migration[5.0]
  def change
    create_table :pembimbings do |t|
      t.integer :mahasiswa_id
      t.integer :dosen_id

      t.timestamps
    end
  end
end

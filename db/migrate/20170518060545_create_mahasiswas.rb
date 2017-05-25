class CreateMahasiswas < ActiveRecord::Migration[5.0]
  def self.up
    create_table :mahasiswas do |t|
      t.string   "NIM"
      t.string   "nama"
      t.string   "email"
      t.string   "kategori"

      t.timestamps
    end


  end
end

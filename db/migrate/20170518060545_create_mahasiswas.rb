class CreateMahasiswas < ActiveRecord::Migration[5.0]
  def change
    create_table :mahasiswas do |t|
      t.string :NIM
      t.string :nama
      t.string :email

      t.timestamps
    end
  end
end

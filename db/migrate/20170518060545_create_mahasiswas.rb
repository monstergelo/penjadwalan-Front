class CreateMahasiswas < ActiveRecord::Migration[5.0]
  def self.up
    create_table :mahasiswas do |mahasiswa|
    end

    puts Mahasiswa.column_names
    Mahasiswa.find_each do |mahasiswa|
      mahasiswa.role = 'mahasiswa'
    end
  end
end

class CreateDosens < ActiveRecord::Migration[5.0]
  def self.up
    create_table :dosens do |dosen|
    end

    Dosen.find_each do |dosen|
      dosen.role = 'dosen'
    end
  end
end

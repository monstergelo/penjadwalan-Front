class Mahasiswa < ApplicationRecord
  has_and_belongs_to_many :dosen
  has_and_belongs_to_many :topik
end

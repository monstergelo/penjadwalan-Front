class Dosen < ApplicationRecord
  has_and_belongs_to_many :mahasiswa
  has_and_belongs_to_many :topik
end

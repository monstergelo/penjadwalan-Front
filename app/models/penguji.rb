class Penguji < ApplicationRecord
  belongs_to :mahasiswas, foreign_key: 'mahasiswa_id'
  belongs_to :dosen, foreign_key: 'dosen_id'
end

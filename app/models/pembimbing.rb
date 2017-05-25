class Pembimbing < ApplicationRecord
  belongs_to :mahasiswa, foreign_key: 'mahasiswa_id'
  belongs_to :dosen, foreign_key: 'dosen_id'
end

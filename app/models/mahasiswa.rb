class Mahasiswa < ApplicationRecord
  has_many :pengujis, foreign_key: 'mahasiswa_id'
  has_many :pembimbings, foreign_key: 'mahasiswa_id'
  has_one :scheduled_event, foreign_key: 'student_id'
end

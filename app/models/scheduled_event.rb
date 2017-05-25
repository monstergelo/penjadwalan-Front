class ScheduledEvent < ApplicationRecord
  belongs_to :mahasiswa, foreign_key: 'student_id'
  belongs_to :pembimbing, foreign_key: 'pembimbing_id'
  belongs_to :penguji, foreign_key: 'penguji_id'
  belongs_to :room, foreign_key: 'room_id'
end

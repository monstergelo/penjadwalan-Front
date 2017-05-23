class ScheduledEvent < ApplicationRecord
  belongs_to :mahasiswa, foreign_key: 'student_id'
  belongs_to :room, foreign_key: 'room_id'
end

class Room < ApplicationRecord
  has_many :scheduled_events, foreign_key: 'room_id'
end

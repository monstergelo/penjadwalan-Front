class Event < ApplicationRecord
  belongs_to :dosen, foreign_key: 'owner_id'
end

class Dosen < ApplicationRecord
  has_many :pengujis, foreign_key: 'dosen_id'
  has_many :pembimbings, foreign_key: 'dosen_id'
  has_many :events, foreign_key: 'owner_id'
end

class Dosen < User
  has_many :pengujis, foreign_key: 'dosen_id'
  has_many :pembimbings, foreign_key: 'dosen_id'
  has_many :events, foreign_key: 'owner_id'
  has_one :user, as: :member
end

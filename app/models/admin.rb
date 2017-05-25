class Admin < User
  has_one :user, as: :member
end
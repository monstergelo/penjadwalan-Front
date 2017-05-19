json.extract! dosen, :id, :NIP, :nama, :email, :created_at, :updated_at
json.url dosen_url(dosen, format: :json)

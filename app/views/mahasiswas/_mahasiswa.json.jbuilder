json.extract! mahasiswa, :id, :NIM, :nama, :email, :kategori, :created_at, :updated_at
json.url mahasiswa_url(mahasiswa, format: :json)

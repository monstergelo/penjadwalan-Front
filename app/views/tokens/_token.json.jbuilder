json.extract! token, :id, :owner_id, :token_json, :created_at, :updated_at
json.url token_url(token, format: :json)

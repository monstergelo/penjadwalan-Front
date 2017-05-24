json.extract! event, :id, :start, :end, :name, :event_id, :event_type, :owner_id, :created_at, :updated_at
json.url event_url(event, format: :json)

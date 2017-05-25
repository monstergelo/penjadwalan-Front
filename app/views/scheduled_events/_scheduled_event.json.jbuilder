json.extract! scheduled_event, :id, :end, :start, :student_id, :room_id, :event_type, :event_name, :created_at, :updated_at
json.url scheduled_event_url(scheduled_event, format: :json)

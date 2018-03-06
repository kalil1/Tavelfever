json.extract! trip, :id, :name, :date, :length, :checklist_id, :location, :created_at, :updated_at
json.url trip_url(trip, format: :json)

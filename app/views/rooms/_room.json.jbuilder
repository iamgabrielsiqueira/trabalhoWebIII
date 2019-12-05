json.extract! room, :id, :number, :description, :status, :room_type_id, :created_at, :updated_at
json.url room_url(room, format: :json)

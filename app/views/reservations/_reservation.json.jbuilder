json.extract! reservation, :id, :start_date, :end_date, :price, :description, :room_id, :user_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)

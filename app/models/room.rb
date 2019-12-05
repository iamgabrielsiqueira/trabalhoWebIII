class Room < ApplicationRecord
  belongs_to :room_type

  def to_s
    "Room #{self.number} - R$ #{self.room_type.price}"
  end
end

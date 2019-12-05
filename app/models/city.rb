class City < ApplicationRecord
  belongs_to :state
  has_many :user
end
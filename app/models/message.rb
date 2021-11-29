class Message < ApplicationRecord
  belongs_to :room
  validates :room_id, :content, presence: true
end

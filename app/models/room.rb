class Room < ApplicationRecord
  belongs_to :recipient
  belongs_to :post
end

class Request < ApplicationRecord
  belongs_to :recipient
  belongs_to :post
end

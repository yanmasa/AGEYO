class Relationship < ApplicationRecord
  belongs_to :recipient
  belongs_to :contributor

end

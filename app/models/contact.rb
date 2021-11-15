class Contact < ApplicationRecord
  enum subject: { registration: 0, withdrawal: 1, others: 2 }
end

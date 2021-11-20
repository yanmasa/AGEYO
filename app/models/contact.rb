class Contact < ApplicationRecord
  enum subject: { 新規登録希望: 0, 退会希望: 1, その他: 2 }
end

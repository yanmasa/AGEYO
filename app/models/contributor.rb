class Contributor < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :followers, through: :relationships, source: :recipient
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
end

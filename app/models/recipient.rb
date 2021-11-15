class Recipient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :stocks, through: :favorites, source: :post
  has_many :requests, dependent: :destroy
  has_many :askings, through: :requests, source: :post
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :contributor
  has_many :rooms

  def follow(parameter)
    self.relationships.create(contributor_id: parameter)
  end

  def unfollow(parameter)
    self.relationships.find_by(contributor_id: parameter).destroy
  end

  def following?(contributor)
    self.followings.include?(contributor)
  end
end

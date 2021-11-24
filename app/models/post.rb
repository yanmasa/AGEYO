class Post < ApplicationRecord
  belongs_to :contributor
  has_many :favorites, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :requesters, through: :requests, source: :recipient
  has_many :rooms
  attachment :post_image

  validates :contributor_id, :genre, :title, :status, :prefecture, presence: true

  enum prefecture: {
    指定地域なし:1,
    北海道:2,青森県:3,岩手県:4,宮城県:5,秋田県:6,山形県:7,福島県:8,
    茨城県:9,栃木県:10,群馬県:11,埼玉県:12,千葉県:13,東京都:14,神奈川県:15,
    新潟県:16,富山県:17,石川県:18,福井県:19,山梨県:20,長野県:21,
    岐阜県:22,静岡県:23,愛知県:24,三重県:25,
    滋賀県:26,京都府:27,大阪府:28,兵庫県:29,奈良県:30,和歌山県:31,
    鳥取県:32,島根県:33,岡山県:34,広島県:35,山口県:36,
    徳島県:37,香川県:38,愛媛県:39,高知県:40,
    福岡県:41,佐賀県:42,長崎県:43,熊本県:44,大分県:45,宮崎県:46,鹿児島県:47,沖縄県:48
  }

  enum status: {
    非公開:1, 公開:2,決定済み:3
  }

  enum genre: {
    その他:1, 寄付:2, 活動:3
  }

  def favorited_by?(recipient)
    favorites.where(recipient_id: recipient.id).exists?
  end

  def requested_by?(recipient)
    requests.where(recipient_id: recipient.id).exists?
  end

  def created_rooms?(recipient)
    rooms.where(recipient_id: recipient.id).exists?
  end

  def self.search(name, title, prefecture, genre)
    posts = Post.where(status: '公開').order(updated_at: :desc)
    if name.present?
      posts = posts.includes(:contributor).joins(:contributor).where('nickname LIKE?', "%#{name}%")
    end
    if title.present?
      posts = posts.where('title LIKE?', "%#{title}%")
    end
    if genre.present?
      posts = posts.where(genre: genre)
    end
    if prefecture == '1'
      posts
    else
      posts =  posts.where(prefecture: [prefecture, 1])
    end
  end

  def self.search_contributor_post(title, prefecture, genre, status)
    posts = self.order(updated_at: :desc)
    if title.present?
      posts = posts.where('title LIKE?', "%#{title}%")
    end
    if genre.present?
      posts = posts.where(genre: genre)
    end
    if status.present?
      posts = posts.where(status: status)
    end
    if prefecture == '1'
      posts
    else
      posts =  posts.where(prefecture: [prefecture, 1])
    end
  end
end

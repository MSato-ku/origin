class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy #追記 ユーザーが削除されたら、イベントも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  has_many :tweets, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  has_many :group_users

  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

  # group_usersは中間テーブル
  has_many:groups, through: :group_users,dependent: :destroy
  # グループオーナー表示のため
  has_many :owned_groups, class_name: "Group"

  has_many :comments, dependent: :destroy
  
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  mount_uploader :image, ImageUploader
end

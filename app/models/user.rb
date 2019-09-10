class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true

  has_many :to_requests, -> { where(status: 'pending') }, class_name: "Request", foreign_key: :to_id, dependent: :destroy
  has_many :from_requests, -> { where(status: 'pending') }, class_name: "Request", foreign_key: :from_id, dependent: :destroy
  has_many :accepted_to_requests, -> { where(status: 'accepted') }, class_name: "Request", foreign_key: :to_id, dependent: :destroy
  has_many :accepted_from_requests, -> { where(status: 'accepted') }, class_name: "Request", foreign_key: :from_id, dependent: :destroy
  
  has_many :pending_to_friends, through: :to_requests, source: :from_user
  has_many :pending_from_friends, through: :from_requests, source: :to_user
  has_many :to_friends, through: :accepted_to_requests, source: :from_user
  has_many :from_friends, through: :accepted_from_requests, source: :to_user
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  mount_uploader :picture, PictureUploader

  #after_create :send_welcome_email

  def friends
    to_friends + from_friends
  end

  def timeline_feed
    Post.where("user_id IN (:to_friend_ids) OR user_id IN (:from_friend_ids) OR user_id = :id", to_friend_ids: to_friend_ids, from_friend_ids: from_friend_ids, id: id).order(created_at: :desc)
  end

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

end 

class Post < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
    has_many :likes, dependent: :destroy
    has_many :users_liked, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    validates :content, presence: true
    mount_uploader :picture, PictureUploader
end

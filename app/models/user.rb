class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true

  has_many :to_requests, -> { where(status: 'pending') }, class_name: "Request", foreign_key: :to_id
  has_many :from_requests, -> { where(status: 'pending') }, class_name: "Request", foreign_key: :from_id
  has_many :accepted_to_requests, -> { where(status: 'accepted') }, class_name: "Request", foreign_key: :to_id
  has_many :accepted_from_requests, -> { where(status: 'accepted') }, class_name: "Request", foreign_key: :from_id
  
  has_many :pending_to_friends, through: :to_requests, source: :from_user
  has_many :pending_from_friends, through: :from_requests, source: :to_user
  has_many :to_friends, through: :accepted_to_requests, source: :from_user
  has_many :from_friends, through: :accepted_from_requests, source: :to_user

  def friends
    to_friends + from_friends
  end

end 

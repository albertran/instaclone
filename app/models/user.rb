class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  has_many :posts, dependent: :destroy # user can have many posts, if user is deleted, so are their posts
  has_many :comments, dependent: :destroy # user can have many comments, if user is deleted, so are their comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

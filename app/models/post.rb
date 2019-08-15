# this is the model of the page we will see from making a post, taken from benwalks tutorial
class Post < ApplicationRecord
    validates :user_id, presence: true
    belongs_to :user
    has_many :comments, dependent: :destroy # posts can have many comments, if post is destroyed, so are the comments
    validates :comment_content, length: {minimum: 3, maximum: 300}
    validates :content, length: {minimum: 3, maximum: 300}
    validates :caption, length: {minimum: 3, maximum: 300}# ^ check up on these 3
    validates :image ,presence: true
    has_attached_file :image, styles:{:medium=>"640x"}
    validates_attachment_content_type :image, :content_type =>
/\Aimage\/.*\Z/
end

# this is the model of the page we will see from making a post, taken from benwalks tutorial
class Post < ApplicationRecord
    validates :image ,presence: true
    has_attached_file :image, styles:{:medium=>"640x"}
    validates_attachment_content_type :image, :content_type =>
/\Aimage\/.*\Z/
end

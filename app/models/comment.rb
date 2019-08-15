# this model is for comments
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

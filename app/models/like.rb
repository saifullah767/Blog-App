class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # Method that updates the likes counter for a post.
  after_save :update_likes_counter

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end

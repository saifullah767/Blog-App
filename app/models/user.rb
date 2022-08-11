class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  # Method that returns the 3 most recent posts for a given user.

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
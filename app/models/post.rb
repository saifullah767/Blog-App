class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Method that updates the posts counter for a user.

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end

  # Method which returns the 5 most recent comments for a given post.

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end
end

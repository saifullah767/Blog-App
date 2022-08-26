class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :image, presence: true
  validates :bio, presence: true
  validates :posts_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.find_most_recent_post(user_id)
    Post.where(author_id: user_id).last(3)
  end
end

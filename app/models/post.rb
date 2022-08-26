class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create do
    update_post
  end

  def update_post
    if author.posts_counter.nil?
      author.update(posts_counter: 1)
    else
      author.increment!(:posts_counter)
    end
  end

  def self.find_most_recent_comments(post_id)
    Comment.where(post_id: post_id).last(5)
  end
end

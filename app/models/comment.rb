class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  # Update comments counter
  after_create do
    update_comment_counter
  end

  def update_comment_counter
    if post.comments_counter.nil?
      post.update(comments_counter: 1)
    else
      post.increment!(:comments_counter)
    end
  end
end

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # method that updates the comments counter for a post.


  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end

end

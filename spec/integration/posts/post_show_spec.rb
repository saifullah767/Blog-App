require 'rails_helper'

RSpec.describe 'User post show page', type: :feature do
  before(:all) do
    @user1 = User.create(name: 'Tom', photo: 'https://w7.pngwing.com/pngs/563/269/png-transparent-tom-cat-tom-and-jerry-cat-mammal-animals-cat-like-mammal.png',
                         bio: 'Teacher from Mexico.', post_counter: 0)

    @post1 = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post',
                         comments_counter: 0, likes_counter: 0)
    @comment1 = Comment.create(post_id: @post1.id, author_id: @user1.id,
                               text: 'This is my first comment')
    @comment1.update_comments_counter
    @like1 = Like.create(post_id: @post1.id, author_id: @user1.id)
    @like1.update_likes_counter
  end

  it "I can see the post's title." do
    visit "/users/#{@user1.id}/posts/#{@post1.id}"
    expect(page).to have_content(@post1.title)
  end

  it 'I can see who wrote the post.' do
    visit "/users/#{@user1.id}/posts/#{@post1.id}"
    expect(page).to have_content(@user1.name)
  end

  it 'I can see how many comments it has.' do
    visit "/users/#{@user1.id}/posts/#{@post1.id}"
    expect(page).to have_content('Comments:1')
  end

  it 'I can see how many likes it has.' do
    visit "/users/#{@user1.id}/posts/#{@post1.id}"
    expect(page).to have_content('Likes:1')
  end

  it 'I can see the post body.' do
    visit "/users/#{@user1.id}/posts/#{@post1.id}"
    expect(page).to have_content(@post1.text)
  end

  it 'I can see the username of each commentor.' do
    visit "/users/#{@user1.id}/posts/#{@post1.id}"
    expect(page).to have_content("Username: #{@user1.name}")
  end

  it 'I can see the comment each commentor left.' do
    visit "/users/#{@user1.id}/posts/#{@post1.id}"
    expect(page).to have_content(@comment1.text)
  end
end

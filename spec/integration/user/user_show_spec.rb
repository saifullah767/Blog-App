require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:all) do
    @user1 = User.create(name: 'Tom', photo: 'https://w7.pngwing.com/pngs/563/269/png-transparent-tom-cat-tom-and-jerry-cat-mammal-animals-cat-like-mammal.png',
                         bio: 'Teacher from Mexico.', post_counter: 0)
    @user2 = User.create(name: 'Lilly',
                         photo: 'https://yt3.ggpht.com/ytc/AMLnZu9ywtMiKhRf2B6F7Yfx1nrsZQW1TbknNbJuaYTbJg=s900-c-k-c0x00ffffff-no-rj',
                         bio: 'Teacher from Poland.', post_counter: 0)
  end

  it 'I can see the users profile picture.' do
    visit "/users/#{@user1.id}"
    expect(page).to have_css("img[@src='https://w7.pngwing.com/pngs/563/269/png-transparent-tom-cat-tom-and-jerry-cat-mammal-animals-cat-like-mammal.png']")
    visit "/users/#{@user2.id}"
    expect(page).to have_css("img[@src='https://yt3.ggpht.com/ytc/AMLnZu9ywtMiKhRf2B6F7Yfx1nrsZQW1TbknNbJuaYTbJg=s900-c-k-c0x00ffffff-no-rj']")
  end

  it 'I can see the username of all other users' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content('Tom')
    visit "/users/#{@user2.id}"
    expect(page).to have_content('Lilly')
  end

  it 'I can see the number of posts the user has written.' do
    first_post = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post',
                             comments_counter: 0, likes_counter: 0)
    first_post.update_posts_counter
    visit "/users/#{@user1.id}"
    expect(page).to have_content('Number of posts: 1')
    visit "/users/#{@user2.id}"
    expect(page).to have_content('Number of posts: 0')
  end

  it "I can see the user's bio." do
    visit "/users/#{@user1.id}"
    expect(page).to have_content('Bio')
    expect(page).to have_content('Teacher from Mexico.')
    visit "/users/#{@user2.id}"
    expect(page).to have_content('Bio')
    expect(page).to have_content('Teacher from Poland.')
  end

  it "I can see the user's first 3 posts." do
    @first_post = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post',
                              comments_counter: 0, likes_counter: 0)
    @second_post = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my second post',
                               comments_counter: 0, likes_counter: 0)
    @third_post = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my third post',
                              comments_counter: 0, likes_counter: 0)
    @fourth_post = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my fourth post',
                               comments_counter: 0, likes_counter: 0)

    visit "/users/#{@user1.id}"
    expect(page).to have_content('Post #', maximum: 3)
    visit "/users/#{@user2.id}"
    expect(page).to have_content('Post #', maximum: 3)
  end

  it "I can see a button that lets me view all of a user's posts." do
    @first_post = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post',
                              comments_counter: 0, likes_counter: 0)
    visit "/users/#{@user1.id}"
    expect(page).to have_button('See all posts')
  end

  it "When I click a user's post, it redirects me to that post's show page." do
    @first_post = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post',
                              comments_counter: 0, likes_counter: 0)
    visit "/users/#{@user1.id}"
    click_link("Post ##{@first_post.id}")
    expect(page).to have_content('This is my first post')
  end
end

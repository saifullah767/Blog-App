require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before do
    @user1 =  User.create(name: 'Tom', photo: 'https://w7.pngwing.com/pngs/563/269/png-transparent-tom-cat-tom-and-jerry-cat-mammal-animals-cat-like-mammal.png', bio: 'Teacher from Mexico.')
    @user2 =  User.create(name: 'Lilly', photo: 'https://yt3.ggpht.com/ytc/AMLnZu9ywtMiKhRf2B6F7Yfx1nrsZQW1TbknNbJuaYTbJg=s900-c-k-c0x00ffffff-no-rj', bio: 'Teacher from Poland.')

    @post1 = Post.create(author_id: @user1, title: 'Hello', text: 'This is my first post' )
    @post2 = Post.create(author_id: @user1, title: 'Hello', text: 'This is my second post' )
    @post3 = Post.create(author_id: @user1, title: 'Hello', text: 'This is my third post' )
    @post4 = Post.create(author_id: @user1, title: 'Hello', text: 'This is my fourth post' )

    @post5 = Post.create(author_id: @user2, title: 'Hello', text: 'This is my first post' )
    @post6 = Post.create(author_id: @user2, title: 'Hello', text: 'This is my second post' )
    @post7 = Post.create(author_id: @user2, title: 'Hello', text: 'This is my third post' )
    @post8 = Post.create(author_id: @user2, title: 'Hello', text: 'This is my fourth post' )

    visit user_path
  end

  
  it 'all the content is rendering in the users page' do
    expect(page).to have_content('This is for all users')
    expect(page).to have_content('Tom')
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content('Teacher from Mexico.')
    expect(page).to have_xpath("//img[@src='https://yt3.ggpht.com/ytc/AMLnZu9ywtMiKhRf2B6F7Yfx1nrsZQW1TbknNbJuaYTbJg=s900-c-k-c0x00ffffff-no-rj']")
  end

#   it 'shoud have last 3 posts' do
#     expect(page).to have_content(@post4.text)
#     expect(page).to have_content(@post5.text)
#     expect(page).to have_content(@post6.text)
#     posts = page.all('.post')
#     expect(posts.size).to eq(3)
#   end

#   it 'button to see all posts' do
#     within('button.detailsbtn') do
#       expect(page).to have_content('See all posts')
#     end
#   end

#   it 'link to post show and index' do
#     expect(page).to have_link(nil, href: user_post_path(@user2, @post4))
#     expect(page).to have_link(nil, href: user_post_path(@user2, @post5))
#     expect(page).to have_link(nil, href: user_post_path(@user2, @post6))
#     expect(page).to have_link(nil, href: user_posts_path(@user2))
#   end




end
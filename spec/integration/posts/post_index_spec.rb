require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
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


    @comment1 = Comment.create(post_id: @post5, author_id: @user2, text: 'Hi Tom!, This is my second comment' )
    @likes1 = Like.create(post_id: @post1, author_id: @user1)
    # visit user_posts_path(@user2)
  end

  # it 'all the content is rendering in the users page' do
  #   expect(page).to have_content('This is for specific user')
  #   expect(page).to have_content('Lilly')
  #   expect(page).to have_content('Number of posts: 4')
  #   expect(page).to have_xpath("//img[@src='https.photo.com']")
  # end

  # it 'shoud have 5 posts' do
  #   posts = page.all('.post')
  #   expect(posts.size).to eq(5)
  # end

#   it 'Each post has a title' do
#     expect(page).to have_content(@post2.title)
#     expect(page).to have_content(@post3.title)
#     expect(page).to have_content(@post4.title)
#     expect(page).to have_content(@post5.title)
#     expect(page).to have_content(@post6.title)
#   end

  it 'link to post show' do
    expect(page).to have_link(nil, href: user_post_path(@user2, @post2))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post3))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post4))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post5))
    expect(page).to have_link(nil, href: user_post_path(@user2, @post6))
  end

#   it 'Each post has a text' do
#     expect(page).to have_content(@post2.text)
#     expect(page).to have_content(@post3.text)
#     expect(page).to have_content(@post4.text)
#     expect(page).to have_content(@post5.text)
#     expect(page).to have_content(@post6.text)
#   end

#   it 'last comment is visible' do
#     expect(page).to have_content(@comment1.text)
#     expect(page).to have_content('Comments: 1')
#     expect(page).to have_content('Likes: 1')
#   end

#   it 'button to see all comments' do
#     within('button.detailsbtn') do
#       expect(page).to have_content('Pagination')
#     end
# end

end

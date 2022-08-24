require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before do
    @user1 = User.create(id: 1, name: 'Tom',
                         photo: 'https://w7.pngwing.com/pngs/563/269/png-transparent-tom-cat-tom-and-jerry-cat-mammal-animals-cat-like-mammal.png',
                         bio: 'Teacher from Mexico.')
    @user2 = User.create(id: 2, name: 'Lilly',
                         photo: 'https://yt3.ggpht.com/ytc/AMLnZu9ywtMiKhRf2B6F7Yfx1nrsZQW1TbknNbJuaYTbJg=s900-c-k-c0x00ffffff-no-rj',
                         bio: 'Teacher from Poland.')

    @post1 = Post.create(author_id: @user1, title: 'Hello', text: 'This is my first post')
    @post2 = Post.create(author_id: @user1, title: 'Hello', text: 'This is my second post')
    @post3 = Post.create(author_id: @user1, title: 'Hello', text: 'This is my third post')
    @post4 = Post.create(author_id: @user1, title: 'Hello', text: 'This is my fourth post')

    @comment1 = Comment.create(post_id: @post4.id, author_id: @user1.id, text: 'Hi Tom!, This is my first comment')

    @like1 = Like.create(post_id: @post1.id, author_id: @user1.id)
  end

  it 'I can see the users profile picture.' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_xpath("//img[@src='https://w7.pngwing.com/pngs/563/269/png-transparent-tom-cat-tom-and-jerry-cat-mammal-animals-cat-like-mammal.png']")
  end

  it 'I can see the users username.' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content('Tom')
  end

  it 'I can see the number of posts the user has written.' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content('Number of posts: 4')
  end

  it 'I can see a posts title.' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content('Post #', count: 4)
  end

  it 'I can see some of the posts body.' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content('Likes:0', count: 3)
  end

  it 'I can see the first comments on a post.' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content(@comment1.text)
  end

  it 'I can see how many comments a post has.' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content('Comments:0')
  end

  it 'I can see how many likes a post has.' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content('Likes:1')
  end

  it 'I can see a section for pagination if there are more posts than fit on the view.' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_button('Paginations')
  end
end

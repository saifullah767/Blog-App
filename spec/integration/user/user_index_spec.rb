require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before do
    @user1 =  User.create(name: 'Tom', photo: 'https://w7.pngwing.com/pngs/563/269/png-transparent-tom-cat-tom-and-jerry-cat-mammal-animals-cat-like-mammal.png', bio: 'Teacher from Mexico.')
    @user2 =  User.create(name: 'Lilly', photo: 'https://yt3.ggpht.com/ytc/AMLnZu9ywtMiKhRf2B6F7Yfx1nrsZQW1TbknNbJuaYTbJg=s900-c-k-c0x00ffffff-no-rj', bio: 'Teacher from Poland.')

    
    Post.create(author_id: @user1, title: 'Hello', text: 'This is my first post' )
    Post.create(author_id: @user1, title: 'Hello', text: 'This is my second post' )
    Post.create(author_id: @user1, title: 'Hello', text: 'This is my third post' )
    Post.create(author_id: @user1, title: 'Hello', text: 'This is my fourth post' )

    Post.create(author_id: @user2, title: 'Hello', text: 'This is my first post' )
    Post.create(author_id: @user2, title: 'Hello', text: 'This is my second post' )
    Post.create(author_id: @user2, title: 'Hello', text: 'This is my third post' )
    Post.create(author_id: @user2, title: 'Hello', text: 'This is my fourth post' )

    visit users_path
  end

  it 'all the content is rendering in the users page' do
    expect(page).to have_content('This is for all users')
    expect(page).to have_content('Tom')
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Number of posts: 4')
  end

  it 'Checking images' do
    expect(page).to have_xpath("//img[@src='https://w7.pngwing.com/pngs/563/269/png-transparent-tom-cat-tom-and-jerry-cat-mammal-animals-cat-like-mammal.png']")
    expect(page).to have_xpath("//img[@src='https://yt3.ggpht.com/ytc/AMLnZu9ywtMiKhRf2B6F7Yfx1nrsZQW1TbknNbJuaYTbJg=s900-c-k-c0x00ffffff-no-rj']")
  end

  it 'user links' do
    # expect(page).to have_link(nil, href: users_path(@user1))
    # expect(page).to have_link(nil, href: user_path(@user2))
    # expect(page).to have_link(nil, href: user_path(@user3))
  end

end
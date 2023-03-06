require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:user1) { create(:user, name: 'John Doe', photo: 'clement-m-F_-0BxGuVvo-unsplash.jpg') }
  let!(:post1) { create(:post, author: user1, title: 'Post 1')}
  before { visit user_posts_path(user1) }

  it 'displays usernames of all other users' do
    expect(page).to have_content(user1.name)
  end

  it 'displays profile picture for each user' do
    expect(all("img.user-avatar").count).to eq(1)
  end

  it 'displays number of posts each user has written' do
    create_list(:post, 2, author: user1)

    visit user_path(user1)
     
    expect(page).to have_content("3 posts")
  end

  it 'display post title' do
    expect(page).to have_content(post1.title)
  end

  it 'display post text' do
    expect(page).to have_content(post1.text)
  end
  
  it 'displays the post first 3 comments and how many comments are in a post' do
    comment1 = create(:comment, author: user1, post:post1)
    comment2 = create(:comment, author: user1, post:post1)
    comment3 = create(:comment, author: user1, post:post1)
  
    visit user_posts_path(user1)
  
    expect(page).to have_content("Lorem ipsum dolor sit amet.", count: 3)
    expect(page).to have_content('3 comments')
  end

  it 'display the number of likes the post has' do
    expect(page).to have_content('0 likes')
  end

  it 'dispaly pagination button' do

    expect(page).to have_css(".recent-posts input[value='Pagination']")
  end

  it 'redirects to post show page' do
    click_link('Post 1')
    expect(current_path).to eq(user_post_path(user1, post1))
  
  end
end
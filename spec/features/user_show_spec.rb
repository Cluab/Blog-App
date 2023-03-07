require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:user1) { create(:user, name: 'John Doe', photo: 'clement-m-F_-0BxGuVvo-unsplash.jpg') }

  before { visit user_path(user1) }

  it 'displays usernames of all other users' do
    expect(page).to have_content(user1.name)
  end

  it 'displays profile picture for each user' do
    expect(all('img.user-avatar').count).to eq(1)
  end

  it 'displays number of posts each user has written' do
    create_list(:post, 2, author: user1)

    visit user_path(user1)

    expect(page).to have_content('2 posts')
  end

  it 'display user bio' do
    expect(page).to have_content(user1.bio)
  end

  it 'I can see the users first 3 posts.' do
    create_list(:post, 3, author: user1)

    visit user_path(user1)

    expect(page).to have_css('div.recent-posts .post', count: 3)
  end

  it 'dispaly users posts button' do
    expect(page).to have_css(".recent-posts input[value='See All Posts']")
  end

  it 'redirects to post show page' do
    post1 = create(:post, author: user1, title: 'Post 1')

    visit user_path(user1)

    click_link('Post 1')
    expect(current_path).to eq(user_post_path(user1, post1))
  end

  it 'redirects to the user show page when a user is clicked' do
    create(:post, author: user1, title: 'Post 1')

    visit user_path(user1)
    click_on('See All Posts')
    expect(current_path).to eq(user_posts_path(user1))
  end
end

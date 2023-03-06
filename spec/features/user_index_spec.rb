require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:user1) { create(:user, name: 'John Doe', photo: 'clement-m-F_-0BxGuVvo-unsplash.jpg') }
  let!(:user2) { create(:user, name: 'Jane Doe', photo: 'clement-m-F_-0BxGuVvo-unsplash.jpg') }

  before { visit users_path }

  it 'displays usernames of all other users' do
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  it 'displays profile picture for each user' do
    expect(all("img.user-avatar").count).to eq(2)
  end

  it 'displays number of posts each user has written' do
    create(:post, author: user1)
    create_list(:post, 2, author: user2)

    visit users_path

    expect(page).to have_content("1 post")
    expect(page).to have_content("2 posts")
  end

  it 'redirects to the user show page when a user is clicked' do
    click_link(user1.name)
    expect(current_path).to eq(user_path(user1))
  end
end
require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'A' * 251, likes_count: -1, comments_count: -1) }

  it 'should be invalid if title is blank' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'should be invalid if title is longer than 250 characters' do
    subject.title = 'A' * 251
    expect(subject).to_not be_valid
  end

  it 'should be invalid if likes_count is less than 0' do
    subject.likes_count = -1
    expect(subject).to_not be_valid
  end

  it 'should be invalid if comments_count is less than 0' do
    subject.comments_count = -1
    expect(subject).to_not be_valid
  end

  describe '#recent_comments' do
    let(:user) { create(:user) }
    let(:post) { create(:post, author: user) }
    let!(:comment1) { create(:comment, post: post, author_id: user.id, created_at: 1.day.ago) }
    let!(:comment2) { create(:comment, post: post, author_id: user.id, created_at: 2.day.ago) }
    let!(:comment3) { create(:comment, post: post, author_id: user.id, created_at: 3.day.ago) }

    it 'returns the most recent comments, up to the limit specified' do
      expect(post.recent_comments(2)).to eq([comment1, comment2])
      expect(post.recent_comments(1)).to eq([comment1])
    end

    it 'returns all comments if the limit is greater than the total number of comments' do
      expect(post.recent_comments(5)).to eq([comment1, comment2, comment3])
    end
  end

  describe '#increment_count!' do
    let!(:post) { create(:post) }

    it 'increments the likes count by 1' do
      expect { post.increment_likes_count! }.to change { post.likes_count }.by(1)
    end
    it 'increments the comments count by 1' do
      expect { post.increment_comments_count! }.to change { post.comments_count }.by(1)
    end
  end
end

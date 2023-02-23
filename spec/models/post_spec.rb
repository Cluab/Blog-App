require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'A' * 251, likes_count: -1, comments_count: -1) }

  it 'should be invalid if title is blank' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'should be invalid if title is longer than 250 characters' do
    expect(subject).to_not be_valid
  end

  it 'should be invalid if likes_count is less than 0' do
    expect(subject).to_not be_valid
  end

  it 'should be invalid if comments_count is less than 0' do
    expect(subject).to_not be_valid
  end
end

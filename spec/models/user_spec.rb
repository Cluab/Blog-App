require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Lilly', photo: 'https://example.com/image.jpg', bio: 'Teacher from Poland.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post count should be equal to or greater than 0' do
    subject.posts_count = -1
    expect(subject).to_not be_valid
  end

  it 'post count should be a number' do
    subject.posts_count = 'hello'
    expect(subject).to_not be_valid
  end
end

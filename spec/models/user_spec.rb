RSpec.describe User, type: :model do
  subject { build(:user, name: 'Lilly') }

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

  describe '#increment_posts_count!' do
    it 'increments the posts count by 1' do
      expect { subject.increment_posts_count! }.to change { subject.posts_count }.by(1)
    end
  end

  describe '#recent_posts' do
    let(:user) { create(:user) }
    let!(:post1) { create(:post, author: user, created_at: 3.days.ago) }
    let!(:post2) { create(:post, author: user, created_at: 2.days.ago) }
    let!(:post3) { create(:post, author: user, created_at: 1.day.ago) }

    it 'returns the most recent posts' do
      expect(user.recent_posts).to eq([post3, post2, post1])
    end

    it 'limits the number of recent posts' do
      expect(user.recent_posts(2)).to eq([post3, post2])
    end
  end
end

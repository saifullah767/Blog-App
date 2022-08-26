require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(author_id: 123, post_id: 40, text: 'Post content') }

  before { subject.save }

  it 'post id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'author id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end

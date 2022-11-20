require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.new(name: 'asff')
    Group.new(user: @user, name: 'new', icon: 'www.icon.com')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end

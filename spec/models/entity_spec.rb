require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    @user = User.create(name: 'test')
    Entity.new(user: @user, name: 'test', amount: '12.00')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end

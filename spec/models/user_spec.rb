require 'rails_helper'

RSpec.describe User, type: :model do
  # Describe block - describing a unit test (validations, associations, class methods, etc...)
  # Context block - testing in a different context ( as user, as admin, as viewer, etc...)
  before(:each) do
    @user = User.create(email: 'test@test.com', password: 'password', first_name: 'Test', last_name: 'Tester')
  end


  describe 'validations' do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
  end

  describe '#info' do
    it 'returns email with dign in count' do
      expect(@user.info).to eq("#{@user.email} has signed in: #{@user.sign_in_count} times")
    end
  end

  describe '#full_name' do
    it 'returns users name like last_name, first_name' do
      expect(@user.full_name).to eq("#{@user.last_name}, #{@user.first_name}")
    end
  end

  describe '#display_name' do
    it 'returns users name like <first_name> <last_name>' do
      expect(@user.display_name).to eq("#{@user.first_name} #{@user.last_name}")
    end
  end

  describe '#has_signed_in?' do
    it 'returns true if sign_in_count > 0' do
      @user.update(sign_in_count: 1)
      expect(@user.has_signed_in?).to eq(true)
    end
    
    it 'returns false if sign_in_count == 0' do
      expect(@user.has_signed_in?).to eq(false)
    end
  end
end
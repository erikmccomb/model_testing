require 'rails_helper'

RSpec.describe User, type: :model do
  # Describe block - describing a unit test (validations, associations, class methods, etc...)
  # Context block - testing in a different context ( as user, as admin, as viewer, etc...)
  describe 'validations' do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
  end
end
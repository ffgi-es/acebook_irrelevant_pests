require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }
  
  it 'has a secure password' do
    user = User.create({ first_name: 'Jonathan', last_name: 'Palma', email: 'jonathan@gmail.com', password_digest: 1234 })
    assert_respond_to user, :password_digest
    assert_respond_to user, :authenticate, "User requires has_secure_password"
  end
end

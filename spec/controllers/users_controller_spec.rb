require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    it 'renders the page without error and redirects to their profile' do
      post :create, params: { first_name: 'Jonathan', last_name: 'Palma', email: 'jonathan@gmail.com', password: 1234 }
      expect(User.find_by({ email: 'jonathan@gmail.com' })).to be
      # post :create, first_name: 'Jonathan', last_name: 'Palma', email: 'jonathan@gmail.com', password: 1234
    end
  end
end

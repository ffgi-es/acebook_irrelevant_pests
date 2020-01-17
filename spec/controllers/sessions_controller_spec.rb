require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'Session #create' do
    it 'checks the password is correct' do
      User.create({ first_name: 'Jonathan', 
                    last_name: 'Palma', 
                    email: 'jonathan@gmail.com', 
                    password: "1234677" })
      post :create, params: { email: 'jonathan@gmail.com', password: 'wrong' }
      expect(response).to redirect_to(new_session_path)
    end
  end
end

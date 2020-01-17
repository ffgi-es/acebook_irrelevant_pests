require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST #create' do
    it 'renders the page without error and redirects to their profile' do
      post :create, params: { first_name: 'Jonathan', last_name: 'Palma', email: 'jonathan@gmail.com', password: "123456" }
      expect(User.find_by({ email: 'jonathan@gmail.com' })).to be
    end

    it 'redirects back to users/new if no name provided' do
      post :create, params: { first_name: '', last_name: 'Palma', email: 'jonathan@example.com', password: "1234567" }
      expect(User.find_by({ email: 'jonathan@example.com' })).not_to be
      expect(response).to redirect_to(new_user_path)
    end

    it 'redirects back to users/new if no last name provided' do
      post :create, params: { first_name: 'Jonathan', last_name: '', email: 'jonathan@example.com', password: "123456" }
      expect(User.find_by({ email: 'jonathan@example.com' })).not_to be
      expect(response).to redirect_to(new_user_path)
    end
  end

  describe "email validation" do
    it 'redirects back to new user form' do
      post :create, params: { first_name: 'Jonathan', last_name: 'Alastair', email: 'jon..al@example.com', password: "1234567" }
      expect(User.find_by({ email: 'jon..al@example.com' })).not_to be
      expect(response).to redirect_to(new_user_path)
    end
  end

  describe "password validation" do
    it 'redirects back to new user form if below 6 characters' do
      post :create, params: { first_name: 'Jonathan', last_name: 'Alastair', email: 'jonathan@example.com', password: "1234" }
      expect(User.find_by({ email: 'jonathan@example.com' })).not_to be
      expect(response).to redirect_to(new_user_path)
    end

    it 'redirects back to the user form if above 10 characters' do
      post :create, params: { first_name: 'Jonathan', last_name: 'Alastair', email: 'jonathan@example.com', password: "12345678901" }
      expect(User.find_by({ email: 'jonathan@example.com' })).not_to be
      expect(response).to redirect_to(new_user_path)
    end

    it 'checks if the password equals the password confirmation' do
      post :create, params: { first_name: 'Jonathan', 
                              last_name: 'Alastair', 
                              email: 'jonathan@example.com', 
                              password: '12345678',
                              password_confirmation: '12344678' }
      expect(User.find_by({ email: 'jonathan@example.com' })).not_to be
      expect(response).to redirect_to(new_user_path)
    end
  end
end

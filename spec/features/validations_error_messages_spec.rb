describe 'Sign up Validation Error messages', type: :feature do
  
  describe 'No first name' do

    it 'should say the first name is required' do
      sign_up first_name: ''

      expect(page).to have_content 'First name must not be blank'
    end
  end

  describe 'No last name' do

    it 'should say the last name is required' do
      sign_up last_name: ''

      expect(page).to have_content 'Last name must not be blank'
    end
  end

  describe 'Invalid email' do

    it 'should say the email is invalid' do
      sign_up email: 'deb..-@gmail.com'

      expect(page).to have_content 'Email must be valid'
    end

    it 'should say email must not be blank' do
      sign_up email: ''

      expect(page).to have_content 'Email must not be blank'
    end
  end

  describe 'Invalid password' do
    
    it 'should say the password is too short' do
      sign_up password: '1234', password_confirmation: '1234'

      expect(page).to have_content 'Password must have between 6 and 10 characters'
    end

    it 'should say the password is too long' do
      sign_up password: '1234567890123', password_confirmation: '1234567890123'

      expect(page).to have_content 'Password must have between 6 and 10 characters'
    end

    it 'should say passwords are not the same' do
      sign_up password: '1234567', password_confirmation: '1234567890123'

      expect(page).to have_content 'Password confirmation does not match'
    end
  end
end

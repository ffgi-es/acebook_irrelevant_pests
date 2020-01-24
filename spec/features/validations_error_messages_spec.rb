describe 'Sign up Validation Error messages', type: :feature do

  before do
    visit root_path
  end
  
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

  describe 'Multiple errors' do
    
    it 'should show first name error first' do
      sign_up first_name: '', email: 'deb..-@gmail.com'

      expect(page).to have_content 'First name must not be blank'
      expect(page).not_to have_content 'Email must be valid'
    end

    it 'should keep prior input' do
      sign_up first_name: '', last_name: 'Bingo', email: 'deb..-@gmail.com', password: '123456', password_confirmation: '123456'

      expect(find('#user_last_name').value).to eq 'Bingo'
      expect(find('#user_email').value).to eq 'deb..-@gmail.com'
      expect(find('#user_password').value).to be_nil

      fill_in 'first_name', with: 'Dogo'
      click_on 'Submit'
      
      expect(find('#user_first_name').value).to eq 'Dogo'
      expect(page).not_to have_content 'First name must not be blank'
      expect(page).to have_content 'Email must be valid'
    end
  end
end

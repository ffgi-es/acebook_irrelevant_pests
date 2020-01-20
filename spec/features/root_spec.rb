describe 'root path', type: :feature do
  
  describe 'when not signed up' do

    it 'should show a welcome page' do
      visit root_path
      expect(page).to have_content 'Sign up'
      expect(page).to have_content 'Log in'
      expect(page).to have_current_path '/'
    end
  end

  describe 'when signed in' do
    
    it 'should redirect to the posts index' do
      sign_up
      visit root_path
      expect(page).to have_current_path posts_path
    end
  end
end

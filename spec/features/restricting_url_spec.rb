RSpec.describe 'Restricting URLs', type: :feature do
  describe 'Being restrictred when not logged in' do
    scenario 'trying to access a url and being redirected' do
      visit '/posts'
      expect(page).to have_current_path welcome_path
    end
  end
end

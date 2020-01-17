require_relative 'web_helpers'

RSpec.describe 'updating_posts', type: :feature do
  before do
    sign_up
    click_on 'New post'
    fill_in 'post_message', with: 'ilikethings' 
    click_button 'Submit' 
  end

  scenario 'User is taken to an update page' do
    click_on 'Delete' 
    
    expect(page).not_to have_content('ilikethings')
  end

  scenario "a user cannot delete another user's post" do
    click_on 'Log out'

    sign_up_2
    visit '/posts'
    click_on 'Delete'
    expect(page).to have_content 'ilikethings'
    expect(page).to have_content "You cannot delete another user's post"
  end
end

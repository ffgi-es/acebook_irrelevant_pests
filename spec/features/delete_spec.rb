require_relative '../web_helpers'

RSpec.describe "updating_posts", type: :feature do
  scenario 'User is taken to an update page' do
    sign_up
    click_on 'New post'
    fill_in "post_message", with: "ilikethings"
    click_button "Submit" 

    click_on "Delete" 
    
    expect(page).not_to have_content("ilikethings")
  end
end

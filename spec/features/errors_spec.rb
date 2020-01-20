require_relative 'web_helpers'

describe 'error_messages', type: :feature do
  before do
    sign_up
    click_on 'New post'
    fill_in "post_message", with: "ilikethings" 
    click_button "Submit" 
  end

  scenario 'error disappears after the user has viewed it' do
    click_on 'Log out'
    sign_up_2
    click_on 'Posts'

    
    click_on 'Edit'
    

    click_on 'Delete'
    expect(page).not_to have_content "You cannot update another user's post"
    expect(page).to have_content "You cannot delete another user's post"
  end
end

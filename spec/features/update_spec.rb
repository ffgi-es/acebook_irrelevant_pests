require_relative 'web_helpers'

RSpec.describe "updating_posts", type: :feature do
  before do
    sign_up
    click_on 'New post'
    fill_in "post_message", with: "ilikethings" 
    click_button "Submit" 
  end

  scenario 'User is taken to an update page' do
    click_on "Edit"
    expect(page).to have_content "Update Post"
  end

  scenario 'should change the message' do
    click_on "Edit" 

    fill_in "post_message", with: "ihatethings"

    click_on "Submit"

    expect(page).to have_content "ihatethings"
  end

  scenario "a user cannot update another user's post" do
    click_on 'Log out'

    sign_up_2
    visit '/posts'
    click_on 'Edit'
    
    expect(page).to have_content "You cannot update another user's post"
  end

  scenario 'a user cannot update a post after ten minutes' do
    Timecop.freeze(Time.now.utc + 600) do
      click_on 'Edit'

      expect(page).to have_content "Post can no longer be edited."
    end
  end

  scenario 'a user can update a post before ten minutes' do
    click_on 'Edit'
    expect(page).not_to have_content "Post can no longer be edited."
  end
end

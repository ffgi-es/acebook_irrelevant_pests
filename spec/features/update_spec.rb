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
    expect(page).to have_content("Update Post")
  end

  scenario 'should change the message' do
    click_on "Edit" 

    fill_in "post_message", with: "ihatethings"

    click_on "Submit"

    expect(page).to have_content("ihatethings") 
  end

end

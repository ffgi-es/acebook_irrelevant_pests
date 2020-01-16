require_relative '../web_helpers'

RSpec.describe "only viewing user's posts", typr: :feature do
  scenario 'a user can only see their posts on their profile' do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Heen's post"
    click_button "Submit"
    click_on 'Log out'

    sign_up_2
    click_link "New post"
    fill_in "Message", with: "Sam's post"
    click_button "Submit"
    click_on 'Log out'

    log_in

    expect(page).not_to have_content "Sam's post"
    expect(page).to have_content "Heen's post"

    click_on 'Log out'
    log_in_2

    expect(page).not_to have_content "Heen's post"
    expect(page).to have_content "Sam's post"
  end
end

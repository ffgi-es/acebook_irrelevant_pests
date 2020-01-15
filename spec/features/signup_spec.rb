RSpec.describe "signing up", type: :feature do
  scenario "a user can sign up" do 
    visit "/welcome"
    click_on "Sign up"
    fill_in "first_name", with: "heen"
    fill_in "last_name", with: "bean"
    fill_in "email", with: "bean@gmail.com"
    fill_in "password", with: "1234password"
    fill_in "confirm_password", with: "1234password"

    click_on "Submit"

    expect(page).to have_content("Welcome heen!")
  end
end

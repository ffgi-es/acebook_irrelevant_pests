require_relative 'web_helpers'

RSpec.describe "timeline_features", type: :feature do

  before do
    sign_up
  end

  scenario "posts should be displayed in reverse chronological order" do
    click_on "New post"
    fill_in "Message", with: "Hello!"
    click_button "Submit"

    time = Time.now.utc.strftime("%d/%m/%Y at %H:%M")

    click_on "New post"
    fill_in "Message", with: "Goodbye!"
    click_button "Submit"
    visit posts_path

    expect(page).to have_content("Goodbye! Posted by heen bean on #{time} Edit Delete Hello!")
  end

  scenario "posts should be displayed in reverse chronological order after being edited" do
    click_on "New post"
    fill_in "Message", with: "Hello!"
    click_button "Submit"

    time = Time.now.utc.strftime("%d/%m/%Y at %H:%M")

    click_on "New post"
    fill_in "Message", with: "Goodbye!"
    click_button "Submit"
    visit posts_path

    all('a', :text => 'Edit')[1].click

    fill_in "Message", with: "Hello, World!"
    click_button "Submit"
    visit posts_path 

    expect(page).to have_content("Goodbye! Posted by heen bean on #{time} Edit Delete Hello, World!")
  end

  scenario "posts should be displayed with line breaks if they have line breaks" do
    click_on "New post"
    fill_in "Message", with: "First Line\nSecond Line"
    click_on "Submit"

    expect(page).to have_content("First Line Second Line") 
  end
end

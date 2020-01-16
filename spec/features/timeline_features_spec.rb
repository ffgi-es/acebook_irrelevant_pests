RSpec.describe "Timeline Features", type: :feature do

  scenario "posts should be displayed in reverse chronological order" do
    visit "/posts"

    click_link "New post"
    fill_in "Message", with: "Hello!"
    click_button "Submit"

    time = Time.now.utc.strftime("%d/%m/%Y at %H:%M")

    click_link "New post"
    fill_in "Message", with: "Goodbye!"
    click_button "Submit"

    expect(page).to have_content("Goodbye! posted on #{time} Edit Hello!")
    
  end

  scenario "posts should be displayed in reverse chronological order after being edited" do
    visit "/posts"

    click_link "New post"
    fill_in "Message", with: "Hello!"
    click_button "Submit"

    time = Time.now.utc.strftime("%d/%m/%Y at %H:%M")

    click_link "New post"
    fill_in "Message", with: "Goodbye!"
    click_button "Submit"

    all('a', :text => 'Edit')[1].click

    fill_in "Message", with: "Hello, World!"
    click_button "Submit"

    expect(page).to have_content("Goodbye! posted on #{time} Edit Hello, World!")
    
  end

  scenario "posts should be displayed with line breaks if they have line breaks" do
    visit "/posts"

    click_link "New post"
    fill_in "Message", with: "First Line\nSecond Line"
    click_button "Submit"

    expect(page).to have_content("First Line Second Line")
    
  end

end

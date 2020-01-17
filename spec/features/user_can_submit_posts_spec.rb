require 'rails_helper'
require_relative 'web_helpers'

RSpec.feature "Timeline", type: :feature do
  before do
    sign_up
  end
  
  scenario "Can submit posts and view them" do
    click_on 'New post'
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end

require_relative 'web_helpers'

RSpec.describe 'Logging in', type: :feature do
  before do
    sign_up
  end

  scenario 'a user Logs in' do
    visit '/welcome'
    click_on 'Log in'
    fill_in 'email', with: "bean@gmail.com"
    fill_in 'password', with: 'password'
    click_on 'Log in'

    expect(page).to have_content 'Welcome heen!'
  end

  scenario 'a user Logs out' do
    log_in
    click_on 'Log out'

    expect(page).to have_content 'Welcome to Acebook'
  end
end

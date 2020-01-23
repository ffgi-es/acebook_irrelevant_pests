RSpec.describe 'chat rooms', type: :feature do
  before do
    sign_up
    click_on 'Log out'
    sign_up_2
    click_on 'Log out'
    log_in
  end

  scenario 'usrs can chat with eachother', js: true do
    click_on 'Acebook'

    second_window = open_new_window
    within_window second_window do
      log_in_2
      click_on 'Acebook'
      fill_in 'new_message', with: 'I am second user'
      click_on 'Send'
    end

    second_window.close

    expect(page).to have_content 'I am second user'
  end
end

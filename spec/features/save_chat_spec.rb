describe 'saving conversations', js: true do
  scenario 'Saves all the chat messages' do
    sign_up
    click_on 'Log out'
    sign_up_2
    click_on 'Log out'
    log_in
    click_on 'Acebook'
    
    fill_in 'new_message', with: 'Hey man'
    click_on 'Send'
    click_on 'Log out'
    log_in_2
    click_on 'Acebook'

    fill_in 'new_message', with: 'Hey, how is it going?'
    click_on 'Send'
    click_on 'Log out'
    log_in
    click_on 'Acebook'
    
    expect(page).to have_content "Hey man"
    expect(page).to have_content "Hey, how is it going?"
  end
end

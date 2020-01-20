describe 'viewing_other_users_walls', type: :feature do
  scenario 'A user wants to view another users wall' do
    sign_up
    click_on 'New post'
    fill_in 'Message', with: 'First post'
    click_on 'Submit'
    click_on 'Log out'
    sign_up_2
    click_on 'Home'
    
    click_on 'heen bean'
    expect(page).to have_content "heen's wall"
    expect(page).to have_content "First post"
    click_on 'Profile'
    click_on 'New post'
    fill_in 'Message', with: 'Second post'
    click_on 'Submit'
    expect(page).to have_content "Welcome Sam!"
    expect(page).not_to have_content "First post"
  end
end

RSpec.describe 'profile picture', type: :feature do
  scenario 'a user wants to set a profile picture' do
    sign_up
    post_picture_of_plane
    click_on 'Profile'
    click_on 'Settings'
    click_on 'New Profile Picture'
    
    expect(page).to have_css "img[src*='forest.jpeg']"

    attach_file "new_profile_picture", "spec/images/profile-picture.jpeg"
    click_on 'Set new profile picture'

    expect(page).to have_content 'Welcome heen!'
    expect(page).to have_css "img[src*='profile-picture.jpeg']"
  end
end

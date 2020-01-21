describe 'deleting photo', type: :feature do
  let(:user) { User.create first_name: "hisham", last_name: "balls", email: "hishamsballs@example.com", password: "123456" }

  before do
    log_in user
    click_on 'New photo'
    fill_in 'description', with: 'Plane in a forest'
    attach_file "image", "spec/images/forest.jpeg"
    click_on 'Upload'
  end

  scenario 'clicking on delete' do
    click_on 'Delete' 
    expect(page).to have_content "hisham's photos"
    expect(page).not_to have_css "img[src*='forest.jpeg']"
    expect(page).not_to have_content "Plane in a forest"
  end

  scenario 'trying to delete other peoples photos' do
    click_on 'Log out'
    sign_up
    visit "/users/#{user.id}/photos"
    click_on "Delete"
    expect(page).to have_content "You cannot edit other peoples photos"
    expect(page).to have_current_path "/users/#{user.id}/photos"
    expect(page).to have_css "img[src*='forest.jpeg']"
    expect(page).to have_content "Plane in a forest"
  end
end

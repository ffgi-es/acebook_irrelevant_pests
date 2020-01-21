describe 'editing photo description', type: :feature do
  scenario 'Clicking on edit and changing the description' do
    sign_up
    click_on 'New photo'
    fill_in 'description', with: 'Plane in a forest'
    attach_file "image", "spec/images/forest.jpeg"
    click_on 'Upload'

    click_on 'Edit'
    fill_in 'description', with: 'Plane in a wood'
    click_on 'Submit'

    expect(page).to have_content "heen's photos"
    expect(page).to have_css "img[src*='forest.jpeg']"
    expect(page).to have_content "Plane in a wood"
    expect(page).not_to have_content "Plane in a forest"
  end
end

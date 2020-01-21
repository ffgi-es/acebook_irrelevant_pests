describe 'uploading photo' do
  scenario 'User uploads a photo' do
    sign_up
    click_on 'New photo'
    attach_file "image", "spec/images/forest.jpeg"
    fill_in "description", with: "Plane in a forest"
    click_on "Upload"
    expect(page).to have_content "heen's photos"
    expect(page).to have_css "img[src*='forest.jpeg']"
    expect(page).to have_content "Plane in a forest"
  end
end

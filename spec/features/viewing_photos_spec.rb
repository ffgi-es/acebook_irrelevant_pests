describe 'viewing photo' do
  scenario 'User can view their own photos' do
    sign_up
    click_on 'New photo'
    attach_file "image", "spec/images/forest.jpeg"
    fill_in "description", with: "Plane in a forest"
    click_on "Upload"

    visit "/"
    click_on "Profile"
    click_on "View photos"

    expect(page).to have_css "img[src*='forest.jpeg']"
    expect(page).to have_content 'Plane in a forest'
  end

  scenario 'User can view another users photos' do
    sign_up
    click_on 'New photo'
    attach_file "image", "spec/images/forest.jpeg"
    fill_in "description", with: "Plane in a forest"
    click_on "Upload"

    visit "/"
    click_on "New post"
    click_on "Submit"

    logout

    sign_up_2
    visit "/"
    click_link "heen bean"
    click_on "View photos"

    expect(page).to have_css "img[src*='forest.jpeg']"
    expect(page).to have_content 'Plane in a forest'
  end
end

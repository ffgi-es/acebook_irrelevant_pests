describe 'Liking a Post', type: :feature do
  before do
    sign_up
    click_on 'New post'
    fill_in 'Message', with: 'Hello'
    click_on 'Submit'
  end
  
  scenario 'a user can like a post' do
    click_on 'Like'
    expect(page).to have_content 'Unlike'
    expect(page).not_to have_link 'Like'
    expect(page).to have_content '1 Like'
  end

  scenario 'a user can unlike a post' do
    click_on 'Like'
    click_on 'Unlike'
    expect(page).to have_content 'Like'
    expect(page).not_to have_link 'Unlike'
  end

  describe 'multiple likes' do
    scenario 'two user like a post' do
      click_on 'Like'
      click_on 'Log out'
      sign_up_2
      click_on 'Acebook'
      click_on 'Like'
      expect(page).to have_content '2 Likes'
      expect(page).to have_content 'Unlike'
    end
  end
end

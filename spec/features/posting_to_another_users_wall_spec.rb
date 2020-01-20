describe 'Posting to another users wall', type: :feature do
  it 'display the posts only on their wall' do
    user = User.create(first_name: 'Alastair',
                       last_name: 'Blam',
                       email: 'alastair@example.com',
                       password: '123456')
    sign_up
    visit user_path(user)
    click_on 'New post'

    fill_in 'Message', with: 'Hello!'
    click_on 'Submit'

    expect(page).to have_current_path user_path(user)
    expect(page).to have_content 'Hello!'

    visit posts_path

    expect(page).not_to have_content 'Hello!'

    click_on 'Profile'

    expect(page).not_to have_content 'Hello!'
  end
end

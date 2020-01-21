describe '404 page', type: :feature do
  it 'should say the user doesnt exist' do
    sign_up
    visit '/null'
    expect(page).to have_content "Sorry, that user can't be found."
  end
end

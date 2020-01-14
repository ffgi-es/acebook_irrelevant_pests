RSpec.describe "updating_posts", type: :feature do
    scenario 'User is taken to an update page' do
        visit '/posts/new'
        fill_in "post_message", with: "ilikethings"
        click_button "Submit" 

        click_on "edit" 

        expect(page).to have_content("Update Post")
    end


end
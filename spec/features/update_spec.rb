RSpec.describe "updating_posts", type: :feature do
    scenario 'User is taken to an update page' do
        visit '/posts/new'
        fill_in "post_message", with: "ilikethings"
        click_button "Submit" 

        click_on "edit" 
        p page.html
        expect(page).to have_content("Update Post")
    end

    scenario 'should change the message' do
        visit '/posts/new'
        fill_in "post_message", with: "ilikethings" 
        click_button "Submit" 

        click_on "edit" 

        fill_in "post_message", with: "ihatethings"

        click_on "Submit"
    
        expect(page).to have_content("ihatethings") 
    end


end
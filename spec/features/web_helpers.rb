def sign_up(first_name: 'heen', 
            last_name: 'bean',
            email: 'bean@gmail.com',
            password: 'password',
            password_confirmation: 'password')
  visit new_user_path
  fill_in 'first_name', with: first_name
  fill_in 'last_name', with: last_name
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation

  click_on 'Submit'
end

def log_in(user = nil)
  visit new_session_path
  fill_in 'email', with: user&.email || 'bean@gmail.com'
  fill_in 'password', with: user&.password || 'password'
  click_button 'Log in'
end

def sign_up_2
  visit new_user_path
  fill_in 'first_name', with: 'Sam'
  fill_in 'last_name', with: 'F'
  fill_in 'email', with: 'sam@example.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'

  click_on 'Submit'
end

def log_in_2
  visit new_session_path
  fill_in 'email', with: 'sam@example.com'
  fill_in 'password', with: 'password'
  click_button 'Log in'
end

def logout
  click_on 'Log out'
end

def post_picture_of_plane
  click_on 'New photo'
  attach_file 'image', 'spec/images/forest.jpeg'
  fill_in 'description', with: 'Plane in a forest'
  click_on 'Upload'
end

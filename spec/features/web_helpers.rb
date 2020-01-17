def sign_up(first_name: 'heen', 
            last_name: 'bean',
            email: 'bean@gmail.com',
            password: 'password',
            password_confirmation: 'password')
  visit root_path
  click_on "Sign up"
  fill_in "first_name", with: first_name
  fill_in "last_name", with: last_name
  fill_in "email", with: email
  fill_in "password", with: password
  fill_in "password_confirmation", with: password_confirmation

  click_on "Submit"
end

def log_in
  visit root_path
  click_on 'Log in'
  fill_in 'email', with: "bean@gmail.com"
  fill_in 'password', with: 'password'
  click_on 'Log in'
end

def sign_up_2
  visit root_path
  click_on "Sign up"
  fill_in "first_name", with: "Sam"
  fill_in "last_name", with: "F"
  fill_in "email", with: "sam@example.com"
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password"

  click_on "Submit"
end

def log_in_2
  visit root_path
  click_on 'Log in'
  fill_in 'email', with: "sam@example.com"
  fill_in 'password', with: 'password'
  click_on 'Log in'
end

def log_out
  click_on 'Log out'
end

def sign_up
  visit root_path
  click_on "Sign up"
  fill_in "first_name", with: "heen"
  fill_in "last_name", with: "bean"
  fill_in "email", with: "bean@gmail.com"
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password"

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

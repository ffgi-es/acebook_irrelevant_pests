def sign_up
  visit "/welcome"
  click_on "Sign up"
  fill_in "first_name", with: "heen"
  fill_in "last_name", with: "bean"
  fill_in "email", with: "bean@gmail.com"
  fill_in "password", with: "password"
  fill_in "confirm_password", with: "password"

  click_on "Submit"
end

def log_in
  sign_up

  visit '/welcome'
  click_on 'Log in'
  fill_in 'email', with: "bean@gmail.com"
  fill_in 'password', with: 'password'
  click_on 'Log in'
end

def sign_up_2
  visit "/welcome"
  click_on "Sign up"
  fill_in "first_name", with: "Sam"
  fill_in "last_name", with: "F"
  fill_in "email", with: "sam@example.com"
  fill_in "password", with: "password"
  fill_in "confirm_password", with: "password"

  click_on "Submit"
end

def log_in_2
  sign_up

  visit '/welcome'
  click_on 'Log in'
  fill_in 'email', with: "sam@example.com"
  fill_in 'password', with: 'password'
  click_on 'Log in'
end

class SignupPage < Howitzer::Web::Page
  path '/users/sign_up'
  validate :title, 'Demo web application - Sign Up'

  element :user_name, '#user_name'
  element :email, '#user_email'
  element :password, '#user_password'
  element :password_confirmation, '#user_password_confirmation'
  element :submit, 'input[name="commit"]'

  def sign_user_up signup_hash
    user_name_element.set signup_hash[:user_name]
    email.element.set signup_hash[:email]
    password_element.set signup_hash[:password]
    password_confirmation_element.set signup_hash[:password]

    byebug
    submit_element.click
  end
end

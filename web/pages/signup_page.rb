class SignupPage < Howitzer::Web::Page
  path '/users/sign_up'
  validate :title, 'Demo web application - Sign Up'

  element :user_name, '#user_name'
  element :email, '#user_email'
  element :password, '#user_password'
  element :password_confirmation, '#user_password_confirmation'
  element :submit, 'input[name="commit"]'

  def fill_form(user_name: nil, email: nil, password: nil, password_confirmation: nil)
    user_name_element.set(user_name) unless user_name.nil?
    email_element.set(email) unless email.nil?
    password_element.set(password) unless password.nil?
    password_confirmation_element.set(password_confirmation) unless password_confirmation.nil?
  end

  def submit_form
    submit_element.click
  end
end

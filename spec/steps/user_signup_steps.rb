# frozen_string_literal: true

module UserSignup
  attr_accessor :user

  step 'I am on home page' do
    HomePage.open
  end

  step 'I click sign up menu item on home page' do
    HomePage.on { main_menu_section.signup}
  end

  step 'I redirected to sign up page' do
    expect(SignupPage).to be_displayed
  end

  step 'I am on sign up page' do
    SignupPage.open
  end

  step 'I fill in sign up form with correct user\'s name, email, password and submit it' do
    # s = self
    # self.user = build(:user)
    @user = build(:user)
    SignupPage.on do
      user = out(:@user)
      fill_form(user_name: user.name,
                email: user.email,
                password: user.password,
                password_confirmation: user.password)
      Howitzer::Log.info "user_name: #{user.name}, email: #{user.email}"

      submit_form
    end
  end

  step 'I see info on home page that confirmation link has been sent to email address' do
    HomePage.on { is_expected.to be_signup_confirmation_link_sent }
  end

  step 'I am not logged to the system' do
    HomePage.on { expect(main_menu_section).to be_logged_out }
  end

  step 'I have received confirmation email' do
    ConfirmationInstructionEmail
        .find_by_recipient(@user.email)
  end

  step 'I confirm account from confirmation email' do
    ConfirmationInstructionEmail
        .find_by_recipient(@user.email)
        .confirm_my_account
  end

  step 'I see on login page notification that account was successfully confirmed' do
    LoginPage.on { expect(text).to include('Your account was successfully confirmed.') }
  end

  step 'I fill and submit form on login page with correct data' do
    login_hash = { login: @user.email, password: @user.password, remember: false }
    LoginPage.on { log_user_in(login_hash) }
  end

  step 'I should be logged to the system' do
    HomePage.on { expect(main_menu_section).to be_logged_in }
  end
end

RSpec.configure { |c| c.include UserSignup }
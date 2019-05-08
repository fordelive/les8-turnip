# frozen_string_literal: true

module UserLogin
  step 'User opens Login page' do
    LoginPage.open
  end

  step 'User logs in with :login login and :password password and :remember remember me checkbox' do |login, password, remember|
    login_hash = { login: resolve_login(login), password: resolve_password(password), remember: 'checked'.match?(remember) }
    LoginPage.on { log_user_in(login_hash) }
  end

  step 'Login should be :state' do |state|
    case state
    when 'successful'
      HomePage.on { expect(main_menu_section).to be_login_successful }
    when 'failed'
      LoginPage.on { is_expected.to be_login_failed }
    end
  end
end

RSpec.configure { |c| c.include UserLogin }
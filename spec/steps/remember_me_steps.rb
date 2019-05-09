module RememberMeSteps
  step 'User is logged in with :correct login and :correct password and :checked remember me' do |login, password, remember|
    LoginPage.open
    login_hash = { login: resolve_login(login), password: resolve_password(password), remember: 'checked'.match?(remember) }
    LoginPage.on { log_user_in(login_hash) }

    HomePage.on { expect(main_menu_section).to be_login_successful }
  end

  step 'User reopens Home page with reopening browser' do
    session_cookies = Capybara.page.driver.browser.manage.all_cookies
    Capybara.current_session.reset_session!

    HomePage.open
    HomePage.on {driver.browser.manage.delete_all_cookies}

    session_cookies.each {|cookie| HomePage.on {driver.browser.manage.add_cookie(cookie)}}
    HomePage.on { reload }
  end

  step 'User is logged in' do
    HomePage.on { expect(main_menu_section).to be_login_successful }
  end

  step 'User logs out' do
    HomePage.on {main_menu_section.logout}
  end

  step 'User is logged out' do
    HomePage.on { expect(main_menu_section).to be_logout_successful }
  end
end

RSpec.configure { |c| c.include RememberMeSteps }
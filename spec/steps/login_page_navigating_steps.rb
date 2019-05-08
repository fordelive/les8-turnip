# frozen_string_literal: true

module LoginPageNavigating
  step 'User opens Home page' do
    HomePage.open
    sleep 1
  end

  step 'User clicks Login menu item' do
    HomePage.on { main_menu_section.login }
  end

  step 'Login page is opened' do
    expect(LoginPage).to be_displayed
  end
end

RSpec.configure { |c| c.include LoginPageNavigating }
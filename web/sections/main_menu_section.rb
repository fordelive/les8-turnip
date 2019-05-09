# This class is example of section
class MainMenuSection < Howitzer::Web::Section
  me 'div.navigation__wrapper'

  element :log_in, :link, 'Login'
  element :log_out, :link, 'Logout'

  def login
    Howitzer::Log.info 'Log in'
    log_in_element.click
  end

  def logout
    Howitzer::Log.info 'Log out'
    log_out_element.click
  end

  def login_successful?
    log_out_element.visible?
  end

  def logout_successful?
    log_in_element.visible?
  end
end

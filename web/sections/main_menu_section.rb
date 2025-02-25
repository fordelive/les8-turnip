# This class is example of section
class MainMenuSection < Howitzer::Web::Section
  me 'div.navigation__wrapper'

  element :log_in, :link, 'Login'
  element :log_out, :link, 'Logout'
  element :sign_up, :link, 'Sign up'

  def login
    Howitzer::Log.info 'Log in'
    log_in_element.click
  end

  def logged_in?
    log_out_element.visible?
  end

  def logout
    Howitzer::Log.info 'Log out'
    log_out_element.click
  end

  def logged_out?
    log_in_element.visible?
  end

  def signup
    sign_up_element.click
  end
end

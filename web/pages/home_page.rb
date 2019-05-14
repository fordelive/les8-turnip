class HomePage < Howitzer::Web::Page
  path '/'
  validate :url, %r{\A(?:.*?:\/\/)?[^\/]*\/?\z}

  section :main_menu

  element :confirmation_link, :xpath,
          "//span[text()='A message with a confirmation link has been sent to your email address. " \
          "Please open the link to activate your account.']"

  def signup_confirmation_link_sent?
    confirmation_link_element.visible?
  end
end

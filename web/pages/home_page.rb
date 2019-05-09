class HomePage < Howitzer::Web::Page
  path '/'
  validate :url, %r{\A(?:.*?:\/\/)?[^\/]*\/?\z}

  section :main_menu

  element :confirmation_link,
          :span, 'A message with a confirmation link has been sent to your email address. Please open the link to activate your account.'

  def signup_successful?
    confirmation_link_element.visible?
  end
end

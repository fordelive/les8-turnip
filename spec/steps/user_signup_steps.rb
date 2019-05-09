# frozen_string_literal: true

module UserSignup
  step 'User opens Signup page' do
    SignupPage.open
  end
end

RSpec.configure { |c| c.include UserSignup }
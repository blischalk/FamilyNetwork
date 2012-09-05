module RequestMacros
  def login_user
    visit new_user_session_path
    fill_in "user[email]",     :with => "testuser@testuser.com"
    fill_in "user[password]",  :with => "foobar"
    click_button "Sign in"
  end
end

RSpec.configure do |config|
  config.include RequestMacros, type: :request
end

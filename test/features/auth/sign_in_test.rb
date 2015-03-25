require "test_helper"

feature "As a User with an account I should be able to sign in" do
  scenario "Click sign in" do

    #Given A user signs in
    visit '/'
    click_on "Login"

    #When the user name and password is correct
    fill_in "Email", with: users(:mackey).email
    fill_in "Password", with: "password"
    click_on 'Log in'

    #Then the page renders a correspoding sign out link
    page.must_have_content "Signed"
  end

  scenario "sign in with twitter works" do
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:twitter,
                          {
                          uid: '12345',
                          info: { nickname: 'test_twitter_user'},
                          })
  visit root_path
  Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
  Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

  click_on "Sign in with Twitter"
  page.must_have_content "Logged in as test_twitter_user"
  end
end


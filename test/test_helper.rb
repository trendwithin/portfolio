ENV["RAILS_ENV"] = "test"
#Rails.env = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
 require "minitest/rails/capybara"
 #require "capybara/poltergeist"
# Uncomment for awesome colorful output
 require "minitest/pride"

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  #Capybara.javascript_driver = :poltergeist

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions
end

def sign_in(role = :editor)
  visit new_user_session_path
  fill_in "Email", with: users(role).email
  fill_in "Password", with: "password"
  click_on "Log in"
end

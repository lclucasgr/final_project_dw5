ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  #include ApplicationHelper

  # Add more helper methods to be used by all tests here...

  def is_admin_logged_in?
    !session[:admin_id].nil?
  end

  def log_in_as_admin(admin)
    session[:admin_id] = admin.id
  end

end
  class ActionDispatch::IntegrationTest

 
  def log_in_as_admin(admin, password: 'password')
    post admin_session_path, params: { session: { email: admin.email,
                                          password: admin.password
                                           } }
  end
end

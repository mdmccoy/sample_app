require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  test 'should get new' do
    get login_path
    assert_response :success
  end
end

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: '',
                                          email: 'user@invalid',
                                          password: 'foo',
                                          password_confirmation: 'bar' } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end

  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', +1 do
      post signup_path, params: { user: { name: 'Valid User',
                                          email: 'valid@user.com',
                                          password: 'foobar',
                                          password_confirmation: 'foobar' } }
      follow_redirect!
      assert_template 'users/show'
      # assert_select '.alert-success'
      assert_not flash.empty?
    end
  end
end

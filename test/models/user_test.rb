require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'Example User', email: 'example@user.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'is present' do
    @user.name = '    '
    assert_not @user.valid?
  end
end

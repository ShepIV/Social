require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'not save' do
    user = User.new
    assert_not user.save, 'Saved the article without a title'
  end
end

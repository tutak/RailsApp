require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: "",
                            email: "invalid@email",
                            password: "foo",
                            password_confirmation: "bar"
      }
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name: "Example user",
                                          email: "valid@email.com",
                                          password: "password",
                                          password_confirmation: "password"
      }
    end
  end
end

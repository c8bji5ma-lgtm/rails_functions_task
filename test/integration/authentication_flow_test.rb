require 'test_helper'

class AuthenticationFlowTest < ActionDispatch::IntegrationTest
  test 'user can sign up, view their profile, log out, and log in again' do
    assert_difference('User.count', 1) do
      post users_path, params: {
        user: {
          name: 'Sample User',
          email: 'sample@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    user = User.order(:id).last
    assert_redirected_to user_path(user)

    follow_redirect!
    assert_response :success
    assert_includes response.body, 'Sample User'
    assert_includes response.body, 'sample@example.com'

    delete session_path(user)
    assert_redirected_to new_session_path

    get user_path(user)
    assert_redirected_to new_session_path

    post sessions_path, params: {
      session: { email: 'SAMPLE@EXAMPLE.COM', password: 'password' }
    }
    assert_redirected_to user_path(user)
  end
end

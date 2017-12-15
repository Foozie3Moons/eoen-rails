require 'test_helper'

class AuthTest < Capybara::Rails::TestCase
  def setup
    @user = create(:user)
  end

  test 'signup' do
    visit root_path

    click_on 'Sign Up'

    fill_in 'First_name', with: @user.first_name
    fill_in 'Last Name',  with: @user.last_name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_on 'Sign Up'

    assert_current_path post_path(User.last)
    assert page.has_content?(@user.first_name)
  end


  test 'login' do
    visit login_path

    assert page.has_content?(@user.first_name)
  end
end

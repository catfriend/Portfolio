require "test_helper"

feature "Auth::SignIn" do
  # When I return to a site I am already registered for I want to be able to sign in
  scenario "sign in" do
    visit root_path
    click_on "Sign In"
    # When I enter my login credentials
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    # Then I should be logged in
    page.must_have_content "Welcome Back!"
    page.wont_have_content "Goobye All!"
  end

  scenario "authorized user" do
      # Given an authorized user completes a new post form
  visit new_user_session_path
  fill_in "Email", with: users(:one).email
  fill_in "Password", with: "password"
  within(:css, "div#old_user_button") do
      click_on "Sign In"
  end

  scenario "sign in with facebook works" do
      visit root_path
      click on "Sign In"
      OmniAuth.config.test_mode = true
      Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
      Capybara.current_sesion.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
      OmniAuth.confi.add_mock(:facebook,
                              {
                              uid: '12345',
                              info: { nickname: 'test_facebook_user'},
                                })
      click_on "Sign in with Facebook"
      save_and_open_page
      page.must_have_content "test_facebook_user, you are signed in!"
  end
end

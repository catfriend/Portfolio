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

        # Given an authorized user completes a new post form
    visit new_user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_on "Sign In"
    visit new_post_path

  end
end

require "test_helper"

feature "Auth::SignOut" do
  scenario "When the user is done visiting the site the user needs to be able to log out" do
    # Given a logout page
    visit destroy_user_session_path
    click_on "Sign Out"
    # Then I should be logged out and the session destroyed


    page.must_have_content "You have now logged out"
    page.wont_have_content "Welcome!"
  end
end

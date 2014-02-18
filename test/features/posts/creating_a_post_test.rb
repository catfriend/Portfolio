require "test_helper"

feature "CreatingAPost" do
  scenario "submit form data to create a new post" do

        # Given an authorized user completes a new post form
    visit new_user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_on "Sign In"
    visit new_post_path
    # Given a completed new post form

    fill_in "Title", with: posts(:strangelove).title
    fill_in "Body", with: posts(:strangelove).body
    #When I submit the form
    click_on "Create Post"
    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:strangelove).title



    page.has_css? "#author"
    page.text.must_include users(:one).email
  end
end

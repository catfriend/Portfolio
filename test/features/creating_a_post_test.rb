require "test_helper"

feature "CreatingAPost" do
  scenario "submit form data to create a new post" do
    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:strangelove).title
    fill_in "Body", with: posts(:strangelove).body
    #When I submit the form
    click_on "Create Post"
    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:strangelove).title
  end
end

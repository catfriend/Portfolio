require "test_helper"

feature "CreatingAPost" do
  scenario "submit form data to create a new post" do

        # Given an authorized user completes a new post form
    sign_in(:author)

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
    page.text.must_include "Status: Unpublished"



    page.has_css? "#author"
    page.text.must_include users(:one).email
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site visitors cannot see new post button" do
    # When I visit the blog index page
    visit posts_path
    # Then I should not see the "New Post" button
    page.wont_have_link_ "New Post"
  end

  scenario "authors can't publish" do
    # Given an author's account
    sign_in(:author)

    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for published
    page.must_have_field('Published')

    # When I submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"

    # Then the published post should be shown
    page.text.must_include "Status: Published"
  end
end

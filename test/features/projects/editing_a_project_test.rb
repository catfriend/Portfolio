require "test_helper"

feature "As the site owner, I want to edit a project so that others do not see what an idiot I am" do
  scenario "editing an existing project" do
    # Given an existing project
    visit project_path(projects(:portfolio))

    # When I make changes
    fill_in "Name", with: "My Fantabulous Portfolio"
    click_on "Update Project"

    # Then the changes should be saved and shown
    page.must_include "Success"
    page.must_include "Fantabulous Portfolio"
    page.wont_include "Code Fellows Portfolio"
  end

  scenario "incorrectly editing an existing project" do
    # Given and existing project
    visit edit_project_path(projects(:portfolio))

    # When I submit invalid changes
    fill_in "Name", with: "Err"
    click_on "Update Project"

    # Then the changes should not be saved, and I should get to try again
    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end
end

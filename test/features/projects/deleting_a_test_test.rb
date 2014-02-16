require "test_helper"

feature "As the site owner, I want to be able to delete a project if the mood strikes me" do
  scenario "delete an exisiting project" do

    # Given an existing project
    visit project_path

    # When I want to delete a project
    click_on "Destroy"

    # Then the project should be delete
    page.text.must_include "Deleted"
  end
end
